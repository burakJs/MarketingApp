import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../base/bloc/product_bloc.dart';
import '../../base/functions/base_functions.dart';
import '../../base/model/product_model.dart';
import '../../constants/app/color_constants.dart';
import '../../extensions/num_extensions.dart';
import '../../init/locale_storage/locale_storage_manager.dart';
import '../text/custom_text.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductModel? productModel;

  const ProductCardWidget({Key? key, this.productModel}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isLike = false;
  late ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var favorites = await LocalStorageManager.getStringList("favorites");

      isLike = favorites != null ? favorites.contains(widget.productModel!.id.toString()) : false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(ProductDetailRoute(productModel: widget.productModel!)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.border.lowBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.sized.dynamicWidth(0.7),
                  height: 15.h + 20,
                  child: ClipRRect(
                    borderRadius: context.border.lowBorderRadius,
                    child: Image.network(
                      widget.productModel!.images!.first,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 37,
                    margin: EdgeInsets.all(1.w),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 1)]),
                    child: IconButton(
                      splashColor: Colors.white,
                      icon: isLike
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey,
                            ),
                      onPressed: () async {
                        setState(() {
                          isLike = !isLike;
                        });
                        _productBloc.add(AddOrRemoveProductFromFavorites(widget.productModel!.id.toString(), context));
                      },
                    ),
                  ),
                ),
              ],
            ),
            1.h.ph,
            CustomText(
              BaseFunctions.instance?.toShortString(widget.productModel?.title!, countCharacter: 16),
              textStyle: context.general.textTheme.titleMedium!.copyWith(
                color: ColorConstants.instance?.mainColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            0.1.h.ph,
            CustomText(
              '\$${widget.productModel?.price}',
              textStyle: context.general.textTheme.titleLarge?.copyWith(color: ColorConstants.instance?.mainColor),
            ),
            0.1.h.ph,
          ],
        ),
      ),
    );
  }
}

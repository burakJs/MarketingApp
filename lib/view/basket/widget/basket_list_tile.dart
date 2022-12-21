import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/bloc/product_bloc.dart';
import '../../../core/base/model/product_model.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/color_constants.dart';
import '../../../core/extensions/num_extensions.dart';

class BasketListTileWidget extends StatefulWidget {
  const BasketListTileWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<BasketListTileWidget> createState() => _BasketListTileWidgetState();
}

class _BasketListTileWidgetState extends State<BasketListTileWidget> {
  late ProductBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<ProductBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          InkWell(
            onTap: () => _bloc.add(RemoveProductFromBasket(widget.productModel.id.toString())),
            child: Container(
              width: context.dynamicWidth(0.3),
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  CustomText(
                    "Sil",
                    textStyle: context.textTheme.headline6?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      child: Container(
        width: context.dynamicWidth(0.85),
        height: context.dynamicHeight(0.13),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: context.lowBorderRadius),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              2.w.pw,
              ClipRRect(
                borderRadius: context.lowBorderRadius,
                child: Image.network(
                  widget.productModel.images!.first,
                  width: 100,
                  height: 90,
                ),
              ),
              5.w.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    widget.productModel.title,
                    textStyle: context.textTheme.headline6?.copyWith(
                      color: ColorConstants.instance?.mainColor,
                    ),
                  ),
                  2.h.ph,
                  CustomText(
                    "\$ ${widget.productModel.price}",
                    textStyle: context.textTheme.headline6?.copyWith(
                      color: ColorConstants.instance?.mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset("assets/svg/swap.svg")
        ]),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/components/appbar/appbar.dart';
import '../../core/components/notFound/notFound.dart';
import '../../core/components/productCard/product_card.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';

@RoutePage()
class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late ProductBloc _productBloc;
  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    _productBloc.add(FetchAllFavoritesProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Favorites", isThereLeading: false),
        4.h.ph,
        BlocConsumer<ProductBloc, ProductState>(
          bloc: _productBloc,
          buildWhen: (previousState, currentState) {
            return currentState is ProductsLoaded ||
                currentState is ProductsLoading ||
                currentState is ProductLoadError;
          },
          listener: (context, state) {
            if (state is UpdatedBasket) {
              _productBloc.add(FetchAllFavoritesProducts());
            }
          },
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return state.productList.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 230,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.productList[index];
                        return ProductCardWidget(productModel: item);
                      },
                    )
                  : Column(
                      children: [
                        const NotFoundProductWidget(),
                        2.h.ph,
                        CustomText(
                          "Favorilerde Ürün Bulunmamaktadır",
                          textStyle:
                              context.general.textTheme.headline6?.copyWith(color: ColorConstants.instance?.mainColor),
                        ),
                      ],
                    );
            }
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoadError) {
              return Center(child: CustomText(state.errorMessage));
            }
            return const Center(child: CustomText("Undefined Error"));
          },
        )
      ],
    );
  }
}

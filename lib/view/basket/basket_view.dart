import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/components/appbar/appbar.dart';
import '../../core/components/button/button.dart';
import '../../core/components/notFound/notFound.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';
import 'widget/basket_list_tile.dart';

@RoutePage()
class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  late ProductBloc _basketBloc;

  @override
  void initState() {
    _basketBloc = context.read<ProductBloc>();
    _basketBloc.add(FetchAllBasketProducts());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Basket", isThereLeading: false),
        2.h.ph,
        SizedBox(
            height: context.sized.dynamicHeight(0.65),
            child: BlocConsumer<ProductBloc, ProductState>(
              bloc: _basketBloc,
              buildWhen: (previousState, currentState) {
                return currentState is ProductsLoaded ||
                    currentState is ProductsLoading ||
                    currentState is ProductLoadError;
              },
              listener: (context, state) {
                if (state is UpdatedBasket) {
                  _basketBloc.add(FetchAllBasketProducts());
                }
              },
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return state.productList.isNotEmpty
                      ? Column(
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.productList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                var item = state.productList[index];
                                return Padding(
                                  padding: context.padding.verticalLow,
                                  child: BasketListTileWidget(productModel: item),
                                );
                              },
                            ),
                            ButtonWidget(
                              onTap: () => context.router.push(const PaymentRoute()),
                              buttonColor: Colors.teal,
                              text: "Devam Et",
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            const NotFoundProductWidget(),
                            2.h.ph,
                            CustomText(
                              "Sepette Ürün Bulunmamaktadır",
                              textStyle: context.general.textTheme.headline6
                                  ?.copyWith(color: ColorConstants.instance?.mainColor),
                            ),
                          ],
                        );
                }
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductLoadError) {
                  return CustomText(state.toString());
                }

                return const Center(child: CustomText("Undefined Error"));
              },
            )),
      ],
    );
  }
}

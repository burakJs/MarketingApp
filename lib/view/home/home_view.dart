import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/base/service/product_service.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/components/textFormField/text_form_field_widget.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/network/network_manager.dart';
import '../product/productCollection/product_collection.dart';
import '../product/productList/product_list.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchKeyController = TextEditingController();
  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = ProductBloc(ProductService(VexanaManager()));
    productBloc.add(FetchAllProducts());
    _searchKeyController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _searchField(context),
        2.h.ph,
        Row(
          children: [
            CustomText(
              "Top Products",
              textStyle: context.general.textTheme.headline5
                  ?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        1.h.ph,
        _productGridView(context),
      ],
    );
  }

  Row _searchField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormFieldWidget(
          textEditingController: _searchKeyController,
          width: 0.75,
          borderRadius: 30,
          borderWidth: 0,
          hintText: "Search Product ...",
          hintTextFontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        IconButton(
            padding: const EdgeInsets.only(top: 30),
            onPressed: () => context.router.push(SearchProductRoute(word: _searchKeyController.text)),
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
      ],
    );
  }

/*
  SizedBox _productListView(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.15),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _discoverContainer(context);
        },
      ),
    );
  }
*/
  Widget _productGridView(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: context.sized.dynamicWidth(1),
      child: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ProductList(ProductCollection(state.productList));
          }
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoadError) {
            return CustomText(state.errorMessage);
          }
          return CustomText("Undefined error");
        },
      ),
    );
  }
}

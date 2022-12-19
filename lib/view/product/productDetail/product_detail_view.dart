import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/appbar/appbar.dart';
import '../../../core/components/button/button.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/color_constants.dart';
import '../../../core/extensions/num_extensions.dart';
import 'widget/image_slider.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "Product Detail"),
        body: SizedBox(
          width: context.dynamicWidth(1),
          height: context.dynamicHeight(1),
          child: Column(
            children: [
              5.h.ph,
              ImageSlideWidget(
                images: ["https://i.dummyjson.com/data/products/100/1.jpg", "https://i.dummyjson.com/data/products/100/2.jpg"],
              ),
              4.h.ph,
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          "Title",
                          textStyle: context.textTheme.headline4?.copyWith(color: ColorConstants.instance?.mainColor),
                        ),
                      ],
                    ),
                    2.h.ph,
                    Row(
                      children: [
                        SizedBox(
                          width: context.dynamicWidth(0.9),
                          child: CustomText(
                            "adssdaasdsdaddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaa",
                            maxLines: 3,
                            textStyle: context.textTheme.headline6?.copyWith(color: ColorConstants.instance?.cadetBlue),
                          ),
                        ),
                      ],
                    ),
                    5.h.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          "250 TL",
                          textStyle: context.textTheme.headline5?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    4.h.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart)),
                        ButtonWidget(
                          onTap: () {},
                          text: "Add To Basket",
                          buttonColor: ColorConstants.instance?.mainColor,
                          width: 0.5,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
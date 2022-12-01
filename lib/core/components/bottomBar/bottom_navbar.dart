import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketing_app/core/components/text/custom_text.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key, required this.onChange});
  final Function(int index) onChange;
  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        widget.onChange.call(i);
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const FaIcon(FontAwesomeIcons.house),
          title: const CustomText("Ana Sayfa"),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          title: const CustomText("Keşfet"),
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(FontAwesomeIcons.heart),
          title: const CustomText("Favorilerim"),
          selectedColor: Colors.pink,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(FontAwesomeIcons.cartShopping),
          title: const CustomText("Sepet"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}

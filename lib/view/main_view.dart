import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/core/base/service/auth/auth_manager.dart';
import 'package:marketing_app/core/extensions/num_extensions.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../core/components/bottomBar/bottom_navbar.dart';
import '../core/components/scaffold/scaffold.dart';
import 'basket/basket_view.dart';
import 'discover/discover_view.dart';
import 'favorites/favorites_view.dart';
import 'home/home_view.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _pagesList = [const HomeView(), DiscoverView(), const FavoritesView(), const BasketView()];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isThereAppbar: true,
      isThereLeading: false,
      appbarTitle: AuthManager().currentUser!.email?.split('@').first,
      actions: [
        InkWell(
          onTap: () async {
            await AuthManager().logOut();
            if (!context.mounted) return;
            context.router.replace(const LoginRoute());
          },
          child: const CircleAvatar(child: Icon(Icons.logout)),
        ),
        3.w.pw,
      ],
      body: _pagesList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavbarWidget(onChange: (index) {
        _currentIndex = index;
        setState(() {});
      }),
    );
  }
}

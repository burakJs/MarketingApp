// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BasketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasketView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiscoverView(key: args.key),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    PaymentResultRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentResultView(),
      );
    },
    PaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentView(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailView(
          key: args.key,
          productModel: args.productModel,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterView(),
      );
    },
    SearchProductRoute.name: (routeData) {
      final args = routeData.argsAs<SearchProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchProductView(
          key: args.key,
          word: args.word,
          isCategoryName: args.isCategoryName,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [BasketView]
class BasketRoute extends PageRouteInfo<void> {
  const BasketRoute({List<PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverView]
class DiscoverRoute extends PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DiscoverRoute.name,
          args: DiscoverRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const PageInfo<DiscoverRouteArgs> page =
      PageInfo<DiscoverRouteArgs>(name);
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentResultView]
class PaymentResultRoute extends PageRouteInfo<void> {
  const PaymentResultRoute({List<PageRouteInfo>? children})
      : super(
          PaymentResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentResultRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentView]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailView]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required ProductModel productModel,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productModel: productModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productModel,
  });

  final Key? key;

  final ProductModel productModel;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productModel: $productModel}';
  }
}

/// generated route for
/// [RegisterView]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchProductView]
class SearchProductRoute extends PageRouteInfo<SearchProductRouteArgs> {
  SearchProductRoute({
    Key? key,
    required String word,
    bool isCategoryName = false,
    List<PageRouteInfo>? children,
  }) : super(
          SearchProductRoute.name,
          args: SearchProductRouteArgs(
            key: key,
            word: word,
            isCategoryName: isCategoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchProductRoute';

  static const PageInfo<SearchProductRouteArgs> page =
      PageInfo<SearchProductRouteArgs>(name);
}

class SearchProductRouteArgs {
  const SearchProductRouteArgs({
    this.key,
    required this.word,
    this.isCategoryName = false,
  });

  final Key? key;

  final String word;

  final bool isCategoryName;

  @override
  String toString() {
    return 'SearchProductRouteArgs{key: $key, word: $word, isCategoryName: $isCategoryName}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

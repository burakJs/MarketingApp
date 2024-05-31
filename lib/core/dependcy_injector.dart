import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_app/view/auth/login/view_model/login_bloc.dart';
import 'package:marketing_app/view/auth/register/view_model/register_bloc.dart';
import 'package:vexana/vexana.dart';

import 'base/bloc/product_bloc.dart';
import 'base/service/i_product_service.dart';
import 'base/service/product_service.dart';
import 'init/network/network_manager.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  late final IProductService _productService;
  late final ProductBloc _productBloc;
  late final LoginBloc _loginBloc;
  late final RegisterBloc _registerBloc;

  DependencyInjector._init() {
    networkManager = VexanaManager();
    _productService = ProductService(networkManager);
    _productBloc = ProductBloc(_productService);
    _loginBloc = LoginBloc();
    _registerBloc = RegisterBloc();
  }

  List<BlocProvider<Bloc>> get globalBlocProviders => [
        BlocProvider<ProductBloc>(create: (context) => _productBloc),
      ];
  List<BlocProvider<Cubit>> get globalCubitProviders => [
        BlocProvider<LoginBloc>(create: (context) => _loginBloc),
        BlocProvider<RegisterBloc>(create: (context) => _registerBloc),
      ];
}

// provider_setup.dart

import '../services/api/http_api.dart';
import '../services/auth/authentication_service.dart';
import '../services/connectivity/connectivity_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  //...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  // Provider(create: (_)async => DB()),

  ChangeNotifierProvider<ConnectivityService>(
      create: (context) => ConnectivityService()),
  Provider<HttpApi>(create: (c) => HttpApi(c)),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<HttpApi, AuthenticationService>(
      update: (context, api, authenticationService) =>
          AuthenticationService(api: api)),
];

List<SingleChildWidget> uiConsumableProviders = [
  // StreamProvider<User>(create: (context) => Provider.of<AuthenticationService>(context, listen: false).user),
];

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/routes/routes.dart';
import 'core/utils/provider_setup.dart';
import 'core/services/preference/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Routes.splash,
      ),
    );
  }
}

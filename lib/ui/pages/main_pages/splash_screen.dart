import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../core/services/api/api.dart';
//import '../../../core/services/auth/authentication_service.dart';
import '../../routes/routes.dart';
import '../../shared/ui.dart';
import '../../../core/services/api/http_api.dart';
import '../../widgets/customs/floating_widget.dart';
import '../../widgets/customs/crossfade_widget.dart';
import '../../widgets/buttons/normal_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool navigating = false;
  bool loading = true;
  //bool online = true;
  StreamSubscription apiStateSubscription;

  /* navigate(context) async {
    if (navigating) {
      return;
    }

    if (mounted) {
      setState(() {
        loading = true;
        navigating = true;
        //online =Provider.of<ConnectivityService>(context, listen: false).connected;
      });
    }
    final api = Provider.of<HttpApi>(context, listen: false);

    if (api.state != APIState.ready) {
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        setState(() {
          loading = false;
          navigating = false;
        });
      }
      return;
    }

    final auth = Provider.of<AuthenticationService>(context, listen: false);

    try {
      if (auth.userLoged) {
        if (true) {
          await Future.delayed(Duration(seconds: 1));
          UI.push(context, Routes.homePage, replace: true);
        } else {
          if (mounted) {
            setState(() {
              loading = false;
              navigating = false;
            });
          }
        }
      } else {
        await Future.delayed(Duration(seconds: 2));
        UI.push(context, Routes.signIn, replace: true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          loading = false;
          navigating = false;
        });
      }
    }
    loading = false;
    navigating = false;
  } */
  navigate(context) {
    UI.push(context, Routes.homePage, replace: true);
    setState(() {
      navigating = false;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    final api = Provider.of<HttpApi>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      navigate(context);
      apiStateSubscription = api.stateChange.listen((state) async {
        if (state == APIState.ready) {
          navigate(context);
        }
      });

      Future.delayed(Duration(seconds: 10), () {
        if (mounted) {
          setState(() {
            //online = false;
            loading = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    apiStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomAnimatedCrossFade(
          showFirst: loading,
          fisrt: loadingWidget(),
          secound: offlineWidget(
            context,
          )),
    );
  }

  offlineWidget(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingWidget(
          child:
              Icon(Icons.portable_wifi_off, size: 130, color: Colors.grey[800]),
        ),
        Text(
          ('Error connecting to the network'),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[800], fontSize: 20),
        ),
        SizedBox(height: 10),
        NormalButton(
            height: 39,
            width: 190,
            text: 'try again',
            onPressed: () => navigate(context)),
      ],
    );
  }

  loadingWidget() {
    return Text("loading");
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../core/services/api/api.dart';
import '../../../core/services/auth/authentication_service.dart';
import '../../routes/routes.dart';
import '../../shared/ui.dart';
import '../../../core/services/api/http_api.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool navigating = false;
  bool loading = true;
  StreamSubscription apiStateSubscription;

  navigate(context) async {
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

    final auth = Provider.of<AuthenticationService>(context, listen: false);

    try {
      if (auth.userLoged) {
        await Future.delayed(Duration(seconds: 1));
        UI.push(context, Routes.homePage, replace: true);
        /* else {
          if (mounted) {
            setState(() {
              loading = false;
              navigating = false;
            });
          }
        } */
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
        child: Stack(
      children: [
        Image.asset(
          "assets/images/cover_page.jpg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/images/logo02.png",
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}

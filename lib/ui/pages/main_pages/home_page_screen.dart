import 'package:flutter/material.dart';
import 'package:override_test/core/page_models/main_pages_models/home_model.dart';
import 'package:override_test/ui/shared/base_widget.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: HomeModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: (model.user == null)
              ? Text("home")
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.user.id),
                    Text(model.user.email),
                    Text(model.user.userToken),
                    Text(model.user.firstName),
                    Text(model.user.lastName),
                  ],
                ),
        ),
      ),
    );
  }
}

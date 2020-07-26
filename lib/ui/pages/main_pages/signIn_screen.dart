import 'package:flutter/material.dart';

import '../../widgets/customs/custom_text_field.dart';
import '../../../core/page_models/main_pages_models/signin_model.dart';
import '../../shared/base_widget.dart';
import '../../widgets/buttons/normal_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: SignInModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/cover_page.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/logo02.png",
                  ),
                  CustomTextField(
                    controller: model.email,
                    hint: "Enter your email",
                  ),
                  CustomTextField(
                    controller: model.password,
                    hint: "Enter your password",
                  ),
                  NormalButton(
                    onPressed: () => model.signIn(context),
                    busy: model.busy,
                    text: "Login",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  FlatButton(
                      onPressed: () => model.signUp(context),
                      child: Text("Don\'t have an account? Sign up"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

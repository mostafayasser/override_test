import 'package:flutter/material.dart';

import '../../widgets/customs/custom_text_field.dart';
import '../../../core/page_models/main_pages_models/signup_model.dart';
import '../../shared/base_widget.dart';
import '../../widgets/buttons/normal_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: SignUpModel(),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  CustomTextField(
                    controller: model.firstNameAr,
                    hint: "First name ar",
                  ),
                  CustomTextField(
                    controller: model.firstNameEn,
                    hint: "First name en",
                  ),
                  CustomTextField(
                    controller: model.lastNameAr,
                    hint: "Last name ar",
                  ),
                  CustomTextField(
                    controller: model.lastNameEn,
                    hint: "Last name en",
                  ),
                  CustomTextField(
                    controller: model.email,
                    hint: "email",
                  ),
                  CustomTextField(
                    controller: model.password,
                    hint: "password",
                    secure: true,
                  ),
                  NormalButton(
                    onPressed: () => model.onPressSignup(context),
                    busy: model.busy,
                    text: "Register",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../../services/api/http_api.dart';
import '../../../ui/shared/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../ui/shared/base_notifier.dart';

class SignUpModel extends BaseNotifier {
  TextEditingController firstNameAr = TextEditingController();
  TextEditingController firstNameEn = TextEditingController();
  TextEditingController lastNameAr = TextEditingController();
  TextEditingController lastNameEn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String workType = 'design';
  onPressSignup(context) async {
    setBusy(true);
    try {
      if (firstNameAr.text.isEmpty ||
          firstNameEn.text.isEmpty ||
          lastNameAr.text.isEmpty ||
          lastNameEn.text.isEmpty ||
          email.text.isEmpty ||
          password.text.isEmpty) {
        UI.dialog(context: context, title: ('failed'), msg: ('empty'));
      } else {
        final sent = await Provider.of<HttpApi>(context, listen: false).signUp(
            firstNameAr: firstNameAr.text,
            firstNameEn: firstNameEn.text,
            lastNameAr: lastNameAr.text,
            lastNameEn: lastNameEn.text,
            email: email.text,
            password: password.text);

        if (!sent) {
          UI.dialog(context: context, title: 'failed', msg: '');
          setBusy(false);
          return;
        } else {
          if (mounted) {
            Navigator.pop(context);
          }
          UI.dialog(
              context: context,
              title: ('Request sent'),
              msg: ('we will contact you as soon as possible'));
        }
      }
    } catch (e) {}
    setBusy(false);
  }
}

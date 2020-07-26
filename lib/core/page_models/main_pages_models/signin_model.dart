//import '../../services/auth/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../services/api/http_api.dart';
import '../../../ui/routes/routes.dart';
import '../../../ui/shared/base_notifier.dart';
import '../../../ui/shared/ui.dart';

class SignInModel extends BaseNotifier {
  List<String> images = [];
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn(BuildContext context) async {
    setBusy(true);
    final api = Provider.of<HttpApi>(context, listen: false);
    await api.signIn(username: email.text, password: password.text);

    setBusy(false);
    UI.push(context, Routes.homePage);

    setBusy(false);
  }

  signUp(BuildContext context) {
    UI.push(context, Routes.signUp);
  }
}

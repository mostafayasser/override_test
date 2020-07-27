import '../../services/auth/authentication_service.dart';
import '../../../ui/shared/base_notifier.dart';

import '../../models/user.dart';

class HomeModel extends BaseNotifier {
  AuthenticationService _auth = AuthenticationService();
  User get user => _auth.user;
}

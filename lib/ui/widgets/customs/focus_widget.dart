import 'package:flutter/material.dart';

class FocusWidget extends StatelessWidget {
  final Widget child;
  const FocusWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: child);
  }
}

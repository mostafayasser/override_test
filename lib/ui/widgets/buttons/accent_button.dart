import '../../shared/styles/colors.dart';
import 'package:flutter/material.dart';

class AccentButton extends StatelessWidget {
  final bool localize;
  final double width;
  final double height;
  final String text;
  final EdgeInsets margin;
  final Function onPressed;
  const AccentButton(
      {Key key,
      this.localize = true,
      this.onPressed,
      this.text = 'ok',
      this.width = 322,
      this.height = 46,
      this.margin = const EdgeInsets.only(top: 22)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: FlatButton(
        onPressed: onPressed,
        color: Color.fromARGB(255, 249, 242, 183),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(23)),
        ),
        textColor: Color.fromARGB(255, 209, 165, 75),
        // padding: EdgeInsets.all(0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
                fontSize: 20)),
      ),
    );
  }
}

import '../../shared/styles/borders.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final bool localize;
  final double width;
  final double height;
  final String text;
  final Function onPressed;
  const TransparentButton(
      {Key key,
      this.localize = true,
      this.onPressed,
      this.text,
      this.width = 84,
      this.height = 28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(0),
        color: AppColors.primaryElement,
        textColor: Color.fromARGB(255, 209, 165, 75),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.secondaryText, fontSize: 16)),
        shape: RoundedRectangleBorder(
            side: Borders.primaryBorder,
            borderRadius: BorderRadius.all(Radius.circular(33))),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final bool localize;
  final bool busy;
  final double width;
  final double height;
  final String text;
  final Gradient gradient;
  final EdgeInsets margin;
  final Function onPressed;
  const NormalButton(
      {Key key,
      this.busy = false,
      this.gradient,
      this.localize = true,
      this.onPressed,
      this.text = 'ok',
      this.width = 322,
      this.height = 46,
      this.margin = const EdgeInsets.only(top: 22)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: busy ? (width / 2) : width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.lightBlue[700], width: 2),
          gradient: gradient == null
              ? (LinearGradient(colors: [Color(0xff82A2FE), Color(0xff6285FD)]))
              : gradient),
      child: busy
          ? Center(child: CircularProgressIndicator())
          : FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34)),
              onPressed: () => onPressed == null ? {} : onPressed(),
              child: Ink(
                child: Container(
                    width: width,
                    height: height,
                    alignment: Alignment.center,
                    child: Text(text,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: gradient == null
                                ? Colors.white
                                : Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal))),
              ),
            ),
    );
  }
}

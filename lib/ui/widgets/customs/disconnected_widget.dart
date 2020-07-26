import 'package:flutter/material.dart';

import 'floating_widget.dart';
import 'image_button.dart';

class DisconnectedWidget extends StatelessWidget {
  final double height;
  final double padding;
  final Function onPressed;
  const DisconnectedWidget(
      {this.height = 800, this.padding = 500, this.onPressed, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.3), shape: BoxShape.circle),
            child: FloatingWidget(
              child: Text('data'),
            ),
          ),
          Text('No connection',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          Text('Please check connection and try again',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black38)),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ImageButton(
              // width: portrait ? null : ScreenUtil.width(300),
              onPressed: onPressed,
              background: Text('background'),
              highlightColor: Colors.white,
              child: Center(
                  child: Text('Try again',
                      style: Theme.of(context).textTheme.body2)),
            ),
          ),
        ],
      ),
    );
  }
}

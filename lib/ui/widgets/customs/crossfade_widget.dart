import 'package:flutter/material.dart';

class CustomAnimatedCrossFade extends StatelessWidget {
  final bool showFirst;
  final bool isCenter;
  final Widget secound;
  final Widget fisrt;

  const CustomAnimatedCrossFade({Key key, this.fisrt, this.showFirst, this.isCenter = true, this.secound}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      layoutBuilder: (Widget topChild, Key topKey, Widget bottomChild, Key bottomKey) {
        return Stack(
          alignment: isCenter ? Alignment.center : Alignment.topCenter,
          children: <Widget>[
            Positioned(
              child: bottomChild,
              key: bottomKey,
            ),
            Positioned(child: topChild, key: topKey),
          ],
        );
      },
      firstChild: fisrt ??
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
      secondChild: secound,
      crossFadeState: showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 500),
    );
  }
}

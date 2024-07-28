import 'package:flutter/material.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';

class ShadowContainer extends StatelessWidget {
  ShadowContainer({
    Key? key,
    this.width = double.infinity,
    required this.child,
  }) : super(key: key);

  final Widget child;
  double? width;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.all(getHorizontalSize(15)),
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}

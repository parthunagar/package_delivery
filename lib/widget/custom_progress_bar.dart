
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_delivery/Constant/colors.dart';

class CustomProgressBar extends StatefulWidget {
  Color? color;
  double? strokeWidth;
  CustomProgressBar({Key? key,this.color,this.strokeWidth}) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: widget.strokeWidth ?? 4,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.color ?? cBluewithOpacity,
        ),
      ),
    );
  }
}

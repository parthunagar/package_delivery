import 'package:flutter/material.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';

class CustomButton extends StatefulWidget {
  String? title;
  Color? backgroundColor;
  Color? conteinerbackgroundColor;
  Color? primary;
  var onPressed;
  var padding;
  TextStyle? textStyle;
  CustomButton({Key? key,this.title,this.backgroundColor,this.primary,this.onPressed,this.padding,this.textStyle,this.conteinerbackgroundColor}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: widget.conteinerbackgroundColor??cDarkBlue,//Colors.red[100],
          // width: w * 0.65,
          width: w,
          padding:  widget.padding ?? EdgeInsets.symmetric(horizontal: w * 0.2,vertical: h * 0.02),
          child: TextButton(
              onPressed: widget.onPressed ?? () {
                debugPrint(' ======> ON CLICK TEXT BUTTON <====== ');
                // resizeNotifier.value = false;
                // Get.offNamed(AppRoutes.dashBoardScreen);
              },
              style: TextButton.styleFrom(
                  primary: widget.primary ?? cWhite,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: widget.backgroundColor ?? cBlue),
              child: Text(widget.title!, style: widget.textStyle ?? AppStyle.textStyleRobotoBoldWhite20)
          )
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:package_delivery/Constant/appstyle.dart';
// import 'package:package_delivery/Constant/colors.dart';
//
// class CustomButton extends StatefulWidget {
//   String? title;
//   Color? backgroundColor;
//   Color? primary;
//   var onPressed;
//   var padding;
//   TextStyle? textStyle;
//   CustomButton({Key? key,this.title,this.backgroundColor,this.primary,this.onPressed,this.padding,this.textStyle}) : super(key: key);
//
//   @override
//   _CustomButtonState createState() => _CustomButtonState();
// }
//
// class _CustomButtonState extends State<CustomButton> {
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         color: cWhite,//Colors.red[100],
//           // width: w * 0.65,
//           width: w,
//           padding:  widget.padding ?? EdgeInsets.symmetric(horizontal: w * 0.2,vertical: h * 0.02),
//           child: TextButton(
//               onPressed: widget.onPressed ?? () {
//                 debugPrint(' ======> ON CLICK TEXT BUTTON <====== ');
//                 // resizeNotifier.value = false;
//                 // Get.offNamed(AppRoutes.dashBoardScreen);
//               },
//               style: TextButton.styleFrom(
//                   primary: widget.primary ?? cWhite,
//                   padding: const EdgeInsets.all(12),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   backgroundColor: widget.backgroundColor ?? cBlue),
//               child: Text(widget.title!, style: widget.textStyle ?? AppStyle.textStyleRobotoBoldWhite20)
//           )
//       ),
//     );
//   }
// }

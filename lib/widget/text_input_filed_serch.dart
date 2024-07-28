
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';


class TextInputFindOutSerch extends StatelessWidget {

   String? label;
   IconData? iconData;
   TextInputType? textInputType;
   FormFieldValidator<String>? validator;
   TextInputAction? textInputAction;
   List<TextInputFormatter>? inputFormatters;
   final onSerchPressed,prefixWidget,suffixWidget,maxLines;
   var onChange,controller,onSaved;
   InputBorder? enabledBorder;
   InputBorder? focusedBorder;
   var onTap;
   // FocusNode? focusNode;

   TextInputFindOutSerch({
     Key? key,
     this.label,
     this.iconData,
     this.textInputType,this.onChange,this.controller, this.validator,
     this.onTap,
     // this.focusNode,
     this.inputFormatters, this.textInputAction, this.onSerchPressed, this.prefixWidget, this.suffixWidget,this.onSaved,this.maxLines,this.focusedBorder,this.enabledBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;


    var w = MediaQuery.of(context).size.width;


    final hidePasswordNotifier = ValueNotifier(true);
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines??1,
      // cursorHeight: h * 0.03,
      inputFormatters: inputFormatters,
      // textAlignVertical: TextAlignVertical.center,

      keyboardType: textInputType,
      // focusNode: focusNode,

      style: AppStyle.textStyleRobotoMediumBlack15,
      onChanged: onChange,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: onSaved,
      cursorColor: cBlue,
      // autofocus: auotFocus! ?? false,
      // textAlign: TextAlign.center,
      onTap: onTap,

      decoration: InputDecoration(
        filled: true,

        // isDense: true,
        // isCollapsed: true,


        errorMaxLines: 2,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: AppStyle.textStyleRobotoRegular11,
        contentPadding: EdgeInsets.only(top: h * 0.02,left: w * 0.04,right: w * 0.04),
        fillColor: cWhite,
        suffixIcon: suffixWidget,
        prefixIcon: prefixWidget,
        enabledBorder:  enabledBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: cTransparent, width: 2)
        ),
        hintText: label,
        labelStyle: AppStyle.textStyleRobotoMediumGrey15,
        // focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: cGrey, width: 2)),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cTransparent, width: 2),),
          hintStyle: AppStyle.textStyleRobotoMediumGrey15,
        // prefixIcon: iconData != null ? Icon(iconData, color: cGrey, size: 23) : SizedBox(),
      ),
    );
  }
}

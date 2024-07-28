
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/customDropDown/dropdown_button2.dart';

class CustomDropDownWidget<T> extends StatefulWidget {
  String? hintText;
  var onChanged;
  RxList<String>? items;
  var selectedValue;
  var onTap;
  dynamic showBorder;
  // bool? contentPadding;

  FormFieldValidator<T>? validator;
  // var validator;
  CustomDropDownWidget(
      {Key? key, this.hintText, this.onChanged,
        this.items, this.selectedValue,this.onTap,
        this.showBorder,this.validator,
        // this.contentPadding
      })
      : super(key: key);

  @override
  _CustomDropDownWidgetState createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var w = MediaQuery.of(context).size.width;
    // debugPrint('CustomDropDownWidget => widget.validator : ${widget.validator}');
    // debugPrint('CustomDropDownWidget => widget.hintText : ${widget.hintText}');
    return Obx(() {
      return DropdownButtonFormField2(
        isExpanded: true,//text overflow error solved
        isDense: false,
        validator: widget.validator,
        // dropdownMaxHeight: h * 0.06,
        // buttonHeight: h * 0.02,
        alignment: Alignment.center,
        // buttonPadding: EdgeInsets.only(bottom: h * 0.005),
        // itemPadding: EdgeInsets.symmetric(vertical: 20),

        // buttonWidth:  w ,
        // itemWidth: w * 0.01,
        // buttonPadding: EdgeInsets.symmetric(vertical: h * 0.01),
        // autovalidateMode: AutovalidateMode.always,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: h * 0.001,left: w * 0.04,right: w * 0.04),
          filled: true,
          isDense: true,
          // enabledBorder: InputBorder,
          fillColor: cGreyDivider,//cWhite,// vpnBlueOpacity,
          errorMaxLines: 2,

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.showBorder == true ? cWhite : cGreyDivider)),

          disabledBorder: InputBorder.none,

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.showBorder == true ? cWhite : cBlack)),
          // border:  OutlineInputBorder(
          //   borderSide: BorderSide(color: widget.showBorder == true ? vpnGreyopacity : vpnBlueOpacity),
          // ),
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorStyle: AppStyle.textStyleRobotoRegular11,
          counterText: "",
          // contentPadding: EdgeInsets.only(top: h * 0.02,left: w * 0.04,right: w * 0.04),
          // contentPadding: widget.contentPadding! ?   EdgeInsets.only(top: h * 0.02,left: w * 0.04,right: w * 0.04) : EdgeInsets.zero,
          // suffixIcon: isPassword
          //     ? IconButton(
          //     onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
          //     icon: Icon(
          //       value ? Icons.visibility : Icons.visibility_off,
          //       color: Colors.grey[700],))
          //     : null,
          // enabledBorder: outlineInputBorder,
          // hintText: widget.hintText,
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,//outlineInputBorder.copyWith(borderSide: BorderSide(color: vpnGreyopacity, width: 1)),
          // hintStyle: AppStyle.textStyleNotoSansGreyOpacity15,// TextStyle(color: cGrey),
          // prefixIcon: Icon(iconData, color: Colors.pinkAccent, size: 18),
        ),

        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 20,
        iconDisabledColor: cGrey,
        iconEnabledColor: cBlue,



        // focusColor: red,
        onTap: widget.onTap,// () {  print('ON CLICK DropdownButton2');   },
        // buttonPadding: EdgeInsets.symmetric(horizontal: w * 0.04),
        value: widget.selectedValue ,//?? selectedValue,
        onChanged: widget.onChanged,
        // buttonDecoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: widget.showBorder == true ? vpnGreyopacity : vpnBlueOpacity),
        //     color: vpnBlueOpacity
        // ),
        dropdownElevation: 1,
        // style: widget.items![0] == 'Type' ? AppStyle.textStyleNotoSansGreyOpacity15 : AppStyle.textStyleNotoSansRegularGrey15,
        // hint: Text(
        //   widget.hintText!,
        //   style:  AppStyle.textStyleNotoSansGreyOpacity15,
        //   overflow: TextOverflow.ellipsis),

        items: widget.items?.map((String value) {
          return DropdownMenuItem<RxString>(

              value: value.obs,
              child: Text(value,
                  style: value == widget.hintText ? AppStyle.textStyleRobotoMediumGrey15 : AppStyle.textStyleRobotoMediumBlack15, overflow: TextOverflow.ellipsis));
        }).toList(),
        // underline: Divider(),
        // disabledHint: Text(
        //     widget.hintText!,// ?? 'Type',
        //     style: AppStyle.textStyleNotoSansGreyOpacity15,
        //     overflow: TextOverflow.ellipsis),
        //   ?? (value) {
        //   // setState(() {
        //   //   selectedValue = value as String;
        //   // });
        // },
        // buttonElevation: 0,
        // itemHeight: 40,
        // itemWidth: 200,
        // itemPadding: const EdgeInsets.only(left: 14, right: 14),
        // dropdownMaxHeight: 200,
        // dropdownPadding: null,
        // dropdownDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(14),
        //   color: Colors.redAccent,
        // ),
        // iconEnabledColor: Colors.yellow,
        // iconDisabledColor: Colors.grey,
        // enableFeedback: true,
        // buttonHeight: 50,
        // buttonWidth: 160,
        // dropdownElevation: 8,
        // scrollbarRadius: const Radius.circular(40),
        // scrollbarThickness: 6,
        // scrollbarAlwaysShow: true,
        // offset: const Offset(-20, 0),

      );

    });
  }
}

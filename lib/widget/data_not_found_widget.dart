import 'package:flutter/material.dart';
import 'package:package_delivery/Constant/appstyle.dart';


class DataNotFoundWidget extends StatefulWidget {

  String? title;
  DataNotFoundWidget({Key? key,this.title}) : super(key: key);

  @override
  _DataNotFoundWidgetState createState() => _DataNotFoundWidgetState();
}

class _DataNotFoundWidgetState extends State<DataNotFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.title ?? 'Data Not Found.',style: AppStyle.textStyleRobotoMediumGrey15,),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/customDialog.dart';
import '../../Constant/appstyle.dart';

class TrackDialog extends StatelessWidget {
  var onTapAllow,onTapDeny;
   TrackDialog({
    this.onTapAllow,
     this.onTapDeny,
  });


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: cDarkBlue,
          size: w * 0.09,
        ),
        SizedBox(
          height: h / 50,
        ),
        Text(
          'Use Your Location',
          style: AppStyle.textStyleRobotoMediumBlack20,
        ),
        SizedBox(
          height: h / 50,
        ),
        Text(
          'This software uses the current user\'s location to find the nearest driver for each individual client.\n\n'

        'Even when the driver\'s app is closed or not in use, this app obtains location data from the driver to enable tracking of the driver\'s '
              'location and sharing of that location with the user.\n so that the user may keep track of their packages'

          '\n\n The app also collects user\'s Late Lang in order to determine the best pickup and drop-off locations and display them on a map.',
          style: AppStyle.textStyleDarkRobotoRegularBlack12,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: h / 30,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              Assets.trackimagePNG,
              fit: BoxFit.cover,
              width: w * 0.3,
              height: w * 0.3,
            )),
        SizedBox(
          height: h / 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onTapDeny,
              child: Text(
                  'DENY',
                  style: AppStyle.textStyleRobotoMediumDarkBlue18
              ),
            ),
            GestureDetector(
              onTap: onTapAllow,
              child: Text(
                  'ACCEPT',
                  style: AppStyle.textStyleRobotoMediumDarkBlue18
              ),
            ),
          ],
        ),
      ],
    );
  }
}



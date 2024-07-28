import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_controller.dart';
import 'package:package_delivery/Screen/mypackages/shipment_list_model.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/mypackage.dart';
import 'package:package_delivery/widget/mypackagedriver.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';
// import 'package:package_delivery/widget/mypackage.dart';


class MyPackagesWidget extends GetView<MyPackagesLogic> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MyPackagesLogic>();
    final dashboardcontroller = Get.find<DashboardLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: cDarkBlue,
        appBar: CustomAppBar(
          leading: GestureDetector(
            onTap: () {
              dashboardcontroller.openDrawer();
            },
            child: Container(
              width: w / 14,
              height: w / 14,
              margin: EdgeInsets.only(left: w * 0.04),
              child: SvgPicture.asset(
                Assets.iconSideMenuLines,
                color: cWhite,
                width: w / 14,
                height: w / 14,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: controller.userRoleid.value == UserRoles.driver ||
              controller.userRoleid.value == UserRoles.comapany?'Shipment Listing':'My Package',
          titleStyle: AppStyle.textStyleRobotoBoldWhite25,
        ),

        body: //SizedBox(),
        //TODO 10_02_2022 => 08
        Padding(
          padding: EdgeInsets.all(w / 20),
          child: Column(
            children: [
              //Searchfield
              Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: TextInputFindOutSerch(
                    controller: controller.cTrackId,
                    prefixWidget: Container(
                      padding: EdgeInsets.all(h * 0.015),
                      child: SvgPicture.asset(
                        Assets.iconBottomMyPackageGray,
                      ),
                    ),
                    suffixWidget: GestureDetector(
                      onTap: () {
                        //TODO 14-02-2022 => M9

                        controller.callShipmentList(trackId: controller.cTrackId!.text);
                        print('onSerchPressed');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(h * 0.014),
                        child: SvgPicture.asset(Assets.iconSearch),
                      ),),
                    label: '#1234563',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: h / 50,
              ),
              Obx(() {
                return Expanded(
                  child: controller.isShipmentItemLoad.value == true ?
                  DataNotFoundWidget() :
                  ListView.separated(
                    itemCount: controller.shipmentItemList.value.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: h / 50);
                    },
                    itemBuilder: (context, index) {
                      ShipmentItem shipmentItem = controller.shipmentItemList.value[index];
                      return GestureDetector(
                        onTap: () {
                          if(controller.userRoleid.value == UserRoles.driver|| controller.userRoleid.value == UserRoles.comapany){
                            if(shipmentItem.shipmentStatus != PackageDeliveryStatus.Delivered
                                && shipmentItem.shipmentStatus != PackageDeliveryStatus.Failed) {
                              Get.toNamed(AppRoutes.itemStatusScreen)!.then((value)  {
                                print('AppRoutes.itemStatusScreen ; ');
                                controller.callShipmentList();
                              });
                            }
                          }
                        },
                        child:controller.userRoleid.value == UserRoles.customer ?
                        MyPackageDriver(shipmentItem: shipmentItem,userRollId: controller.userRoleid.value,):
                        controller.userRoleid.value == UserRoles.driver && controller.shipmentItemList.value[index].payment_status == ShipmentPaymantStatus.paid ?
                        MyPackageDriver(shipmentItem: shipmentItem,userRollId: controller.userRoleid.value):
                        controller.userRoleid.value == UserRoles.comapany && controller.shipmentItemList.value[index].payment_status == ShipmentPaymantStatus.paid ?
                        MyPackageDriver(shipmentItem: shipmentItem,userRollId: controller.userRoleid.value):
                        const SizedBox.shrink(),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

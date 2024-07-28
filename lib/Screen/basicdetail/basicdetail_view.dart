import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_controller.dart';
import 'package:package_delivery/Screen/paymentsuccessful/paymentsuccessful_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_dropdown.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

class BasicDetailsWidget extends GetView<BasicDetailsLogic> {



  const BasicDetailsWidget({Key? key}) : super(key: key);

  // Widget showOverlay(BuildContext context,var h ,var w)  {
  //   OverlayState? overlayState = Overlay.of(context);
  //   OverlayEntry? overlayEntry;
  //   overlayEntry = OverlayEntry(builder: (context) {
  //     return ListView.builder(
  //       shrinkWrap: true,
  //
  //       itemCount: controller.itemsDeliveryType.length,
  //       itemBuilder: (context,index){
  //             return Text(controller.itemsDeliveryType[index]);
  //     });
  //   });
  //
  //   // Inserting the OverlayEntry into the Overlay
  //   overlayState!.insert(overlayEntry);
  // }


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BasicDetailsLogic>();
    // Completer<GoogleMapController> googleMapController = Completer();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      onTap: () {
        logic.showDeliveryTypeItems!.value = false;
        controller.showTransportItems!.value = false;
      },
      child: Scaffold(
        backgroundColor: cDarkBlue,
        body: SingleChildScrollView(
          child: Obx(() {
            return Stack(
              children: [
                SizedBox(
                  height: h * 0.7,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: controller.kGooglePlex.value,
                    onMapCreated: (GoogleMapController mapController) {
                      // googleMapController.complete(mapController);
                      print('controller.latLang.value :' + controller.latLang.value.latitude.toString()+' : ' + controller.latLang.value.latitude.toString());
                      controller.mGoogleMapController = mapController;

                    },
                  ),
                ),

                Column(
                  children: [
                    CustomAppBar(
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: w / 14,
                          height: w / 14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: cBlue, // Colors.red,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: getHorizontalSize(5),
                                  color: Colors.black12,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Icon(Icons.arrow_back_ios_rounded,
                              size: getFontSize(15), color: cWhite),
                        ),
                      ),
                      title: 'Basic Details',
                      titleStyle: AppStyle.textStyleRobotoBoldBlue25,
                      action: [],
                    ),
                    SizedBox(
                      height: h *0.5,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: cDarkBlue,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.05),topRight: Radius.circular(w*0.05))
                          ),
                          padding: EdgeInsets.all(w * 0.05),
                          margin: EdgeInsets.only(top :h * 0.04),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pickup Location',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                              SizedBox(height: h * 0.01),
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
                                    controller: controller.cPickupLocation,
                                    onTap: (){
                                      controller.showDeliveryTypeItems!.value = false;
                                      controller.showTransportItems!.value = false;
                                    },
                                    prefixWidget: Container(
                                      padding: EdgeInsets.all(h * 0.015),
                                      child: SvgPicture.asset(
                                        Assets.iconPickupLocation,
                                      ),
                                    ),
                                    label: 'User Current Location',
                                    textInputType: TextInputType.text),
                              ),
                              SizedBox(height: h * 0.03),
                              Text('Destination',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                              SizedBox(height: h * 0.01),
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
                                    controller: controller.cDestination,
                                    onTap: (){
                                      controller.showDeliveryTypeItems!.value = false;
                                      controller.showTransportItems!.value = false;
                                    },
                                    prefixWidget: Container(
                                      padding: EdgeInsets.all(h * 0.015),
                                      child: SvgPicture.asset(
                                        Assets.iconDestination,
                                      ),
                                    ),
                                    label: 'Destination Location',
                                    textInputType: TextInputType.text),
                              ),
                              SizedBox(height: h * 0.03),
                              Text('Delivery Type',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                              SizedBox(height: h * 0.01),
                              // Obx(() {
                              //   return CustomDropDownWidget(
                              //     // hintText: Const.lblSelect,
                              //     items: controller.itemsDeliveryType.obs,
                              //     // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                              //     // showBorder: controller.showGenderBorder.value,
                              //     onTap: () {
                              //       // controller.onGenderTypeTap(RxBool(true));
                              //     },
                              //     selectedValue: controller.dropdownDeliveryTypeValue.value,
                              //
                              //     onChanged: (value) {
                              //       // debugPrint('CustomDropDownWidget => value 1 : $value');
                              //       // try {
                              //       //   controller.onGenderDropDownChanged(RxString(value.toString()));
                              //       //   debugPrint('CustomDropDownWidget => value 2 : $value');
                              //       // }
                              //       // catch (e) {
                              //       //   debugPrint('CustomDropDownWidget => ERROR : $e');
                              //       // }
                              //       // controller.onGenderTypeTap(RxBool(false));
                              //     },
                              //   );
                              // }),
                              // SizedBox(height: h * 0.01),
                              // Container(
                              //   width: w,
                              //   // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                              //   decoration: BoxDecoration(
                              //       color: cWhite,
                              //       borderRadius: BorderRadius.all(Radius.circular(w*0.02))
                              //   ),
                              //   child: DropdownButton<String>(
                              //     isExpanded: true,
                              //
                              //     // isDense: true,
                              //     value: controller.dropdownDeliveryTypeValue.value,
                              //     icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              //     // elevation: 16,
                              //
                              //     style:  TextStyle(color: cBlack),
                              //     underline: Container(
                              //       height: 1,
                              //       color: cTransparent,
                              //     ),
                              //     onChanged: (String? newValue) {
                              //       controller.dropdownDeliveryTypeValue.value = newValue!;
                              //     },
                              //     items: controller.itemsDeliveryType.map<DropdownMenuItem<String>>((String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: FittedBox(
                              //           fit: BoxFit.contain,
                              //           child: Container(
                              //               alignment: Alignment.centerLeft,
                              //               padding:  EdgeInsets.symmetric(
                              //                   horizontal: w * 0.09),
                              //               width: w*0.82,
                              //               child: Text(value)),
                              //         ),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),

                              GestureDetector(
                                onTap: (){
                                  debugPrint('controller.showDeliveryTypeItems!.value : ${controller.showDeliveryTypeItems!.value}');
                                  controller.showDeliveryTypeItems!.value = !controller.showDeliveryTypeItems!.value;
                                  controller.showTransportItems!.value = false;
                                },

                                child: Container(
                                  width: w,
                                  height: h * 0.073,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: w * 0.05,right: w * 0.04),
                                  decoration: BoxDecoration(
                                      color: cWhite,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(controller.dropdownDeliveryTypeValue.value,
                                        // textAlign: TextAlign.center,
                                        style: AppStyle.textStyleRobotoMediumBlack15,
                                      ),
                                      Icon(Icons.keyboard_arrow_down_sharp)
                                    ],
                                  ),
                                ),
                              ),

                              controller.showDeliveryTypeItems!.value == true ?
                              Column(
                                children: [
                                  SizedBox(height: h * 0.01),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                                    decoration: BoxDecoration(
                                        color: cWhite,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.itemsDeliveryType.length,
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: () {
                                              controller.dropdownDeliveryTypeValue.value = controller.itemsDeliveryType[index];
                                              controller.showDeliveryTypeItems!.value = false;
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(vertical: h * 0.015,horizontal: w * 0.06),
                                                child: Text(controller.itemsDeliveryType[index].toString(),
                                                  style: TextStyle(color: cBlack),
                                                )),
                                          );
                                        }),
                                  ),
                                ],
                              ) : const SizedBox(),
                              SizedBox(height: h * 0.03),
                              Text('Select Mode of Transport',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                              SizedBox(height: h * 0.01),

                              GestureDetector(
                                onTap: (){
                                  debugPrint('controller.showTransportItems!.value : ${controller.showTransportItems!.value}');
                                  controller.showTransportItems!.value = !controller.showTransportItems!.value;
                                  controller.showDeliveryTypeItems!.value = false;
                                },

                                child: Container(
                                  width: w,
                                  height: h * 0.073,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: w * 0.05,right: w * 0.04),
                                  decoration: BoxDecoration(
                                      color: cWhite,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(controller.dropdownModeOfTransportValue.value,
                                        // textAlign: TextAlign.center,
                                        style: AppStyle.textStyleRobotoMediumBlack15,
                                      ),
                                      Icon(Icons.keyboard_arrow_down_sharp)
                                    ],
                                  ),
                                ),
                              ),
                              controller.showTransportItems!.value == true ?
                              Column(
                                children: [
                                  SizedBox(height: h * 0.01),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                                    decoration: BoxDecoration(
                                        color: cWhite,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.itemsModeOfTransportType.length,
                                        itemBuilder: (context,index) {
                                          return GestureDetector(
                                            onTap: () {
                                              controller.dropdownModeOfTransportValue.value = controller.itemsModeOfTransportType[index].toString();
                                              controller.showTransportItems!.value = false;
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(vertical: h * 0.015,horizontal: w * 0.06),
                                                child: Text(controller.itemsModeOfTransportType[index].toString(),
                                                  style: TextStyle(color: cBlack),
                                                )),
                                          );
                                        }),
                                  ),
                                ],
                              ) : SizedBox(),

                              // Container(
                              //   width: w,
                              //   // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                              //   decoration: BoxDecoration(
                              //       color: cWhite,
                              //       borderRadius: BorderRadius.all(Radius.circular(w*0.02))
                              //   ),
                              //   child: DropdownButton<String>(
                              //     value: controller.dropdownModeOfTransportValue.value,
                              //     icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              //     // elevation: 16,
                              //
                              //     style:  TextStyle(color: cBlack),
                              //     underline: Container(
                              //       height: 1,
                              //       color: cTransparent,
                              //     ),
                              //     onChanged: (String? newValue) {
                              //       controller.dropdownModeOfTransportValue.value = newValue!;
                              //     },
                              //     items: controller.itemsModeOfTransportType
                              //         .map<DropdownMenuItem<String>>((String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Container(
                              //             alignment: Alignment.centerLeft,
                              //             padding:  EdgeInsets.symmetric(
                              //                 horizontal: w * 0.09),
                              //             width: w*0.82,
                              //             child: Text(value)),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                              CustomButton(
                                conteinerbackgroundColor : cTransparent,
                                title: 'Continue to Package Details',
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.05, vertical: h * 0.02),
                                onPressed: () async {

                                  controller.callCreateShipment();
                                },
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              // Get.toNamed(AppRoutes.selectDispatcherScreen);
                              // Get.toNamed(AppRoutes.basicDetailsScreen);
                              // Add your onPressed code here!
                            },
                            backgroundColor: cBlue,
                            child: SvgPicture.asset(
                              Assets.iconParcelMenuDarkBlue,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ],
            );
          }),
        ),
      ),
    );

    // final FocusNode _focusNode = FocusNode();
    // return Obx(() {
    //   return SafeArea(
    //     child: Scaffold(
    //       body: Stack(
    //         // alignment: Alignment.topCenter,
    //         children: [
    //
    //           SizedBox(
    //             height: h * 0.7,
    //             child: GoogleMap(
    //               mapType: MapType.normal,
    //               myLocationEnabled: true,
    //               zoomControlsEnabled: false,
    //               initialCameraPosition: controller.kGooglePlex.value,
    //               onMapCreated: (GoogleMapController mapController) {
    //                 // googleMapController.complete(mapController);
    //                 print('controller.latLang.value :' +
    //                     controller.latLang.value.latitude.toString() + ' : ' +
    //                     controller.latLang.value.latitude.toString());
    //                 controller.mGoogleMapController = mapController;
    //               },
    //             ),
    //           ),
    //
    //           Container(
    //             // height: h * 0.13,
    //             margin: EdgeInsets.only(top: h * 0.06),
    //             // color: Colors.red[100],
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     SizedBox(width: w * 0.04),
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.back();
    //                       },
    //                       child: Container(
    //                         width: w / 14,
    //                         height: w / 14,
    //                         // margin: EdgeInsets.only(left: w * 0.04),
    //                         alignment: Alignment.center,
    //                         decoration: BoxDecoration(
    //                           color: cBlue, // Colors.red,
    //                           borderRadius: BorderRadius.circular(5),
    //                           boxShadow: [
    //                             BoxShadow(
    //                                 blurRadius: getHorizontalSize(5),
    //                                 color: Colors.black12,
    //                                 spreadRadius: 1)
    //                           ],
    //                         ),
    //                         child: Icon(Icons.arrow_back_ios_rounded,
    //                             size: getFontSize(15), color: cWhite),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Text('Basic Details',style: AppStyle.textStyleRobotoBoldBlue25,),
    //                 Text('')
    //               ],
    //             ),
    //           ),
    //
    //           Container(
    //             decoration: BoxDecoration(
    //                 color: cDarkBlue,
    //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.05),topRight: Radius.circular(w*0.05))),
    //             child: SingleChildScrollView(
    //               // controller: scrollController,
    //               child: Padding(
    //                 padding: EdgeInsets.all(w * 0.05),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text('Pickup Location',
    //                         textAlign: TextAlign.center,
    //                         style: AppStyle.textStyleDarkRobotoMediumWhite15),
    //                     SizedBox(height: h * 0.01),
    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         boxShadow: <BoxShadow>[
    //                           BoxShadow(
    //                               color: Colors.black26,
    //                               blurRadius: 10.0,
    //                               offset: Offset(0.0, 0.75))
    //                         ],
    //                       ),
    //                       child: TextInputFindOutSerch(
    //                           controller: controller.cPickupLocation,
    //                           onTap: (){
    //                             // overlayEntry!.remove();
    //                             controller.showDeliveryTypeItems!.value = false;
    //                           },
    //                           prefixWidget: Container(
    //                             padding: EdgeInsets.all(h * 0.015),
    //
    //                             child: SvgPicture.asset(
    //                               Assets.iconPickupLocation,
    //                             ),
    //                           ),
    //                           label: 'User Current Location',
    //                           textInputType: TextInputType.text),
    //                     ),
    //                     SizedBox(height: h * 0.03),
    //                     Text('Destination',
    //                         textAlign: TextAlign.center,
    //                         style: AppStyle.textStyleDarkRobotoMediumWhite15),
    //                     SizedBox(height: h * 0.01),
    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         boxShadow: <BoxShadow>[
    //                           BoxShadow(
    //                               color: Colors.black26,
    //                               blurRadius: 10.0,
    //                               offset: Offset(0.0, 0.75))
    //                         ],
    //                       ),
    //                       child: TextInputFindOutSerch(
    //                           controller: controller.cDestination,
    //                           prefixWidget: Container(
    //                             padding: EdgeInsets.all(h * 0.015),
    //                             child: SvgPicture.asset(
    //                               Assets.iconDestination,
    //                             ),
    //                           ),
    //                           label: 'Destination Location',
    //
    //                           textInputType: TextInputType.text),
    //                     ),
    //                     SizedBox(height: h * 0.03),
    //                     Text('Delivery Type',
    //                         textAlign: TextAlign.center,
    //                         style: AppStyle.textStyleDarkRobotoMediumWhite15),
    //                     SizedBox(height: h * 0.01),
    //
    //                     GestureDetector(
    //                       onTap: (){
    //                         debugPrint('controller.showDeliveryTypeItems!.value : ${controller.showDeliveryTypeItems!.value}');
    //                         controller.showDeliveryTypeItems!.value = true;
    //                       },
    //
    //                       child: Container(
    //                         width: w,
    //                         height: h * 0.073,
    //                         alignment: Alignment.centerLeft,
    //                         padding: EdgeInsets.only(left: w * 0.05,right: w * 0.04),
    //                         decoration: BoxDecoration(
    //                             color: cWhite,
    //                             borderRadius: BorderRadius.circular(10)
    //                         ),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Text(controller.dropdownDeliveryTypeValue.value,
    //                               // textAlign: TextAlign.center,
    //                             ),
    //                             Icon(Icons.keyboard_arrow_down_sharp)
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     controller.showDeliveryTypeItems!.value == true ?
    //                     showOverlay(context,  h, w)
    //                         : const SizedBox(),
    //
    //                     // Obx(() {
    //                     //   return CustomDropDownWidget(
    //                     //     // hintText: Const.lblSelect,
    //                     //     items: controller.itemsDeliveryType.obs,
    //                     //     // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
    //                     //     // showBorder: controller.showGenderBorder.value,
    //                     //     onTap: () {
    //                     //       // controller.onGenderTypeTap(RxBool(true));
    //                     //     },
    //                     //     selectedValue: controller.dropdownDeliveryTypeValue.value,
    //                     //
    //                     //     onChanged: (value) {
    //                     //       // debugPrint('CustomDropDownWidget => value 1 : $value');
    //                     //       // try {
    //                     //       //   controller.onGenderDropDownChanged(RxString(value.toString()));
    //                     //       //   debugPrint('CustomDropDownWidget => value 2 : $value');
    //                     //       // }
    //                     //       // catch (e) {
    //                     //       //   debugPrint('CustomDropDownWidget => ERROR : $e');
    //                     //       // }
    //                     //       // controller.onGenderTypeTap(RxBool(false));
    //                     //     },
    //                     //   );
    //                     // }),
    //                     SizedBox(height: h * 0.01),
    //                     // Container(
    //                     //   width: w,
    //                     //   // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
    //                     //   decoration: BoxDecoration(
    //                     //       color: cWhite,
    //                     //       borderRadius: BorderRadius.all(Radius.circular(w*0.02))
    //                     //   ),
    //                     //   child: DropdownButton<String>(
    //                     //     isExpanded: true,
    //                     //
    //                     //     // isDense: true,
    //                     //     value: controller.showDeliveryTypeItems!.value == false ? "" : controller.dropdownDeliveryTypeValue.value,
    //                     //     icon: const Icon(Icons.keyboard_arrow_down_rounded),
    //                     //     // elevation: 16,
    //                     //
    //                     //     style:  TextStyle(color: cBlack),
    //                     //     underline: Container(
    //                     //       height: 1,
    //                     //       color: cTransparent,
    //                     //     ),
    //                     //     onChanged: (String? newValue) {
    //                     //       debugPrint('newValue : $newValue');
    //                     //       // controller.dropdownDeliveryTypeValue.value = newValue!;
    //                     //     },
    //                     //     onTap: (){
    //                     //       debugPrint('onTap');
    //                     //       controller.showDeliveryTypeItems!.value = true;
    //                     //       // FocusManager.instance.primaryFocus!.unfocus();
    //                     //     },
    //                     //     // items: controller.itemsDeliveryType.map<DropdownMenuItem<String>>((String value) {
    //                     //     //   return DropdownMenuItem<String>(
    //                     //     //     value: value,
    //                     //     //     child: FittedBox(
    //                     //     //       fit: BoxFit.contain,
    //                     //     //       child: Container(
    //                     //     //           alignment: Alignment.centerLeft,
    //                     //     //           padding:  EdgeInsets.symmetric(
    //                     //     //               horizontal: w * 0.09),
    //                     //     //           width: w*0.82,
    //                     //     //           child: Text(value)),
    //                     //     //     ),
    //                     //     //   );
    //                     //     // }).toList(),
    //                     //     items: controller.showDeliveryTypeItems!.value == false
    //                     //         ? []
    //                     //         : controller.itemsDeliveryType.map<DropdownMenuItem<String>>((String value) {
    //                     //       return showOverlay(context, value, h, w);
    //                     //     }).toList(),
    //                     //   ),
    //                     // ),
    //                     SizedBox(height: h * 0.03),
    //                     Text('Select Mode of Transport',
    //                         textAlign: TextAlign.center,
    //                         style: AppStyle.textStyleDarkRobotoMediumWhite15),
    //                     SizedBox(height: h * 0.01),
    //                     Container(
    //                       width: w,
    //                       // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
    //                       decoration: BoxDecoration(
    //                           color: cWhite,
    //                           borderRadius: BorderRadius.all(Radius.circular(w*0.02))
    //                       ),
    //                       child: DropdownButton<String>(
    //                         value: controller.dropdownModeOfTransportValue.value,
    //                         icon: const Icon(Icons.keyboard_arrow_down_rounded),
    //                         // elevation: 16,
    //
    //                         style:  TextStyle(color: cBlack),
    //                         underline: Container(
    //                           height: 1,
    //                           color: cTransparent,
    //                         ),
    //                         onTap: (){
    //
    //                         },
    //
    //                         onChanged: (String? newValue) {
    //                           controller.dropdownModeOfTransportValue.value = newValue!;
    //                         },
    //                         // items: controller.showDeliveryTypeItems!.value == false
    //                         // ? []
    //                         // : controller.itemsModeOfTransportType.map<DropdownMenuItem<String>>((String value) {
    //                         //   return showOverlay(context, value, h, w);
    //                         // }).toList(),
    //                         items: controller.itemsModeOfTransportType.map<DropdownMenuItem<String>>((String value) {
    //                           return DropdownMenuItem<String>(
    //                             value: value,
    //                             child: Container(
    //                                 alignment: Alignment.centerLeft,
    //                                 padding:  EdgeInsets.symmetric(
    //                                     horizontal: w * 0.09),
    //                                 width: w*0.82,
    //                                 child: Text(value)),
    //                           );
    //                           // return showOverlay(context, value, h, w);
    //                         }).toList(),
    //                         // items: showOverlay(context, value, h, w),
    //                       ),
    //                     ),
    //                     CustomButton(
    //                       conteinerbackgroundColor : cTransparent,
    //                       title: 'Continue to Package Details',
    //                       padding: EdgeInsets.symmetric(
    //                           horizontal: w * 0.05, vertical: h * 0.02),
    //                       onPressed: () async {
    //
    //                         controller.callCreateShipment();
    //                       },
    //                     ),
    //                   ],
    //
    //                 ),
    //               ),
    //             ),
    //           )
    //
    //
    //           // CustomAppBar(
    //           //   leading: GestureDetector(
    //           //     onTap: () {
    //           //       Get.back();
    //           //     },
    //           //     child: Container(
    //           //       width: w / 14,
    //           //       height: w / 14,
    //           //       alignment: Alignment.center,
    //           //       decoration: BoxDecoration(
    //           //         color: cBlue, // Colors.red,
    //           //         borderRadius: BorderRadius.circular(5),
    //           //         boxShadow: [
    //           //           BoxShadow(
    //           //               blurRadius: getHorizontalSize(5),
    //           //               color: Colors.black12,
    //           //               spreadRadius: 1)
    //           //         ],
    //           //       ),
    //           //       child: Icon(Icons.arrow_back_ios_rounded,
    //           //           size: getFontSize(15), color: cWhite),
    //           //     ),
    //           //   ),
    //           //   title: 'Basic Details',
    //           //   titleStyle: AppStyle.textStyleRobotoBoldBlue25,
    //           //   action: [],
    //           // ),
    //         ],
    //       ),
    //     ),
    //   );
    // });
  }
}


// return Scaffold(
//   backgroundColor: cDarkBlue,
//   body: SingleChildScrollView(
//     child: Obx(() {
//       return Stack(
//         children: [
//           SizedBox(
//             height: h * 0.7,
//             child: GoogleMap(
//               mapType: MapType.normal,
//               myLocationEnabled: true,
//               zoomControlsEnabled: false,
//               initialCameraPosition: controller.kGooglePlex.value,
//               onMapCreated: (GoogleMapController mapController) {
//                 // googleMapController.complete(mapController);
//                 print('controller.latLang.value :' + controller.latLang.value.latitude.toString()+' : ' + controller.latLang.value.latitude.toString());
//                 controller.mGoogleMapController = mapController;
//
//               },
//             ),
//           ),
//
//
//           Column(
//             children: [
//               CustomAppBar(
//                 leading: GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                     width: w / 14,
//                     height: w / 14,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: cBlue, // Colors.red,
//                       borderRadius: BorderRadius.circular(5),
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: getHorizontalSize(5),
//                             color: Colors.black12,
//                             spreadRadius: 1)
//                       ],
//                     ),
//                     child: Icon(Icons.arrow_back_ios_rounded,
//                         size: getFontSize(15), color: cWhite),
//                   ),
//                 ),
//                 title: 'Basic Details',
//                 titleStyle: AppStyle.textStyleRobotoBoldBlue25,
//                 action: [],
//               ),
//               SizedBox(height: h *0.5),
//               Stack(
//
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: cDarkBlue,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.05),topRight: Radius.circular(w*0.05))),
//                     padding: EdgeInsets.all(w * 0.05),
//                     margin: EdgeInsets.only(top :h * 0.04),
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Pickup Location',
//                             textAlign: TextAlign.center,
//                             style: AppStyle.textStyleDarkRobotoMediumWhite15),
//                         SizedBox(height: h * 0.01),
//                         Container(
//                           decoration: const BoxDecoration(
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 10.0,
//                                   offset: Offset(0.0, 0.75))
//                             ],
//                           ),
//                           child: TextInputFindOutSerch(
//                             controller: controller.cPickupLocation,
//                               prefixWidget: Container(
//                                 padding: EdgeInsets.all(h * 0.015),
//                                 child: SvgPicture.asset(
//                                   Assets.iconPickupLocation,
//                                 ),
//                               ),
//                               label: 'User Current Location',
//                               textInputType: TextInputType.text),
//                         ),
//                         SizedBox(height: h * 0.03),
//                         Text('Destination',
//                             textAlign: TextAlign.center,
//                             style: AppStyle.textStyleDarkRobotoMediumWhite15),
//                         SizedBox(height: h * 0.01),
//                         Container(
//                           decoration: const BoxDecoration(
//                             boxShadow: <BoxShadow>[
//                               BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 10.0,
//                                   offset: Offset(0.0, 0.75))
//                             ],
//                           ),
//                           child: TextInputFindOutSerch(
//                             controller: controller.cDestination,
//                               prefixWidget: Container(
//                                 padding: EdgeInsets.all(h * 0.015),
//                                 child: SvgPicture.asset(
//                                   Assets.iconDestination,
//                                 ),
//                               ),
//                               label: 'Destination Location',
//                               textInputType: TextInputType.text),
//                         ),
//                         SizedBox(height: h * 0.03),
//                         Text('Delivery Type',
//                             textAlign: TextAlign.center,
//                             style: AppStyle.textStyleDarkRobotoMediumWhite15),
//                         SizedBox(height: h * 0.01),
//                         // Obx(() {
//                         //   return CustomDropDownWidget(
//                         //     // hintText: Const.lblSelect,
//                         //     items: controller.itemsDeliveryType.obs,
//                         //     // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
//                         //     // showBorder: controller.showGenderBorder.value,
//                         //     onTap: () {
//                         //       // controller.onGenderTypeTap(RxBool(true));
//                         //     },
//                         //     selectedValue: controller.dropdownDeliveryTypeValue.value,
//                         //
//                         //     onChanged: (value) {
//                         //       // debugPrint('CustomDropDownWidget => value 1 : $value');
//                         //       // try {
//                         //       //   controller.onGenderDropDownChanged(RxString(value.toString()));
//                         //       //   debugPrint('CustomDropDownWidget => value 2 : $value');
//                         //       // }
//                         //       // catch (e) {
//                         //       //   debugPrint('CustomDropDownWidget => ERROR : $e');
//                         //       // }
//                         //       // controller.onGenderTypeTap(RxBool(false));
//                         //     },
//                         //   );
//                         // }),
//                         // SizedBox(height: h * 0.01),
//                         Container(
//                           width: w,
//                           // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
//                           decoration: BoxDecoration(
//                             color: cWhite,
//                             borderRadius: BorderRadius.all(Radius.circular(w*0.02))
//                           ),
//                           child: DropdownButton<String>(
//                               isExpanded: true,
//
//                             // isDense: true,
//                             value: controller.dropdownDeliveryTypeValue.value,
//                             icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                             // elevation: 16,
//                             // focusNode: _focusNode,
//                             style:  TextStyle(color: cBlack),
//                             underline: Container(
//                               height: 1,
//                               color: cTransparent,
//                             ),
//                             onChanged: (String? newValue) {
//                               debugPrint("Ontappppppp111");
//                               controller.dropdownDeliveryTypeValue.value = newValue!;
//                             },
//                             onTap: (){
//                                 debugPrint("Ontappppppp");
//                                 // FocusScope.of(context).requestFocus(_focusNode);
//                               // FocusScope.of(context).unfocus();
//                             },
//                             items: controller.itemsDeliveryType.map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: FittedBox(
//                                   fit: BoxFit.contain,
//                                   child: Container(
//                                     alignment: Alignment.centerLeft,
//                                      padding:  EdgeInsets.symmetric(
//                                     horizontal: w * 0.09),
//                                      width: w*0.82,
//                                       child: Text(value)),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         SizedBox(height: h * 0.03),
//                         Text('Select Mode of Transport',
//                             textAlign: TextAlign.center,
//                             style: AppStyle.textStyleDarkRobotoMediumWhite15),
//                         SizedBox(height: h * 0.01),
//                         Container(
//                           width: w,
//                           // padding: EdgeInsets.symmetric(horizontal: w * 0.07),
//                           decoration: BoxDecoration(
//                             color: cWhite,
//                             borderRadius: BorderRadius.all(Radius.circular(w*0.02))
//                           ),
//                           child: DropdownButton<String>(
//                             value: controller.dropdownModeOfTransportValue.value,
//                             icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                             // elevation: 16,
//
//                             style:  TextStyle(color: cBlack),
//                             underline: Container(
//                               height: 1,
//                               color: cTransparent,
//                             ),
//                             onChanged: (String? newValue) {
//                               controller.dropdownModeOfTransportValue.value = newValue!;
//                             },
//                             items: controller.itemsModeOfTransportType
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Container(
//                                   alignment: Alignment.centerLeft,
//                                    padding:  EdgeInsets.symmetric(
//                                   horizontal: w * 0.09),
//                                    width: w*0.82,
//                                     child: Text(value)),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         CustomButton(
//                           conteinerbackgroundColor : cTransparent,
//                           title: 'Continue to Package Details',
//                           padding: EdgeInsets.symmetric(
//                               horizontal: w * 0.05, vertical: h * 0.02),
//                           onPressed: () async {
//
//                             controller.callCreateShipment();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         // Get.toNamed(AppRoutes.selectDispatcherScreen);
//                         // Get.toNamed(AppRoutes.basicDetailsScreen);
//                         // Add your onPressed code here!
//                       },
//                       backgroundColor: cBlue,
//                       child: SvgPicture.asset(
//                         Assets.iconParcelMenuDarkBlue,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//
//         ],
//       );
//     }),
//   ),
// );
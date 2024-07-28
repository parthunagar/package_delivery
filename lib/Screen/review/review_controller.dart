import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/review/review_model.dart';
import 'package:package_delivery/Screen/review/review_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class ReviewLogic extends GetxController with StateMixin<dynamic> {

  RxString? userProfile = ''.obs;
  RxDouble? userReview = 3.5.obs;
  RxString? receiverName = ''.obs;
  RxString? trackingId = ''.obs;
  RxString? driverId = ''.obs;
  RxString? driverImage = ''.obs;

  Rx<RxList<ReviewData>> reviewDataList = RxList<ReviewData>.empty().obs;
  RxBool isReviewDataLoad = false.obs;

  TextEditingController? cReview = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    debugPrint(' <=========== onInit ===========> ');
    userProfile!.value = await Preference().read(Const.prefUserProfileImage);

  }


  Future<ReviewData?> saveReviewData() async {

    debugPrint('saveEditProfileData => cReview : ${cReview!.text.toString()}');
    debugPrint('saveEditProfileData => userReview : ${userReview!.value}');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String apiToken = await Preference().read(Const.prefAPIToken);
    int userId = await Preference().readInt(Const.prefUserId);
    debugPrint('saveReviewData => apiToken : ${apiToken.toString()}');
    debugPrint('saveReviewData => driverId!.value : ${driverId!.value}');
    debugPrint('saveReviewData => trackingId!.value : ${trackingId!.value}');
    debugPrint('saveReviewData => userReview!.value : ${userReview!.value}');
    debugPrint('saveReviewData => cReview!.text : ${cReview!.text.toString()}');
    Map<String, dynamic> queryRequest = {'driver_company_id': driverId!.value,'shipment_id': trackingId!.value,
      'rating_star' : userReview!.value, 'rating_comment' : cReview!.text.toString()};
    debugPrint('saveReviewData =>  ${queryRequest.entries}');
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    ReviewProvider().callAddReview(queryRequest: queryRequest,headers: headers).then((reviewValue) async {
      debugPrint('saveReviewData => reviewValue : $reviewValue');
      final review = Review.fromJson(reviewValue);
      try{
        reviewDataList.value.clear();
        reviewDataList.value.add(review.reviewData!);
        if(review.status == 0) {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(review.message);
          // return Signin.fromJson(callLoginValue);
        }
        else {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(review.message);
        }
        //TODO: AFTER APPLYING RATING UPDATE RECENT ACTIVITY LIST
        var homeCon = Get.find<HomeLogic>();
        homeCon.callShipmentList();
        Get.back();
      }catch(e){
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(review.message);
      }

    });
  }


  @override
  void onReady() {
    // TODO: implement onReady
    print('Get.parameters[NavigationArgs.kUserName] : '+ Get.arguments[NavigationArgs.kUserName].toString());
    print('Get.parameters[NavigationArgs.cShipmentId] : '+ Get.arguments[NavigationArgs.cShipmentId].toString());
    receiverName!.value = Get.arguments[NavigationArgs.kUserName].toString();
    trackingId!.value = Get.arguments[NavigationArgs.cShipmentId].toString();
    driverId!.value = Get.arguments[NavigationArgs.cDriverId].toString();
    driverImage!.value = Get.arguments[NavigationArgs.cDriverImage].toString();
    debugPrint('onInit => userProfile : ${userProfile!.value}');
    debugPrint('onInit => receiverName!.value  : ${receiverName!.value}');
    debugPrint('onInit => trackingId!.value  : ${trackingId!.value}');
    debugPrint('onInit => cDriverId!.value  : ${driverId!.value}');
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

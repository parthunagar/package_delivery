import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/widget/payment_card/payment_card.dart';

class AddEditCardLogic extends GetxController {
  var paymentCard = PaymentCard();

  TextEditingController? cCardName = TextEditingController();
  TextEditingController? cCardNo = TextEditingController();
  TextEditingController? cDate = TextEditingController();
  TextEditingController? cCVV = TextEditingController();

  RxString? cardNoHideString = ''.obs;
  RxString? cardNoUnHideString = ''.obs;
  RxString? cardNoString = ''.obs;
  RxString? cardNameString = ''.obs;
  RxString? cardDateString = ''.obs;

  saveCardData() {
    debugPrint('saveCardData => cCardName : ${cCardName!.text.toString()}');
    debugPrint('saveCardData => cCardNo : ${cCardNo!.text.toString()}');
    debugPrint('saveCardData => cDate : ${cDate!.text.toString()}');
    debugPrint('saveCardData => cCVV : ${cCVV!.text.toString()}');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    try {
      debugPrint("Get.parameters['Edit'] : ${Get.parameters[NavigationArgs.kEdit]}");
      debugPrint("Get.parameters['cardNo'] : ${Get.parameters[NavigationArgs.kCardNo]}");
      debugPrint("Get.parameters['cardNo'].length : ${Get.parameters[NavigationArgs.kCardNo]!.length}");
      debugPrint("Get.parameters['cardName'] : ${Get.parameters[NavigationArgs.kCardName]}");
      debugPrint("Get.parameters['cardDate'] : ${Get.parameters[NavigationArgs.kCardDate]}");
    } catch (e) {
      debugPrint("ERROR : $e");
    }

    if (Get.parameters[NavigationArgs.kEdit] == 'true') {
      cCardName!.text = Get.parameters[NavigationArgs.kCardName]!;
      cCardNo!.text = Get.parameters[NavigationArgs.kCardNo]!;
      cDate!.text = Get.parameters[NavigationArgs.kCardDate]!;
      cardNoString!.value = Get.parameters[NavigationArgs.kCardNo]!;

      debugPrint('cCardNo!.text.lengthhhh : ${cCardNo!.text.length}');

      cardNoHideString!.value = cCardNo!.text.length > 0 &&
          cCardNo!.text.length < 15
          ? cCardNo!.text.substring(0, cCardNo!.text.length)
          : cCardNo!.text.substring(0,
          15); //cCardNo!.text.substring(0, cCardNo!.text.lastIndexOf(' '));
      // cardNoHideString!.value = cCardNo!.text.substring(0, cCardNo!.text.lastIndexOf(' '));
      debugPrint(' cardNoHideString!.value : ${cardNoHideString!.value}');

      cardNoUnHideString!.value =
          cCardNo!.text.substring(cCardNo!.text.length - 4);
      debugPrint(
          ' cardNoUnHideString!.valueeeee : ${cardNoUnHideString!.value}');
      cardNameString!.value = cCardName!.text;
      cardDateString!.value = cDate!.text;

      debugPrint('cCardNo!.text1 : ${cCardNo!.text}');

      cCardNo!.addListener(() {
        var mystring = cCardNo!.text;
        debugPrint('mystring : ${mystring}');
        debugPrint('mystring.lenght : ${mystring.toString().length}');
        debugPrint('cCardNo!.text.length : ${cCardNo!.text.length}');
        debugPrint('cCardNo!.text2 : ${cCardNo!.text}');
        // cardNoUnHideString!.value = cCardNo!.text.substring(cCardNo!.text.length - 4);
        // cardNoHideString!.value = cCardNo!.text.split(" ").length == 4
        //     ? cCardNo!.text.split(" ").elementAt(0) +
        //         " " +
        //         cCardNo!.text.split(" ").elementAt(1) +
        //         " " +
        //         cCardNo!.text.split(" ").elementAt(2)
        //     : cCardNo!.text.split(" ").join(" ") ;
        // cardNoUnHideString!.value = cCardNo!.text.split(" ").length == 4 ? cCardNo!.text.split(" ").last : "";

        // debugPrint('card split ====>> : ${cCardNo!.text.split(" ")}');

        List splitlist = cCardNo!.text.split(" ");


        cardNoHideString!.value = cCardNo!.text.split(" ").length == 4
            ? splitlist.elementAt(0) +
            " " +
            splitlist.elementAt(1) +
            " " +
            splitlist.elementAt(2)
            : splitlist.length > 4
            ? splitlist.elementAt(0) +
            " " +
            splitlist.elementAt(2) +
            " " +
            splitlist.elementAt(4)
            : splitlist.length == 3
            ? splitlist.elementAt(0) + " " + splitlist.elementAt(2)
            : splitlist.join(" ");

        cardNoUnHideString!.value = splitlist.length == 4
            ? " "+splitlist.elementAt(3)
            : splitlist.length == 7
            ? " "+splitlist.elementAt(6)
            : "";

        // debugPrint(
        //     'cardsplit length ====>> : ${cCardNo!.text.split(" ").length}');
        // debugPrint('cardHideStringggggg ====>> : ${cardNoHideString!.value}');
        // debugPrint(
        //     'cardShownStringggggg ====>> : ${cardNoUnHideString!.value}');

        if (cCardNo!.text.isEmpty) {
          cardNoHideString!.value = '';
        }
        debugPrint('cardNoHideString.value : ${cardNoHideString!.value}');
      });
      cCardName!.addListener(() {
        cardNameString!.value = cCardName!.text;
      });
      cDate!.addListener(() {
        cardDateString!.value = cDate!.text;
      });
    } else {
      cCardNo!.addListener(() {
        debugPrint('cCardNo!.text.length : ${cCardNo!.text.length}');
        if (cCardNo!.text.length <= 16) {
          for (int i = 0; i < cCardNo!.text.length; i++) {
            cardNoHideString!.value = cCardNo!.text;
            cardNoUnHideString!.value = '';
          }
        } else if (cCardNo!.text.length >= 19) {
          // for(int j = 0 ; j <= cCardNo!.text.length ; j++) {
          cardNoUnHideString!.value = cCardNo!.text.replaceRange(0, 18, '');
          // }

        }
        if (cCardNo!.text.isEmpty) {
          // cardNoUnHideString.value = '';
          cardNoHideString!.value = '';
        }
        debugPrint('cardNoHideString.value : ${cardNoHideString!.value}');
      });
      cCardName!.addListener(() {
        cardNameString!.value = cCardName!.text;
      });
      cDate!.addListener(() {
        cardDateString!.value = cDate!.text;
      });
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:package_delivery/widget/payment_card/payment_card.dart';
//
// class AddEditCardLogic extends GetxController {
//
//   var paymentCard = PaymentCard();
//
//
//
//   TextEditingController? cCardName = TextEditingController();
//   TextEditingController? cCardNo = TextEditingController();
//   TextEditingController? cDate = TextEditingController();
//   TextEditingController? cCVV = TextEditingController();
//
//   RxString? cardNoHideString = ''.obs;
//   RxString? cardNoUnHideString = ''.obs;
//   RxString? cardNameString = ''.obs;
//   RxString? cardDateString = ''.obs;
//
//   saveCardData() {
//     debugPrint('saveCardData => cCardName : ${cCardName!.text.toString()}');
//     debugPrint('saveCardData => cCardNo : ${cCardNo!.text.toString()}');
//     debugPrint('saveCardData => cDate : ${cDate!.text.toString()}');
//     debugPrint('saveCardData => cCVV : ${cCVV!.text.toString()}');
//   }
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//    try{
//      debugPrint("Get.parameters['Edit'] : ${Get.parameters['Edit']}");
//      debugPrint("Get.parameters['cardNo'] : ${Get.parameters['cardNo']}");
//      debugPrint("Get.parameters['cardNo'].length : ${Get.parameters['cardNo']!.length}");
//      debugPrint("Get.parameters['cardName'] : ${Get.parameters['cardName']}");
//      debugPrint("Get.parameters['cardDate'] : ${Get.parameters['cardDate']}");
//    }
//    catch(e){
//      debugPrint("ERROR : $e");
//    }
//
//
//     if(Get.parameters['Edit'] == 'true') {
//       cCardName!.text = Get.parameters['cardName']!;
//       cCardNo!.text = Get.parameters['cardNo']!;
//       cDate!.text = Get.parameters['cardDate']!;
//       debugPrint('cCardNo!.text.lengthhhh : ${cCardNo!.text.length}');
//
//       cardNoHideString!.value = cCardNo!.text.substring(0, cCardNo!.text.lastIndexOf(' '));
//       debugPrint(' cardNoHideString!.value : ${ cardNoHideString!.value}');
//
//       cardNoUnHideString!.value = cCardNo!.text.substring(cCardNo!.text.length - 4);
//       debugPrint(' cardNoUnHideString!.valueeeee : ${ cardNoUnHideString!.value}');
//       cardNameString!.value = cCardName!.text;
//       cardDateString!.value = cDate!.text;
//
//       debugPrint('cCardNo!.text1 : ${cCardNo!.text}');
//
//       cCardNo!.addListener(() {
//         debugPrint('cCardNo!.text.length : ${cCardNo!.text.length}');
//         debugPrint('cCardNo!.text2 : ${cCardNo!.text}');
//         // cardNoUnHideString!.value = cCardNo!.text.substring(cCardNo!.text.length - 4);
//         if(cCardNo!.text.length <= 20) {
//           for(int i = 0 ; i < cCardNo!.text.length ; i++) {
//             // cardNoHideString!.value = cCardNo!.text;
//             debugPrint(' cCardNo!.text.lastIndexOf : ${cCardNo!.text.lastIndexOf(' ')}');
//             // cardNoHideString!.value = cCardNo!.text.substring(0, cCardNo!.text.lastIndexOf(' '));
//             // cardNoUnHideString!.value = '';
//             cardNoHideString!.value = cCardNo!.text;
//             cardNoUnHideString!.value = '';
//           }
//         }
//         else if(cCardNo!.text.length >= 19 ) {
//           cardNoUnHideString!.value = cCardNo!.text.replaceRange(0, 18, '');
//           // cardNoUnHideString!.value = cCardNo!.text.substring(cCardNo!.text.length - 4);
//         }
//         if(cCardNo!.text.isEmpty) {
//           cardNoHideString!.value = '';
//         }
//         debugPrint('cardNoHideString.value : ${cardNoHideString!.value}');
//       });
//       cCardName!.addListener(() {
//         cardNameString!.value = cCardName!.text;
//       });
//       cDate!.addListener(() {
//         cardDateString!.value = cDate!.text;
//       });
//     }
//     else {
//       cCardNo!.addListener(() {
//         debugPrint('cCardNo!.text.length : ${cCardNo!.text.length}');
//         if(cCardNo!.text.length <= 16) {
//           for(int i = 0 ; i < cCardNo!.text.length ; i++) {
//             cardNoHideString!.value = cCardNo!.text;
//             cardNoUnHideString!.value = '';
//           }
//         }
//         else  if(cCardNo!.text.length >= 19 ) {
//           // for(int j = 0 ; j <= cCardNo!.text.length ; j++) {
//           cardNoUnHideString!.value = cCardNo!.text.replaceRange(0, 18, '');
//           // }
//
//         }
//         if(cCardNo!.text.isEmpty) {
//           // cardNoUnHideString.value = '';
//           cardNoHideString!.value = '';
//         }
//         debugPrint('cardNoHideString.value : ${cardNoHideString!.value}');
//       });
//       cCardName!.addListener(() {
//         cardNameString!.value = cCardName!.text;
//       });
//       cDate!.addListener(() {
//         cardDateString!.value = cDate!.text;
//       });
//     }
//
//   }
//
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }
// }

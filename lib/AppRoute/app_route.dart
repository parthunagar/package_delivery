import 'package:get/get.dart';
import 'package:package_delivery/Screen/TestMap/customInfo.dart';
import 'package:package_delivery/Screen/add_edit_card/add_edit_card_binding.dart';
import 'package:package_delivery/Screen/add_edit_card/add_edit_card_view.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_binding.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_view.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_binding.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_view.dart';
import 'package:package_delivery/Screen/card_list/card_list_binding.dart';
import 'package:package_delivery/Screen/card_list/card_list_view.dart';
import 'package:package_delivery/Screen/add_edit_card/add_edit_card_binding.dart';
import 'package:package_delivery/Screen/add_edit_card/add_edit_card_view.dart';
import 'package:package_delivery/Screen/card_list/card_list_binding.dart';
import 'package:package_delivery/Screen/card_list/card_list_view.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_binding.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_view.dart';
import 'package:package_delivery/Screen/coupon_history_list/coupon_history_list_binding.dart';
import 'package:package_delivery/Screen/coupon_history_list/coupon_history_list_view.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_binding.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_view.dart';
import 'package:package_delivery/Screen/driver_list/driver_list_binding.dart';
import 'package:package_delivery/Screen/driver_list/driver_list_view.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_binding.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_view.dart';
import 'package:package_delivery/Screen/drivermaptraking/drivermaptraking_binding.dart';
import 'package:package_delivery/Screen/drivermaptraking/drivermaptraking_view.dart';
import 'package:package_delivery/Screen/edit_profile/edit_profile_binding.dart';
import 'package:package_delivery/Screen/edit_profile/edit_profile_view.dart';
import 'package:package_delivery/Screen/followed_list/followed_list_binding.dart';
import 'package:package_delivery/Screen/followed_list/followed_list_view.dart';
import 'package:package_delivery/Screen/followers_list/followers_list_binding.dart';
import 'package:package_delivery/Screen/followers_list/followers_list_view.dart';
import 'package:package_delivery/Screen/forgot_password/forgot_password_binding.dart';
import 'package:package_delivery/Screen/forgot_password/forgot_password_view.dart';
import 'package:package_delivery/Screen/home/home_binding.dart';
import 'package:package_delivery/Screen/home/home_view.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_binding.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_view.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_binding.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_view.dart';
import 'package:package_delivery/Screen/otp/otp_binding.dart';
import 'package:package_delivery/Screen/otp/otp_view.dart';
import 'package:package_delivery/Screen/packagedetail/packagedetail_binding.dart';
import 'package:package_delivery/Screen/packagedetail/packagedetail_view.dart';
import 'package:package_delivery/Screen/paymentmethod/paymentmethod_binding.dart';
import 'package:package_delivery/Screen/paymentmethod/paymentmethod_view.dart';
import 'package:package_delivery/Screen/paymentsuccessful/paymentsuccessful_binding.dart';
import 'package:package_delivery/Screen/paymentsuccessful/paymentsuccessful_view.dart';
import 'package:package_delivery/Screen/profile/profile_binding.dart';
import 'package:package_delivery/Screen/profile/profile_view.dart';
import 'package:package_delivery/Screen/rate_and_review_list/rate_and_review_binding.dart';
import 'package:package_delivery/Screen/rate_and_review_list/rate_and_review_view.dart';
import 'package:package_delivery/Screen/review/review_binding.dart';
import 'package:package_delivery/Screen/review/review_view.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_binding.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_view.dart';
import 'package:package_delivery/Screen/roleselectiondrawer/roleselectiondrawer_binding.dart';
import 'package:package_delivery/Screen/roleselectiondrawer/roleselectiondrawer_view.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_binding.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_view.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_binding.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_view.dart';
import 'package:package_delivery/Screen/shipping_company/shippingcompanies_binding.dart';
import 'package:package_delivery/Screen/shipping_company/shippingcompanies_view.dart';
import 'package:package_delivery/Screen/signin/signin_binding.dart';
import 'package:package_delivery/Screen/signin/signin_view.dart';
import 'package:package_delivery/Screen/signup/signup_binding.dart';
import 'package:package_delivery/Screen/signup/signup_view.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_binding.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_view.dart';
import 'package:package_delivery/Screen/subscription/subscription_binding.dart';
import 'package:package_delivery/Screen/subscription/subscription_view.dart';
import 'package:package_delivery/Screen/traking/traking_view.dart';
import 'package:package_delivery/Screen/upload_image_screen/upload_image_screen_binding.dart';
import 'package:package_delivery/Screen/upload_image_screen/upload_image_screen_view.dart';

import '../Screen/splash_screen/splash_screen_binding.dart';
import '../Screen/splash_screen/splash_screen_view.dart';

class AppRoutes {
  static String splashScreen = '/splash_Screen';
  static String signInScreen = '/signin_Screen';
  static String signUpScreen = '/signup_Screen';
  static String otpScreen = '/otp_Screen';
  static String roleScreen = '/role_Screen';
  static String roleScreenDrawer = '/role_Screen_Drawer';
  static String forgotPasswordScreen = '/forgot_password_Screen';
  static String driverVerification = '/driver_verification_screen';
  static String notificationListScreen = '/notification_list_screen';
  static String selectDispatcherScreen = '/select_dispatcher_screen';
  static String homeScreen = '/home_Screen';
  static String shippingCompaniesScreen = '/shippingCompanies_screen';
  static String dashboardScreen = '/dashboard_Screen';
  static String profileScreen = '/profile_screen';
  static String editProfileScreen = '/edit_profile_screen';
  static String paymentMethodScreen = '/payment_method_screen';
  static String paymentSuccessScreen = '/payment_success_screen';
  static String addEditCardScreen = '/add_edit_card_screen';
  static String cardListScreen = '/card_list__screen';
  static String basicDetailsScreen = '/basic_details_screen';
  static String myPackageScreen = '/my_package_screen';
  static String trackingScreen = '/tracking_screen';
  static String packageDetailScreen = '/package_detail_screen';
  static String followedListScreen = '/followed_list_screen';
  static String reviewScreen = '/review_screen';
  static String shipmentSummaryScreen = '/shipment_summary_screen';
  static String driverListScreen = '/driver_list_screen';
  static String followerListScreen = '/follower_list_screen';
  static String drivermaptrakingScreen = '/driver_map_tracking_screen';
  static String customInfoWindowExample = '/custom_info_window_example';
  static String subscriptionScreen = '/subscription_Screen';
  static String rateReviewListScreen = '/rate_review_list_Screen';
  static String itemStatusScreen = '/item_status_Screen';
  static String uploadDeliveredImageScreen = '/upload_delivered_image_screen';
  static String applyCouponScreen = '/apply_coupon_screen';
  static String couponHistoryListScreen = '/coupon_history_list_screen';

  static List<GetPage> pages = [
    GetPage(
      name: signInScreen,
      page: () => const SignInWidget(),
      bindings: [SignInBinding()],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardWidget(),
      bindings: [DashboardBinding()],
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpVerificationWidget(),
      bindings: [OtpVerificationBinding()],
    ),
    GetPage(
      name: roleScreen,
      page: () => RoleSelectionWidget(),
      bindings: [RoleSelectionBinding()],
    ),
    GetPage(
      name: roleScreenDrawer,
      page: () => RoleSelectionDrawerWidget(),
      bindings: [RoleSelectionDrawerBinding()],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => Forgot_passwordWidget(),
      bindings: [Forgot_passwordBinding()],
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpWidget(),
      bindings: [SignupBinding()],
    ),
    GetPage(
      name: driverVerification,
      page: () => const DriverVerificationWidget(),
      bindings: [DriverVerificationBinding()],
    ),
    GetPage(
      name: notificationListScreen,
      page: () => const NotificationListWidget(),
      bindings: [NotificationListBinding()],
    ),
    GetPage(
      name: selectDispatcherScreen,
      page: () => const SelectDispatcherWidget(),
      bindings: [SelectDispatcherBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeWidget(),
      // bindings: [HomeBinding()],
    ),
    GetPage(
      name: shippingCompaniesScreen,
      page: () => const ShippingCompaniesWidget(),
      bindings: [ShippingCompaniesBinding()],
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileWidget(),
      bindings: [ProfileBinding()],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileWidget(),
      bindings: [EditProfileBinding()],
    ),
    GetPage(
      name: basicDetailsScreen,
      page: () => BasicDetailsWidget(),
      bindings: [BasicDetailsBinding()],
    ),
    GetPage(
      name: packageDetailScreen,
      page: () => const PackagedetailWidget(),
      bindings: [PackagedetailBinding()],
    ),
    GetPage(
      name: myPackageScreen,
      page: () => MyPackagesWidget(),
      // bindings: [MyPackagesBinding()],
    ),
    GetPage(
      name: trackingScreen,
      page: () => TrakingWidget(),
    ),

    GetPage(
      name: paymentMethodScreen,
      page: () => const PaymentMethodWidget(),
      bindings: [PaymentMethodBinding()],
    ),

    GetPage(
      name: paymentSuccessScreen,
      page: () => const PaymentSuccessfulWidget(),
      bindings: [PaymentSuccessfulBinding()],
    ),
    GetPage(
      name: addEditCardScreen,
      page: () => const AddEditCardWidget(),
      bindings: [AddEditCardBinding()],
    ),

    GetPage(
      name: cardListScreen,
      page: () => const CardListWidget(),
      bindings: [CardListBinding()],
    ),

    GetPage(
      name: splashScreen,
      page: () => const SplashScreenWidget(),
      bindings: [SplashScreenBinding()],
    ),
    GetPage(
      name: followedListScreen,
      page: () => const FollowedListWidget(),
      bindings: [FollowedListBinding()],
    ),

    GetPage(
      name: reviewScreen,
      page: () => const ReviewWidget(),
      bindings: [ReviewBinding()],
    ),
    GetPage(
      name: shipmentSummaryScreen,
      page: () => ShipmentSummaryWidget(),
      bindings: [ShipmentSummaryBinding()],
    ),
    GetPage(
      name: customInfoWindowExample,
      page: () => CustomInfoWindowExample(),
    ),

    GetPage(
      name: driverListScreen,
      page: () => const DriverListWidget(),
      bindings: [DriverListBinding()],
    ),
    GetPage(
      name: followerListScreen,
      page: () => const FollowersListWidget(),
      bindings: [FollowersListBinding()],
    ),
    GetPage(
      name: subscriptionScreen,
      page: () => const SubscriptionWidget(),
      bindings: [SubscriptionBinding()],
    ),
    GetPage(
      name: rateReviewListScreen,
      page: () => const RateReviewListWidget(),
      bindings: [RateReviewListBinding()],
    ),
    GetPage(
      name: drivermaptrakingScreen,
      page: () => DrivermaptrakingWidget(),
      bindings: [DrivermaptrakingBinding()],
    ),

    GetPage(
      name: itemStatusScreen,
      page: () => StatusofItemWidget(),
      bindings: [StatusofItemBinding()],
    ),
    GetPage(
      name: uploadDeliveredImageScreen,
      page: () => UploadImageScreenWidget(),
      bindings: [UploadImageScreenBinding()],
    ),
    GetPage(
      name: applyCouponScreen,
      page: () =>  ApplyCouponWidget(),
      bindings: [ApplyCouponBinding()],
    ),
    GetPage(
      name: couponHistoryListScreen,
      page: () => const CouponHistoryListWidget(),
      bindings: [CouponHistoryListBinding()],
    ),
  ];
}

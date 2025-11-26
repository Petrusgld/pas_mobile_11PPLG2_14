import 'package:flutter_application_1/bindings/login_binding.dart';
import 'package:flutter_application_1/bindings/register_binding.dart';
import 'package:flutter_application_1/bindings/show_binding.dart';
import 'package:flutter_application_1/bindings/splash_binding.dart';
import 'package:flutter_application_1/navbar/navbar_bindings.dart';
import 'package:flutter_application_1/navbar/navbar_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/product_page.dart';
import 'package:flutter_application_1/pages/splashscreen.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.navbarPage,
      page: () => NavbarPage(),
      binding: NavbarBindings(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.splashScreenPage,
      page: () => SplashscreenPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.productPage,
      page: () => ProductPage(),
      binding: ShowBinding(),
    ),
  ];
}

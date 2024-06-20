part of '../../main.dart';

final List<Get.GetPage> routesPages = [
  Get.GetPage(
    name: RoutesPath.login,
    page: () => const LoginPage(),
  ),
  Get.GetPage(
    name: RoutesPath.singUp,
    page: () => const SignUpPage(),
  ),
  Get.GetPage(
    name: RoutesPath.forgotPassword,
    page: () => const ForgotPassword(),
  ),
  Get.GetPage(
    name: RoutesPath.home,
    page: () => const HomePage(),
  ),
];

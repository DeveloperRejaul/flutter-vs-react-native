import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/routes_path.dart';
import 'package:flutter_app/core/theme/theme.dart';
import 'package:flutter_app/futures/auth/view/pages/forgot_password.dart';
import 'package:flutter_app/futures/auth/view/pages/login.dart';
import 'package:flutter_app/futures/auth/view/pages/singup.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          initialRoute: RoutesPath.login,
          defaultTransition: Transition.rightToLeft,
          getPages: [
            GetPage(
              name: RoutesPath.login,
              page: () => const LoginPage(),
            ),
            GetPage(
              name: RoutesPath.singUp,
              page: () => const SignUpPage(),
            ),
            GetPage(
              name: RoutesPath.forgotPassword,
              page: () => const ForgotPassword(),
            ),
          ],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dartThemeMode,
          home: const LoginPage(),
        );
      },
    );
  }
}

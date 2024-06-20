import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/routes_path.dart';
import 'package:flutter_app/core/theme/theme.dart';
import 'package:flutter_app/futures/auth/bloc/auth_bloc.dart';
import 'package:flutter_app/futures/auth/pages/forgot_password.dart';
import 'package:flutter_app/futures/auth/pages/login.dart';
import 'package:flutter_app/futures/auth/pages/singup.dart';
import 'package:flutter_app/futures/home/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:responsive_sizer/responsive_sizer.dart';

part 'core/constants/routes_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Get.GetMaterialApp(
            initialRoute: RoutesPath.login,
            defaultTransition: Get.Transition.rightToLeft,
            getPages: routesPages,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.dartThemeMode,
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}

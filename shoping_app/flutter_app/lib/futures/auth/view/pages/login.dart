import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/routes_path.dart';
import 'package:flutter_app/futures/auth/view/widgets/custom_button.dart';
import 'package:flutter_app/futures/auth/view/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as ResponsiveSizer;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 100.h,
            width: ResponsiveSizer.Device.screenType ==
                    ResponsiveSizer.ScreenType.tablet
                ? 40.w
                : 100.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Welcome to the app",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 35),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Email Address"),
                    ),
                    CustomField(hint: 'example@gmail.com', controller: email),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Password",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RoutesPath.forgotPassword);
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomField(
                      hint: '************',
                      passwordSuffixIcon: true,
                      controller: email,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() => isChecked = value!);
                          },
                        ),
                        Text(
                          "Keep me signed in",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomButton(text: "Login"),
                    const SizedBox(height: 30),
                    Center(
                      child: TextButton(
                        onPressed: () => Get.toNamed(RoutesPath.singUp),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

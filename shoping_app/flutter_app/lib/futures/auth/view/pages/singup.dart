import 'package:flutter/material.dart';
import 'package:flutter_app/futures/auth/view/widgets/custom_button.dart';
import 'package:flutter_app/futures/auth/view/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as ResponsiveSizer;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
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
                    // App title
                    Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Welcome to the app",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 35),

                    // User name input
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("User Name"),
                    ),
                    CustomField(hint: 'Rezaul karim', controller: userName),
                    const SizedBox(height: 15),

                    // Email input
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Email Address"),
                    ),
                    CustomField(hint: 'example@gmail.com', controller: email),
                    const SizedBox(height: 15),

                    // password input
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    CustomField(
                      hint: '************',
                      passwordSuffixIcon: true,
                      controller: email,
                    ),

                    const SizedBox(height: 20),

                    // Sign up button
                    const CustomButton(text: "Sign up"),
                    const SizedBox(height: 30),

                    // Navigation button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have already account",
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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

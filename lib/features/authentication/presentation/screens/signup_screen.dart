import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_form_text_field.dart';
import '../../../../core/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FormBuilder(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Icon(FontAwesomeIcons.user, size: 60),
                    const SizedBox(height: 16),
                    Text(
                        "Join Tutormate",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    const SizedBox(height: 8),
                    Text("Start your learning journey today"),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.graduationCap, color: Colors.grey, size: 18),
                        const SizedBox(width: 8),
                        const Text("I am a"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    FormBuilderChoiceChips<String>(
                      alignment: WrapAlignment.center,
                      showCheckmark: false,
                      name: "user_type",
                      spacing: 24,
                      decoration: const InputDecoration(border: InputBorder.none),
                      options: [
                        FormBuilderChipOption(
                          value: "student",
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.book, size: 32),
                              const Text("Student"),
                            ],
                          ),
                        ),
                        FormBuilderChipOption(
                          value: "teacher",
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.graduationCap, size: 32),
                              const Text("Teacher"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomFormTextField(
                      name: "email",
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    const SizedBox(height: 16),
                    CustomFormTextField(
                      name: "phone",
                      labelText: "Phone Number",
                      hintText: "Enter your phone number",
                      prefixText: "+91 ",
                    ),
                    const SizedBox(height: 16),
                    CustomFormTextField(
                      name: "password",
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    const SizedBox(height: 16),
                    CustomFormTextField(
                      name: "password",
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      btnText: "Login",
                      onPressed: () {},
                      btnWidth: screenWidth > 500 ? 500 / 1.5 : screenWidth / 1.5,
                    ),
                    const SizedBox(height: 12),
                    buildOrDivider(screenWidth),
                    const SizedBox(height: 12),
                    CustomButton(
                      btnText: "Continue with Google",
                      btnColor: const Color(0xFFF2F2F2),
                      textColor: Colors.black54,
                      btnWidth: screenWidth > 500 ? 500 / 1.5 : screenWidth / 1.5,
                      icon: SvgPicture.asset(
                        'assets/android_neutral_rd_na.svg',
                        height: 32,
                      ),
                      onPressed: () {},
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

  Padding buildOrDivider(final double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.2 * screenWidth),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.black26, thickness: 1)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Text("Or", style: TextStyle(color: Colors.black26)),
          ),
          Expanded(child: Divider(color: Colors.black26, thickness: 1)),
        ],
      ),
    );
  }
}

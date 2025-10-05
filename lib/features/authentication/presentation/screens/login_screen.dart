import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';
import 'package:smpd_fee_mate_app/core/widgets/custom_form_text_field.dart';
import 'package:smpd_fee_mate_app/core/widgets/custom_button.dart';

import '../../../../core/widgets/custom_text_button.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(FontAwesomeIcons.user, size: 50),
                  Text(
                    "Tutormate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "Helping teachers grow!",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  FormBuilder(
                    child: Column(
                      children: [
                        CustomFormTextField(
                          name: "email",
                          labelText: "Email",
                          hintText: "Enter your email",
                        ),
                        const SizedBox(height: 16),
                        CustomFormTextField(
                          name: "password",
                          labelText: "Password",
                          hintText: "Enter your password",
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        btnText: "Forgot Password?",
                        btnTextColor: AppColors.primaryColor,
                        onPressed: () {},
                      ),
                    ),
                  const SizedBox(height: 16),
                  CustomButton(
                    btnText: "Login",
                    onPressed: () {},
                    btnWidth: screenWidth > 500 ? 500 / 1.5 : screenWidth / 1.5,
                  ),
                  const SizedBox(height: 12),
                  buildOrDivider(100),
                  const SizedBox(height: 12),
                  CustomButton(
                    btnText: "Continue with Google",
                    btnColor: Color(0xFFF2F2F2),
                    textColor: Colors.black54,
                    btnWidth: screenWidth > 500 ? 500 / 1.5 : screenWidth / 1.5,
                    icon: SvgPicture.asset(
                      'assets/android_neutral_rd_na.svg',
                      height: 50,
                    ),
                    onPressed: () {},
                  ),
                ],
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

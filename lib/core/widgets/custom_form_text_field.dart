import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../utils/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final String hintText;
  final String? prefixText;

  const CustomFormTextField({
    super.key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.prefixText,
  });

  @override
  Widget build(final BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixText: prefixText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
      ),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

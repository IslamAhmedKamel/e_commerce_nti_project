import 'package:e_commerce_nti_project/features/auth/presentation/views/widgets/custom_text_field_signup.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomTextFieldSinUp(
        title: 'Email Address',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          // تحقق من صحة البريد الإلكتروني
          final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          );
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        hintText: "Enter your email address",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}

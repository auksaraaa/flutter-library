import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isRequired;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const CustomFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isRequired = true,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: Text(
            isRequired ? '$label *' : label,
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.textSecondaryColor.withOpacity(0.5)),
            prefixIcon: prefixIcon,
          ),
          validator: validator ?? (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'กรุณากรอก$label';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
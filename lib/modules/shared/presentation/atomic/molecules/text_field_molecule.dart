import 'package:flutter/material.dart';

import '../../../configs/constants/app_colors.dart';
import '../../../configs/constants/app_text_style.dart';
import '../../../configs/presentation/textFields/text_field_type_extension.dart';

enum TextFieldType { none, email, password, cpf, emailOrCpf, search }

class TextFieldMolecule extends StatefulWidget {
  const TextFieldMolecule({
    super.key,
    required this.type,
    required this.label,
    required this.onChanged,
  });

  final TextFieldType type;
  final String label;
  final ValueSetter<String?> onChanged;

  @override
  State<TextFieldMolecule> createState() => _TextFieldMoleculeState();
}

class _TextFieldMoleculeState extends State<TextFieldMolecule> {
  bool isObscure = false;
  String? errorText;

  Widget? getSuffixIcon() {
    if (widget.type == TextFieldType.password) {
      return InkWell(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: Icon(
          isObscure ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      );
    }

    return null;
  }

  Widget? getPrefixIcon() {
    if (widget.type == TextFieldType.search) {
      return const Icon(
        Icons.search,
        color: AppColors.primaryColor,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
      onChanged: (value) {
        widget.onChanged(value);

        setState(() {
          errorText = widget.type.getValidator().validate(value);
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: AppTextStyle.bodyRegular,
        labelText: widget.label,
        errorText: errorText,
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
      ),
    );
  }
}

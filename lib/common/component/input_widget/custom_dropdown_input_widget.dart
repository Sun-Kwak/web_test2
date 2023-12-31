import 'package:flutter/material.dart';
import 'package:web_test2/common/const/colors.dart';

class CustomDropdownInputWidget extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final List<String> dropdownItems;
  final double? height;
  final bool? isRequired;
  final String label;
  final String? hintText;
  final double? labelBoxWidth;
  final double? textBoxWidth;

  const CustomDropdownInputWidget({
    this.labelBoxWidth = 50,
    this.textBoxWidth = 170,
    required this.onChanged,
    required this.selectedValue,
    required this.dropdownItems,
    this.hintText,
    required this.label,
    this.isRequired = false,
    this.height = 37,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: labelBoxWidth,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  // style: TextStyle(fontSize: height! * 0.35),
                ),
              ],
            )),
        SizedBox(
          width: 10,
          height: height,
          child: Center(
            child: isRequired == true
                ? const Text('\*', style: TextStyle(color: CUSTOM_RED))
                : null,
          ),
        ),

        SizedBox(
            width: textBoxWidth,
            height: height,
            child: CustomDropdownFormField(
                dropdownItems: dropdownItems,
                selectedValue: selectedValue,
                onChanged: onChanged))
      ],
    );
  }
}

class CustomDropdownFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final List<String> dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final FocusNode? focusNode;
  final FocusNode? onFieldSubmitted;
  final double? height;

  const CustomDropdownFormField({
    this.height = 40,
    required this.dropdownItems,
    required this.selectedValue,
    this.focusNode,
    this.onFieldSubmitted,
    required this.onChanged,
    this.hintText,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(height! * 0.1),
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: const BorderSide(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isDense: true,
          onChanged: onChanged,
          items: dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

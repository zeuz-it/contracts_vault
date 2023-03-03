import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class DatePickerField extends StatefulWidget {
  final String? helperText;
  final String? confirmText;
  final String? cancelText;
  final DateTime? initialDate;
  const DatePickerField({
    super.key,
    this.helperText,
    this.confirmText,
    this.cancelText,
    this.initialDate,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  build(BuildContext context) async {
    return await showDatePicker(
      helpText: widget.helperText,
      cancelText: widget.cancelText,
      confirmText: widget.confirmText,
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

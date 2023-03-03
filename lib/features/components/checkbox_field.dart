import 'package:contracts_vault/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CheckboxField extends StatefulWidget {
  bool checkboxValue = false;
  final String? label;
  CheckboxField({
    super.key,
    this.label,
  });

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  @override
  Widget build(BuildContext context) {
    var theme = AppTheme.darkTheme;
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 75,
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: AppTheme.primaryColor,
              value: widget.checkboxValue,
              onChanged: (value) {
                setState(() {
                  widget.checkboxValue = value!;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          if (widget.label != null) const SizedBox(height: 24),
          if (widget.label != null)
            TextButton(
              child: Text(
                widget.label!.toUpperCase(),
                style: theme.textTheme.bodySmall,
              ),
              onPressed: () {
                setState(() {
                  widget.checkboxValue = !widget.checkboxValue;
                });
              },
            ),
          if (widget.label != null) const SizedBox(height: 12),
        ],
      ),
    );
  }
}

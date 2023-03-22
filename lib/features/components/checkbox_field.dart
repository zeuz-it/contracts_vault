import 'package:contracts_vault/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxField extends StatefulWidget {
  final String? label;
  final void Function(bool?)? onChanged;
  final bool? checkboxValue;
  const CheckboxField({
    super.key,
    this.label,
    this.onChanged,
    this.checkboxValue,
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
              onChanged: (value) =>
                  widget.onChanged != null ? widget.onChanged!(value) : null,
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
              onPressed: () {},
            ),
          if (widget.label != null) const SizedBox(height: 12),
        ],
      ),
    );
  }
}

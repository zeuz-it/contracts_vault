import 'package:contracts_vault/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final List<String> options;
  final String? label;
  final Icon? prefixIcon;
  final Color? color;
  final double? radius;
  final double? iconSize;
  final String? hint;
  final Color? hintColor;
  final Widget? suffix;

  const DropdownField({
    super.key,
    required this.options,
    this.label,
    this.prefixIcon,
    this.color,
    this.radius,
    this.iconSize,
    this.hint,
    this.hintColor,
    this.suffix,
  });

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.options.first;
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null) const SizedBox(height: 24),
        if (widget.label != null)
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: widget.prefixIcon != null ? 48 : 0),
            child: Text(
              widget.label!.toUpperCase(),
              style: theme.textTheme.bodySmall,
            ),
          ),
        if (widget.label != null) const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                iconSize: widget.iconSize ?? 20,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: theme.textTheme.titleMedium!
                      .copyWith(color: widget.hintColor ?? theme.hintColor),
                  prefixIcon: widget.prefixIcon,
                  filled: true,
                  fillColor: widget.color ?? theme.primaryColorDark,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(widget.radius ?? 8),
                  ),
                  isDense: true,
                ),
                items: widget.options
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                  //value == widget.options.last
                }).toList(),
                onChanged: (String? val) {
                  setState(() {
                    dropdownValue = val!;
                  });
                },
              ),
            ),
            if (widget.suffix != null) widget.suffix!,
          ],
        ),
      ],
    );
  }
}

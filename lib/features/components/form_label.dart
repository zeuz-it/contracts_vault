import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String? label;
  const FormLabel({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Text(
          label!.toUpperCase(),
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

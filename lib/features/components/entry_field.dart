import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryField extends StatelessWidget {
  final String? hint;
  final Icon? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final Widget? suffix;
  final Color? hintColor;
  final double? radius;
  final Function? validator;
  final TextInputType? keyboardTypeParam;
  final bool? isTopElement;

  const EntryField(
      {Key? key,
      this.hint,
      this.prefixIcon,
      this.color,
      this.controller,
      this.initialValue,
      this.readOnly,
      this.textAlign,
      this.suffixIcon,
      this.textInputType,
      this.label,
      this.maxLines,
      this.minLines,
      this.onTap,
      this.onSuffixTap,
      this.suffix,
      this.hintColor,
      this.radius,
      this.validator,
      this.keyboardTypeParam,
      this.isTopElement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null && isTopElement == null) const SizedBox(height: 24),
        /* Eğer form'un ilk elementi ise yukarıdan boşluk verme*/
        if (label != null)
          Padding(
            padding:
                EdgeInsetsDirectional.only(start: prefixIcon != null ? 48 : 0),
            child: Text(
              label!.toUpperCase(),
              style: theme.textTheme.bodySmall,
            ),
          ),
        if (label != null) const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) =>
                    validator != null ? validator!(value) : null,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                controller: controller,
                initialValue: initialValue,
                readOnly: readOnly ?? false,
                maxLines: maxLines,
                minLines: minLines,
                textAlign: textAlign ?? TextAlign.start,
                keyboardType: keyboardTypeParam ?? TextInputType.text,
                /* Özel bir keyboardTypeParam gelmişse onu aksi halde 
                default olarak text türünde input oluştur*/
                inputFormatters: keyboardTypeParam ==
                        const TextInputType.numberWithOptions(decimal: true)
                    ? [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ]
                    : null,
                /* 
                  Eğer parametre olarak gelen keyboardTypeParam parametresi basamaklı 
                  decimal sayı ise sadece 0-9 arasındaki rakamlar ile . ve , karakterler
                  ine izin ver.
                */
                decoration: InputDecoration(
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintText: hint,
                  hintStyle: theme.textTheme.titleMedium!
                      .copyWith(color: hintColor ?? theme.hintColor),
                  filled: true,
                  fillColor: color ?? theme.primaryColorDark,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(radius ?? 8),
                  ),
                  isDense: true,
                ),
                onTap: onTap,
              ),
            ),
            if (suffix != null) suffix!,
          ],
        ),
      ],
    );
  }
}

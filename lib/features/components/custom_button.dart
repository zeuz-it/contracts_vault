import 'package:flutter/material.dart';
import '/../../../generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    this.text,
    this.image,
    this.iconGap,
    this.radius,
    this.color,
    this.margin,
    this.padding,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.icon,
    this.suffix,
    this.suffixGap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? text;
  final String? image;
  final Widget? icon;
  final double? iconGap;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final double? fontSize;
  final Widget? suffix;
  final double? suffixGap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 30),
          border: Border.all(color: borderColor ?? Colors.transparent),
          gradient: color == null
              ? LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    const Color(0xffA278DE),
                    theme.primaryColor,
                  ],
                )
              : null,
          color: color ?? theme.primaryColor,
        ),
        margin: margin,
        padding: padding ?? EdgeInsets.all(image != null ? 16.0 : 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (image != null)
              Image.asset(
                image!,
                height: fontSize == null ? 20 : fontSize! + 2,
              ),
            if (image != null || icon != null) SizedBox(width: iconGap ?? 8),
            Text(
              text ?? S.of(context).signIn,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: textColor, fontSize: fontSize),
            ),
            if (suffix != null) SizedBox(width: suffixGap ?? 8),
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }
}

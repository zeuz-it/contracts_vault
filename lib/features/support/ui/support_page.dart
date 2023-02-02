import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    var mq = MediaQuery.of(context);
    var size = mq.size;
    return CustomScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.support),
        ),
        body: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: SingleChildScrollView(
            child: Container(
              color: theme.cardColor,
              height: size.height - mq.padding.vertical,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      s.connectUsForAnyFeedbackOrQuery,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    image: Assets.iconsIcCall,
                    text: s.callUs,
                    color: Colors.transparent,
                    iconGap: 20,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 16, 32, 16),
                  ).frosted(
                    borderRadius: BorderRadius.circular(30),
                    frostColor: theme.dividerColor,
                    blur: 7,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    image: Assets.iconsIcMail,
                    text: s.emailUs,
                    color: Colors.transparent,
                    iconGap: 20,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 16, 32, 16),
                  ).frosted(
                    borderRadius: BorderRadius.circular(30),
                    frostColor: theme.hintColor,
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  Text(
                    s.orWriteToUs,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.disabledColor),
                  ),
                  const SizedBox(height: 20),
                  EntryField(
                    label: s.enterYourMessage,
                    hint: s.enterYourMessage,
                    maxLines: 5,
                  ),
                  const Spacer(),
                  CustomButton(
                    text: s.submit,
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

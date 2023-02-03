import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../routes/app_navigator.dart';
import '../../components/custom_button.dart';
import '../../components/entry_field.dart';
import '../../custom_scaffold/ui/custom_scaffold.dart';

class CreateItemPage extends StatelessWidget {
  const CreateItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.createItem),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.36,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Color(0xffA278DE),
                    Color(0xff484282),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Image.asset(Assets.imagesImgUpload, scale: 3),
                  const Spacer(flex: 2),
                  Text(s.uploadFile, style: theme.textTheme.titleLarge),
                  const Spacer(),
                  Text(
                    "JPEG, PNG, WEBP, MP4,MP3",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.disabledColor),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Text(
                          s.addNftInfo,
                          style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.primaryColorLight.withOpacity(0.7)),
                        ),
                        EntryField(
                          label: s.title,
                          hint: s.enterNftTitle,
                        ),
                        EntryField(
                          label: s.selectNftType,
                          hint: s.selectNftType,
                          readOnly: true,
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: theme.primaryColorLight,
                          ),
                        ),
                        EntryField(
                          label: s.description,
                          hint: s.enterDescription,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 72),
                      ],
                    ),
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom < 100)
                    Positioned(
                      left: 40,
                      right: 40,
                      bottom: 20,
                      child: CustomButton(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppNavigator.setPricePage,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

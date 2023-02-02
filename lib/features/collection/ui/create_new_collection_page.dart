import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../generated/l10n.dart';

class CreateNewCollectionPage extends StatelessWidget {
  const CreateNewCollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: Text(
                      s.giveANameToYourCollection,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                EntryField(
                  hint: s.enterCollectionName,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: s.createCollection,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            PositionedDirectional(
              top: -14,
              end: -10,
              child: CircleAvatar(
                backgroundColor: theme.primaryColorDark,
                foregroundColor: theme.disabledColor,
                radius: 16,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  iconSize: 16,
                  icon: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
    ).frosted(
      frostColor: theme.hintColor,
      blur: 7,
    );
  }
}

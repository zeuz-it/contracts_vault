import 'package:flutter/material.dart';
import '../../../core/custom_direction.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../routes/app_navigator.dart';
import '../../components/custom_button.dart';
import '../../custom_scaffold/ui/custom_scaffold.dart';
import '../../media.dart';
import '../../media/ui/media_card.dart';

class PublishedPage extends StatelessWidget {
  const PublishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      s.published,
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 48),
                    Expanded(
                      child: ClosedMediaCard(
                        media: Media.medias.last,
                        direction: CustomDirection.vertical,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      s.yourNftLink,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.disabledColor),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.background.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                "xaf45a46f54a5f4afasf",
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(color: theme.disabledColor),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(Icons.copy,
                                size: 16, color: theme.disabledColor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButton(
                        text: s.uploadAnother,
                        onTap: () => Navigator.popUntil(
                          context,
                          (route) =>
                              route.settings.name ==
                              AppNavigator.createItemPage,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButton(
                        text: s.home,
                        color: Colors.transparent,
                        borderColor: theme.primaryColorLight,
                        onTap: () => Navigator.popUntil(
                          context,
                          (route) =>
                              route.settings.name == AppNavigator.appNavigation,
                        ),
                      ),
                    ),
                  ],
                ),
                PositionedDirectional(
                  top: -16,
                  end: -16,
                  child: Image.asset(
                    Assets.imagesImgPublish,
                    scale: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

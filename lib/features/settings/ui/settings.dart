import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:contracts_vault/features/auth/login/login_ui.dart';
import 'package:contracts_vault/features/database/bloc/database_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';
import '/../../../features/components/curved_image.dart';
import '../../media.dart';
import '/../../../features/seller/ui/seller_row.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginUI()),
              (Route<dynamic> route) => false);
        }
      },
      buildWhen: ((previous, current) {
        if (current is AuthFailure) {
          return false;
        }
        return true;
      }),
      builder: (context, state) {
        return FadedSlideAnimation(
          beginOffset: const Offset(0.56, 0.16),
          endOffset: Offset.zero,
          child: PageView.builder(
            controller: _controller,
            itemCount: Media.medias.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ExploreCard(
              media: Media.medias[index],
              onPageChange: () {
                if (index < Media.medias.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({Key? key, required this.media, this.onPageChange})
      : super(key: key);
  final Media media;
  final VoidCallback? onPageChange;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      //TODO: firebase'den user ayarları burada çekilip listelenebilir.
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    media.name,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(media.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: theme.primaryColorLight,
                    onPressed: () {
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: theme.disabledColor,
                    onPressed: () async {
                      context.read<AuthBloc>().add(AuthSignedOut());
                    },
                  ),
                  const SizedBox(width: 4),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  media.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: theme.primaryColorLight.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Stack(
                  children: [
                    CurvedImage(
                      image: media.image,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 120,
                      child: SellerRow(media: media).frosted(
                        padding: const EdgeInsets.all(20),
                        frostColor: theme.dividerColor,
                        borderRadius: BorderRadius.circular(20),
                        blur: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

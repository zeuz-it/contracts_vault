import 'package:flutter/material.dart';
import '/../../../features/collection/models/collection.dart';
import '/../../../features/collection/ui/create_new_collection_page.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

import 'collection_card.dart';

class CollectionTab extends StatelessWidget {
  const CollectionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var s = S.of(context);
    final List<Collection> collections = [
      Collection(
        s.fineArts,
        [
          Assets.miniNfts1,
          Assets.miniNfts2,
          Assets.miniNfts3,
          Assets.miniNfts4
        ],
      ),
      Collection(
        s.threeD,
        [
          Assets.miniNfts5,
          Assets.miniNfts6,
          Assets.miniNfts7,
          Assets.miniNfts8
        ],
      ),
      Collection(
        s.paintings,
        [
          Assets.miniNfts9,
          Assets.miniNfts10,
          Assets.miniNfts11,
          Assets.miniNfts12
        ],
      ),
      Collection(
        S.of(context).landscapes,
        [
          Assets.miniNfts13,
          Assets.miniNfts14,
          Assets.miniNfts15,
          Assets.miniNfts16
        ],
      ),
    ];
    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                s.showing + " ${collections.length} " + s.collections,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.primaryColorLight.withOpacity(0.7)),
              ),
              const Spacer(),
              CustomButton(
                text: s.addNew,
                textColor: Colors.green,
                suffix: const Icon(Icons.add, color: Colors.green, size: 20),
                fontSize: 14,
                padding: EdgeInsets.zero,
                color: Colors.transparent,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CreateNewCollectionPage(),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: collections.length,
          itemBuilder: (context, index) {
            return CollectionCard(collection: collections[index]);
          },
        ),
      ],
    );
  }
}

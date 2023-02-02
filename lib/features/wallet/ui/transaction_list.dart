import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/curved_image.dart';
import '/../../../features/wallet/models/transaction.dart';
import '/../../../generated/l10n.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: Transaction.list.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var transaction = Transaction.list[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CurvedImage(
                  image: transaction.seller.image,
                  height: 44,
                  radius: 30,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      s.receivedFrom,
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColorLight.withOpacity(0.7)),
                    ),
                    Text(
                      "${transaction.seller.coinQuantity} ${transaction.seller.coinName}",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: const Color(0xff5CAB31),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  transaction.seller.name,
                  style: theme.textTheme.bodyLarge,
                ),
                dense: true,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 60.0),
                child: Text(
                  transaction.time,
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.disabledColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ).frosted(
            frostColor: theme.hintColor,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            borderRadius: BorderRadius.circular(18),
          ),
        );
      },
    );
  }
}

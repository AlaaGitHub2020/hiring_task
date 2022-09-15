import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/user_details/widgets/details/user_data_details_text.dart';
import 'package:hiring_task/presentation/user_details/widgets/details_card.dart';

class UserDataDetailsCard extends StatelessWidget {
  final User user;

  const UserDataDetailsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greenColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserDataDetailsText(),
            buildNameCard(context),
            buildEmailCard(context),
            buildPhoneCard(context),
            buildWebsiteCard(context),
          ],
        ),
      ),
    );
  }

  DetailsCard buildWebsiteCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.web,
      cardTitle: S.of(context).website,
      cardSubtitle: user.website!.getOrCrash()!,
    );
  }

  DetailsCard buildPhoneCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.phone,
      cardTitle: S.of(context).phone,
      cardSubtitle: user.phone!.getOrCrash()!,
    );
  }

  DetailsCard buildEmailCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.email,
      cardTitle: S.of(context).email,
      cardSubtitle: user.email!.getOrCrash()!,
    );
  }

  DetailsCard buildNameCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.person,
      cardTitle: S.of(context).name,
      cardSubtitle: user.name!.getOrCrash()!,
    );
  }
}

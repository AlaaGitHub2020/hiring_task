import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/user_details/widgets/company/company_data_details_text.dart';
import 'package:hiring_task/presentation/user_details/widgets/details_card.dart';

class CompanyDataDetailsCard extends StatelessWidget {
  final User user;

  const CompanyDataDetailsCard({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greenColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanyDataDetailText(),
            buildCompanyNameCard(context),
            buildCompanyBsCard(context),
            buildCompanyCatchPhraseCard(context),
          ],
        ),
      ),
    );
  }

  DetailsCard buildCompanyCatchPhraseCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.message,
      cardTitle: S.of(context).companyCatchPhrase,
      cardSubtitle: user.company!.catchPhrase!.getOrCrash()!,
    );
  }

  DetailsCard buildCompanyBsCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.biotech,
      cardTitle: S.of(context).companyBs,
      cardSubtitle: user.company!.bs!.getOrCrash()!,
    );
  }

  DetailsCard buildCompanyNameCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.group,
      cardTitle: S.of(context).companyName,
      cardSubtitle: user.company!.name!.getOrCrash()!,
    );
  }
}

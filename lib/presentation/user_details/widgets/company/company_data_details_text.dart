import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class CompanyDataDetailText extends StatelessWidget {
  const CompanyDataDetailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).companyData,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

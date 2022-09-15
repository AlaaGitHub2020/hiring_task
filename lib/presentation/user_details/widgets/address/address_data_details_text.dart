import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class AddressDataDetailsText extends StatelessWidget {
  const AddressDataDetailsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).addressData,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

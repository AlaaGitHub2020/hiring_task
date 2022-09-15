import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/user_details/widgets/address/address_data_details_text.dart';
import 'package:hiring_task/presentation/user_details/widgets/details_card.dart';

class AddressDataDetailsCard extends StatelessWidget {
  final User user;

  const AddressDataDetailsCard({Key? key, required this.user})
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
            const AddressDataDetailsText(),
            buildCityCard(context),
            buildSuiteCard(context),
            buildStreetCard(context),
            buildZipcodeCard(context),
            buildGeoLngAndGeoLatCard(context),
          ],
        ),
      ),
    );
  }

  DetailsCard buildGeoLngAndGeoLatCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.location_on_outlined,
      cardTitle: S.of(context).geoLngAndGeoLat,
      cardSubtitle:
          "${user.address!.geo!.lng!.getOrCrash()!} , ${user.address!.geo!.lat!.getOrCrash()!}",
    );
  }

  DetailsCard buildZipcodeCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.code,
      cardTitle: S.of(context).zipcode,
      cardSubtitle: user.address!.zipcode!.getOrCrash()!,
    );
  }

  DetailsCard buildStreetCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.streetview,
      cardTitle: S.of(context).street,
      cardSubtitle: user.address!.street!.getOrCrash()!,
    );
  }

  DetailsCard buildSuiteCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.airline_seat_individual_suite,
      cardTitle: S.of(context).suite,
      cardSubtitle: user.address!.suite!.getOrCrash()!,
    );
  }

  DetailsCard buildCityCard(BuildContext context) {
    return DetailsCard(
      icon: Icons.location_city,
      cardTitle: S.of(context).city,
      cardSubtitle: user.address!.city!.getOrCrash()!,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/user/user_details/user_details_bloc.dart';
import 'package:hiring_task/presentation/user_details/widgets/address/address_data_details_card.dart';
import 'package:hiring_task/presentation/user_details/widgets/albums_reviews/albums_reviews_card.dart';
import 'package:hiring_task/presentation/user_details/widgets/company/company_data_details_card.dart';
import 'package:hiring_task/presentation/user_details/widgets/details/user_data_details_card.dart';
import 'package:hiring_task/presentation/user_details/widgets/posts_reviews/posts_reviews_card.dart';
import 'package:hiring_task/presentation/user_details/widgets/user_details_custom_error_widget.dart';

class UserDetailsBody extends StatefulWidget {
  final String userId;

  const UserDetailsBody({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserDetailsBody> createState() => _UserDetailsBodyState();
}

class _UserDetailsBodyState extends State<UserDetailsBody> {
  @override
  void initState() {
    context
        .read<UserDetailsBloc>()
        .add(UserDetailsEvent.getUserDetails(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          userDetailsFailure: (failure) =>
              UserDetailsCustomErrorWidget(failure: failure),
          userDetailsFetched: (success) {
            return ListView(
              shrinkWrap: true,
              primary: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: [
                UserDataDetailsCard(user: success.userWithFullDetails),
                CompanyDataDetailsCard(user: success.userWithFullDetails),
                AddressDataDetailsCard(user: success.userWithFullDetails),
                PostsReviewsCard(user: success.userWithFullDetails),
                AlbumsReviewsCard(user: success.userWithFullDetails),
              ],
            );
          },
        );
      },
    );
  }
}

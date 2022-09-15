import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hiring_task/application/add_comment_form/add_comment_form_bloc.dart';
import 'package:hiring_task/application/albums/albums_details_bloc.dart';
import 'package:hiring_task/application/posts/post_details_bloc.dart';
import 'package:hiring_task/application/theme_cubit/theme_cubit.dart';
import 'package:hiring_task/application/user/user_details/user_details_bloc.dart';
import 'package:hiring_task/application/user/users_list/users_list_bloc.dart';
import 'package:hiring_task/domain/core/utilities/strings.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/injection.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<UsersListBloc>(
            create: (BuildContext context) => getIt<UsersListBloc>()),
        BlocProvider<PostDetailsBloc>(
            create: (BuildContext context) => getIt<PostDetailsBloc>()),
        BlocProvider<UserDetailsBloc>(
            create: (BuildContext context) => getIt<UserDetailsBloc>()),
        BlocProvider<AlbumsDetailsBloc>(
            create: (BuildContext context) => getIt<AlbumsDetailsBloc>()),
        BlocProvider<AddCommentFormBloc>(
            create: (BuildContext context) => getIt<AddCommentFormBloc>()),
      ],
      child: const HiringTask(),
    );
  }
}

class HiringTask extends StatefulWidget {
  const HiringTask({Key? key}) : super(key: key);

  @override
  State<HiringTask> createState() => _HiringTaskState();
}

class _HiringTaskState extends State<HiringTask> {
  Locale? _locale;

  final _appRouter = AppRouter();

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: kReleaseMode ? _locale : DevicePreview.locale(context),
      title: Strings.appTitle,
      theme: context.watch<ThemeCubit>().state.theme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return locale;
          }
        }
        return null;
      },
    );
  }
}

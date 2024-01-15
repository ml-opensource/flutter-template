import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/features/profile/cubit/profile_cubit.dart';
import 'package:flutter_template/presentation/features/profile/ui/profile_body.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => injector()..init(),
      child: Scaffold(
        backgroundColor: context.colors.background,
        appBar: AppBar(
          backgroundColor: context.colors.accent,
          title: const Text('Profile'),
        ),
        body: const ProfileBody(),
      ),
    );
  }
}

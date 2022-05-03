import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/feature/profile/profile_cubit.dart';
import 'package:flutter_template/presentation/feature/profile/profile_state.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profilePresenter = injector.get<ProfileCubit>();

  @override
  void initState() {
    super.initState();
    _profilePresenter.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: _profilePresenter,
          builder: (context, state) {
            return Text(state.isLoading ? 'Profile' : 'Profile: ' + state.name);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                    bloc: _profilePresenter,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text('Hi ${state.name}!');
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

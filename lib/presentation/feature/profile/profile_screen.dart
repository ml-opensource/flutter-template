import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/feature/profile/profile_presenter.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profilePresenter = injector.get<ProfilePresenter>();

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
        title: BlocBuilder<ProfilePresenter, ProfileState>(
            bloc: _profilePresenter,
            builder: (context, state) {
              return Text(
                  state.isLoading ? "Profile" : "Profile: " + state.name);
            }),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                BlocBuilder<ProfilePresenter, ProfileState>(
                    bloc: _profilePresenter,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return CircularProgressIndicator();
                      } else {
                        return Text("Hi ${state.name}!");
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

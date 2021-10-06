import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/data/services/http_profile_service.dart';
import 'package:flutter_template/presentation/feature/profile/profile_state.dart';
import 'package:flutter_template/presentation/feature/profile/profile_view_model.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _provider = StateNotifierProvider<ProfileViewModel, ProfileState>(
      (ref) => ProfileViewModel(profileService: HttpProfileService()));

  @override
  void initState() {
    super.initState();
    context.read(_provider.notifier).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: Consumer(
          builder: (context, watch, child) {
            return Text(watch(_provider).isLoading
                ? 'Profile'
                : 'Profile: ' + watch(_provider).name);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Consumer(builder: (context, watch, child) {
                  if (watch(_provider).isLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text('Hi ${watch(_provider).name}!');
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

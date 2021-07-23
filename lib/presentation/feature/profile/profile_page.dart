import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/feature/profile/profile_presenter.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({Key? key}) : super(key: key);

    @override
    _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    @override
    void initState() {
        super.initState();

    }

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
            create: (context) => ProfilePresenter(),
            child: Scaffold(
                backgroundColor: context.colors.background,
                appBar: AppBar(
                    backgroundColor: context.colors.accent,
                    title: Text("Profile"),
                ),
            )
        );
    }
}

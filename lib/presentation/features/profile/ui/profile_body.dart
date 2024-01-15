import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/features/profile/cubit/profile_cubit.dart';
import 'package:flutter_template/presentation/widgets/loading_indicator/app_loading_indicator.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    final status = context.select(
      (ProfileCubit cubit) => cubit.state.initializationStatus,
    );

    final name = context.select(
      (ProfileCubit cubit) => cubit.state.name,
    );

    final child = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: status.maybeWhen(
            loading: () => AppLoadingIndicator.small(),
            success: () => Text(
              name,
              textAlign: TextAlign.center,
            ),
            orElse: () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Something went wrong.',
                  ),
                  TextButton(
                    onPressed: profileCubit.init,
                    child: const Text('Try again.'),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: child,
    );
  }
}

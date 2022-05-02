import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:flutter_template/extensions/extensions.dart';
import 'package:flutter_template/presentation/feature/profile/profile_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService profileService;

  ProfileCubit({
    required this.profileService,
    @visibleForTesting ProfileState? state,
  }) : super(state ?? ProfileState.initial());

  void load() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    await profileService
        .getProfileName()
        .then(
          (value) => emit(
            state.copyWith(isLoading: false, name: value ?? ''),
          ),
        )
        .catchPrintError((e, s) {
      emit(
        state.copyWith(
          isLoading: false,
          name: '',
        ),
      );
    });
  }
}

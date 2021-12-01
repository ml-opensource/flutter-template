import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/feature/profile/profile_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfilePresenter extends Cubit<ProfileState> {
  final ProfileService profileService;

  ProfilePresenter({
    required this.profileService,
    @visibleForTesting ProfileState? state,
  }) : super(state ?? ProfileState.initial());

  void load() async {
    emit(state.copyWith(isLoading: true));
    var profileName = await profileService.getProfileName() ?? "";
    emit(state.copyWith(isLoading: false, name: profileName));
  }
}

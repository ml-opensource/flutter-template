import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/response_objects/response_error.dart';
import 'package:flutter_template/domain/common/base_status/base_status.dart';
import 'package:flutter_template/domain/use_cases/profile/get_profile_use_case.dart';

import 'package:flutter_template/presentation/features/profile/cubit/profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfileUseCase) : super(ProfileState.initial());

  final GetProfileUseCase _getProfileUseCase;

  Future<void> init() async {
    if (state.initializationStatus.isLoading) {
      return;
    }

    emit(
      state.copyWith(initializationStatus: const BaseStatus.loading()),
    );

    try {
      final profileName = await _getProfileUseCase();

      if (isClosed) return;

      return emit(
        state.copyWith(
          initializationStatus: const BaseStatus.success(),
          name: profileName ?? 'N/A',
        ),
      );
    } catch (e) {
      final responseError = ResponseError.from(e);

      if (isClosed) return;

      return emit(
        state.copyWith(
          initializationStatus: BaseStatus.failure(responseError),
        ),
      );
    }
  }
}

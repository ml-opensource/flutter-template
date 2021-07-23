
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_presenter.freezed.dart';
part 'profile_state.dart';

class ProfilePresenter extends Cubit<ProfileState> {
	ProfilePresenter({
		@visibleForTesting ProfileState? state
	}) : super(state ?? ProfileState.initial());

	void load() async {
		emit(state.copyWith(isLoading: true));
		await Future.delayed(Duration(milliseconds: 800));
		emit(state.copyWith(isLoading: false, name: "Michael Laudrup"));
	}
}
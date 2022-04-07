import 'package:flutter_template/presentation/routes/router.gr.dart';

class AppNavigator {
  final AppRouter _appRouter;

  AppNavigator(this._appRouter);

  Future navigateToHome() {
    return _appRouter.replace(HomeScreenRoute());
  }
}

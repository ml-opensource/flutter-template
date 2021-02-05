abstract class BaseUseCase<Output> {
  Future<Output> run();
}

abstract class BaseStreamUseCase<Output> {
  Stream<Output> run();
}
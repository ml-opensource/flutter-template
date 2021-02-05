abstract class UseCase<Output> {
  Future<Output> run();
}

abstract class StreamUseCase<Output> {
  Stream<Output> run();
}

abstract class UseCase<Input, Output> {
  Output run(Input input);
}

abstract class OutputUseCase<Output> {
  Output run();
}

abstract class StreamUseCase<Output> {
  Stream<Output> run();
}

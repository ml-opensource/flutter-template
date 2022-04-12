class {{name.pascalCase()}}UseCase extends StreamUseCase<{{input_type.pascalCase()}}, {{output_type.pascalCase()}}> {
  @override
  Stream<{{output_type.pascalCase()}}> run({{input_type.pascalCase()}} input) {
    // TODO: implement usecase
  }
}
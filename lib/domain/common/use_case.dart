/// Future output use case that would take in an [Input] and return [Output].
///
/// Used when we need to consider any inputs like filtering parameters etc.
///
/// Example:
/// // import tuple
/// typedef Input = Tuple<List<Story>, Query>;
///
/// ```dart
/// class QueryStoriesUseCase extends UseCase<Input, List<Story>> {
///   @override
///   List<Story> run(Input input) {
///     final stories = input.item1;
///     final query = input.item2;
///     return stories.where((story) => story.name.contains(query.name));
///   }
/// }
///
/// class Query {
//   final int age;
//   final String name;
//   final String author;
//
//   Query(this.age, this.name, this.author);
// }
/// ```
///
abstract class UseCase<Input, Output> {
  Output run(Input input);
}

/// Output use case that would return [Output].
///
/// Used when we don't need to consider any inputs like filtering parameters etc.
///
/// Example:
///
/// ```dart
/// class AgeValidationUseCase extends OutputUseCase<bool> {
///   AgeValidationUseCase({
///     required this.user,
///   });
///
///   final User user;
///
///   @override
///   bool run() {
///     return user.age >= 18;
///   }
/// }
/// ```
///
abstract class OutputUseCase<Output> {
  Output run();
}

/// Stream use case that would return [Output] as a [Stream].
///
/// Used when we want to get an async sequence of data.
/// <https://dart.dev/tutorials/language/streams/>
///
/// Example:
///
/// ```dart
/// class ObserveStoryPlayerStateUseCase extends StreamUseCase<StoryPlayerState> {
///   GetAllStoriesUseCase({
///     required this.storyPlayerPreferences,
///   });
///
///   final StoryPlayerPreferences storyPlayerPreferences;
///
///   @override
///   Stream<StoryPlayerState> run() {
///     return storyPlayerPreferences
//         .getStoryPlayerStateStream()
//         .where((storyPlayerState) => storyPlayerState.hasStoryForPlayback);
///   }
/// }
/// ```
///
abstract class StreamUseCase<Output> {
  Stream<Output> run();
}

/// Future output use case that would take in an [Input] and return [Output] as a [Future].
///
/// Used when we need to consider any inputs like filtering parameters etc.
///
/// Example:
///
/// ```dart
/// class QueryStoriesUseCase extends FutureUseCase<Query, List<Story>> {
///   QueryStoriesUseCase({
///     required this.storiesService,
///   });
///
///   final StoriesService storiesService;
///
///   @override
///   Future<List<Story>> run(Query input) async {
///     return storiesService.queryStories(input);
///   }
/// }
///
/// class Query {
//   final int age;
//   final String name;
//   final String author;
//
//   Query(this.age, this.name, this.author);
// }
/// ```
///
abstract class FutureUseCase<Input, Output> {
  Future<Output> run(Input input);
}

/// Future output use case that would return [Output] as a [Future].
///
/// Used when we don't need to consider any inputs like filtering parameters etc.
///
/// Example:
///
/// ```dart
/// class GetAllStoriesUseCase extends FutureOutputUseCase<List<Story>> {
///   GetAllStoriesUseCase({
///     required this.storiesService,
///   });
///
///   final StoriesService storiesService;
///
///   @override
///   Future<List<Story>> run() async {
///     return storiesService.fetchAllStories();
///   }
/// }
/// ```
///
abstract class FutureOutputUseCase<Output> {
  Future<Output> run();
}

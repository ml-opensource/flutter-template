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
///     required this._user,
///   });
///
///   final User _user;
///
///   @override
///   bool run() {
///     return _user.age >= 18;
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
/// class ObserveStoryPlayerStateUseCase extends StreamOutputUseCase<StoryPlayerState> {
///   ObserveStoryPlayerStateUseCase({
///     required this._storyPlayerPreferences,
///   });
///
///   final StoryPlayerPreferences _storyPlayerPreferences;
///
///   @override
///   Stream<StoryPlayerState> run() {
///     return _storyPlayerPreferences
//         .getStoryPlayerStateStream()
//         .where((storyPlayerState) => storyPlayerState.hasStoryForPlayback);
///   }
/// }
/// ```
///
abstract class StreamOutputUseCase<Output>
    extends OutputUseCase<Stream<Output>> {
  @override
  Stream<Output> run();
}

/// Stream output use case that would take in an [Input] and return [Output] as a [Stream].
///
/// Used when we want to get an async sequence of data.
/// <https://dart.dev/tutorials/language/streams/>
///
/// Example:
///
/// ```dart
/// class ObserveStoryPlayerStateFromStoryIdUseCase extends StreamUseCase<Query, StoryPlayerState> {
///   ObserveStoryPlayerStateFromStoryIdUseCase({
///     required this._storyPlayerPreferences,
///   });
///
///   final StoryPlayerPreferences _storyPlayerPreferences;
///
///   @override
///   Stream<StoryPlayerState> run(Query input) {
///     return _storyPlayerPreferences
//         .getStoryPlayerStateStreamFromStoryID(input.storyID)
//         .where((storyPlayerState) => storyPlayerState.hasStoryForPlayback);
///   }
/// }
///
/// class Query {
//    final String name;
//    final String author;
//    final int storyID;
//
//    Query(this.name, this.author, this.storyID);
//  }
/// ```
///
abstract class StreamUseCase<Input, Output>
    extends UseCase<Input, Stream<Output>> {
  @override
  Stream<Output> run(Input input);
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
///     required this._storiesService,
///   });
///
///   final StoriesService _storiesService;
///
///   @override
///   Future<List<Story>> run(Query input) async {
///     return _storiesService.queryStories(input);
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
abstract class FutureUseCase<Input, Output>
    extends UseCase<Input, Future<Output>> {
  @override
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
///     required this._storiesService,
///   });
///
///   final StoriesService _storiesService;
///
///   @override
///   Future<List<Story>> run() async {
///     return _storiesService.fetchAllStories();
///   }
/// }
/// ```
///
abstract class FutureOutputUseCase<Output>
    extends OutputUseCase<Future<Output>> {
  @override
  Future<Output> run();
}

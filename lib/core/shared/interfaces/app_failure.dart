abstract class AppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppFailure({required this.message, required this.stackTrace});
}

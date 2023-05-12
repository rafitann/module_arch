abstract class AppFailure implements Exception {
  const AppFailure({required this.message, required this.stackTrace});

  final String message;
  final StackTrace stackTrace;
}

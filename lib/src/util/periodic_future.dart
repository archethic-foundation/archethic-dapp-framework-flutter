import 'dart:async';

class PeriodicFuture {
  /// Executes [action] until verification succeeds.
  /// It waits [sleepDuration] between each run.
  static Future<T> periodic<T>(
    FutureOr<T> Function() action, {
    required Duration sleepDuration,
    required bool Function(T value) until,
  }) async {
    late T result;
    await Future.doWhile(() async {
      result = await action();
      return !until(result);
    });
    return result;
  }
}

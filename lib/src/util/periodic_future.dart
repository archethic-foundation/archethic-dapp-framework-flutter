import 'dart:async';

class PeriodicFuture {
  static Future<T> periodic<T>(
    FutureOr<T> Function() action, {
    required Duration sleepDuration,
    required bool Function(T value) until,
    Completer<void>? cancelCompleter,
  }) async {
    late T result;
    try {
      await Future.doWhile(() async {
        result = await action();
        if (until(result)) {
          return false;
        }
        await Future.any(
          [
            Future.delayed(sleepDuration),
            if (cancelCompleter != null) cancelCompleter.future,
          ],
        );
        return cancelCompleter == null || !cancelCompleter.isCompleted;
      });
    } catch (e) {
      if (cancelCompleter != null && cancelCompleter.isCompleted) {
        // If the cancelCompleter was completed, it means we should stop the loop.
        return result;
      }
      rethrow;
    }
    return result;
  }
}

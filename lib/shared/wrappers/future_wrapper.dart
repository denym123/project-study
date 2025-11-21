import 'package:flutter/foundation.dart';
import 'package:signals/signals.dart';

class FutureWrapper<T> {
  AsyncSignal<T> asyncSignal;
  Future<T> Function() future;
  Future Function(T value)? onValue;
  VoidCallback? onError;
  VoidCallback? onCompleted;

  FutureWrapper({
    required this.asyncSignal,
    required this.future,
    this.onValue,
    this.onError,
    this.onCompleted,
  });

  Future<void> execute() async {
    try {
      asyncSignal.value = AsyncLoading();
      final result = await future();
      if (onValue != null) {
        await onValue!(result);
      }
      asyncSignal.value = AsyncData(result);
    } catch (e, s) {
      asyncSignal.value = AsyncError(e, s);
      if (onError != null) {
        onError!();
      }
    } finally {
      if (onCompleted != null) {
        onCompleted!();
      }
    }
  }
}

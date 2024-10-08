import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class ProvidersLogger extends ProviderObserver {
  ProvidersLogger();

  Logger _logger(ProviderBase<Object?> provider) => Logger(
        '${provider.name ?? 'Provider'}<${provider.hashCode}>',
      );

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger(provider).fine('didAddProvider($value)');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger(provider).fine('didUpdateProvider($newValue)');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _logger(provider).fine('providerDidFail($error)');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    _logger(provider).fine('didDisposeProvider');
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_price.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinPriceRepositoryHash() =>
    r'd571b12cd0c140f89007d4b6ce9b11a5a0caa01f';

/// See also [_coinPriceRepository].
@ProviderFor(_coinPriceRepository)
final _coinPriceRepositoryProvider = Provider<CoinPriceRepositoryImpl>.internal(
  _coinPriceRepository,
  name: r'_coinPriceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinPriceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _CoinPriceRepositoryRef = ProviderRef<CoinPriceRepositoryImpl>;
String _$coinPriceHash() => r'5b8ef5836a77a2716a95391022b058d0c5e849af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [_coinPrice].
@ProviderFor(_coinPrice)
const _coinPriceProvider = _CoinPriceFamily();

/// See also [_coinPrice].
class _CoinPriceFamily extends Family<AsyncValue<double>> {
  /// See also [_coinPrice].
  const _CoinPriceFamily();

  /// See also [_coinPrice].
  _CoinPriceProvider call({
    required String address,
    Environment? environment,
  }) {
    return _CoinPriceProvider(
      address: address,
      environment: environment,
    );
  }

  @override
  _CoinPriceProvider getProviderOverride(
    covariant _CoinPriceProvider provider,
  ) {
    return call(
      address: provider.address,
      environment: provider.environment,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_coinPriceProvider';
}

/// See also [_coinPrice].
class _CoinPriceProvider extends FutureProvider<double> {
  /// See also [_coinPrice].
  _CoinPriceProvider({
    required String address,
    Environment? environment,
  }) : this._internal(
          (ref) => _coinPrice(
            ref as _CoinPriceRef,
            address: address,
            environment: environment,
          ),
          from: _coinPriceProvider,
          name: r'_coinPriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$coinPriceHash,
          dependencies: _CoinPriceFamily._dependencies,
          allTransitiveDependencies:
              _CoinPriceFamily._allTransitiveDependencies,
          address: address,
          environment: environment,
        );

  _CoinPriceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
    required this.environment,
  }) : super.internal();

  final String address;
  final Environment? environment;

  @override
  Override overrideWith(
    FutureOr<double> Function(_CoinPriceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _CoinPriceProvider._internal(
        (ref) => create(ref as _CoinPriceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
        environment: environment,
      ),
    );
  }

  @override
  FutureProviderElement<double> createElement() {
    return _CoinPriceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _CoinPriceProvider &&
        other.address == address &&
        other.environment == environment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, environment.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _CoinPriceRef on FutureProviderRef<double> {
  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `environment` of this provider.
  Environment? get environment;
}

class _CoinPriceProviderElement extends FutureProviderElement<double>
    with _CoinPriceRef {
  _CoinPriceProviderElement(super.provider);

  @override
  String get address => (origin as _CoinPriceProvider).address;
  @override
  Environment? get environment => (origin as _CoinPriceProvider).environment;
}

String _$coinPricesNotifierHash() =>
    r'6f2b703169d62c9ef9968588d6e780566034dc84';

/// See also [_CoinPricesNotifier].
@ProviderFor(_CoinPricesNotifier)
final _coinPricesNotifierProvider =
    NotifierProvider<_CoinPricesNotifier, CryptoPrice>.internal(
  _CoinPricesNotifier.new,
  name: r'_coinPricesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinPricesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CoinPricesNotifier = Notifier<CryptoPrice>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

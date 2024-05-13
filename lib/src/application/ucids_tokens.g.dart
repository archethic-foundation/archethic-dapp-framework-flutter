// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ucids_tokens.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ucidsTokensRepositoryHash() =>
    r'9f920f785a6782fb0089a11caa73f88a388b4d50';

/// See also [_ucidsTokensRepository].
@ProviderFor(_ucidsTokensRepository)
final _ucidsTokensRepositoryProvider =
    Provider<UcidsTokensRepositoryImpl>.internal(
  _ucidsTokensRepository,
  name: r'_ucidsTokensRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ucidsTokensRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _UcidsTokensRepositoryRef = ProviderRef<UcidsTokensRepositoryImpl>;
String _$getUcidsTokensHash() => r'1f2e6f3f0d5af713ec0e916a64a420ebcb136810';

/// See also [_getUcidsTokens].
@ProviderFor(_getUcidsTokens)
final _getUcidsTokensProvider = FutureProvider<UcidsTokens>.internal(
  _getUcidsTokens,
  name: r'_getUcidsTokensProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUcidsTokensHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _GetUcidsTokensRef = FutureProviderRef<UcidsTokens>;
String _$getUcidsTokensFromNetworkHash() =>
    r'b758d283fb94ffa8b49ce43112d87721ac00af21';

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

/// See also [_getUcidsTokensFromNetwork].
@ProviderFor(_getUcidsTokensFromNetwork)
const _getUcidsTokensFromNetworkProvider = _GetUcidsTokensFromNetworkFamily();

/// See also [_getUcidsTokensFromNetwork].
class _GetUcidsTokensFromNetworkFamily
    extends Family<AsyncValue<Map<String, int>>> {
  /// See also [_getUcidsTokensFromNetwork].
  const _GetUcidsTokensFromNetworkFamily();

  /// See also [_getUcidsTokensFromNetwork].
  _GetUcidsTokensFromNetworkProvider call(
    String network,
  ) {
    return _GetUcidsTokensFromNetworkProvider(
      network,
    );
  }

  @override
  _GetUcidsTokensFromNetworkProvider getProviderOverride(
    covariant _GetUcidsTokensFromNetworkProvider provider,
  ) {
    return call(
      provider.network,
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
  String? get name => r'_getUcidsTokensFromNetworkProvider';
}

/// See also [_getUcidsTokensFromNetwork].
class _GetUcidsTokensFromNetworkProvider
    extends FutureProvider<Map<String, int>> {
  /// See also [_getUcidsTokensFromNetwork].
  _GetUcidsTokensFromNetworkProvider(
    String network,
  ) : this._internal(
          (ref) => _getUcidsTokensFromNetwork(
            ref as _GetUcidsTokensFromNetworkRef,
            network,
          ),
          from: _getUcidsTokensFromNetworkProvider,
          name: r'_getUcidsTokensFromNetworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUcidsTokensFromNetworkHash,
          dependencies: _GetUcidsTokensFromNetworkFamily._dependencies,
          allTransitiveDependencies:
              _GetUcidsTokensFromNetworkFamily._allTransitiveDependencies,
          network: network,
        );

  _GetUcidsTokensFromNetworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.network,
  }) : super.internal();

  final String network;

  @override
  Override overrideWith(
    FutureOr<Map<String, int>> Function(_GetUcidsTokensFromNetworkRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _GetUcidsTokensFromNetworkProvider._internal(
        (ref) => create(ref as _GetUcidsTokensFromNetworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        network: network,
      ),
    );
  }

  @override
  FutureProviderElement<Map<String, int>> createElement() {
    return _GetUcidsTokensFromNetworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _GetUcidsTokensFromNetworkProvider &&
        other.network == network;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, network.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _GetUcidsTokensFromNetworkRef on FutureProviderRef<Map<String, int>> {
  /// The parameter `network` of this provider.
  String get network;
}

class _GetUcidsTokensFromNetworkProviderElement
    extends FutureProviderElement<Map<String, int>>
    with _GetUcidsTokensFromNetworkRef {
  _GetUcidsTokensFromNetworkProviderElement(super.provider);

  @override
  String get network => (origin as _GetUcidsTokensFromNetworkProvider).network;
}

String _$getUcidFromAddressHash() =>
    r'8b45bfdb95d2c0a8bd5455e594e7c91d6b215274';

/// See also [_getUcidFromAddress].
@ProviderFor(_getUcidFromAddress)
const _getUcidFromAddressProvider = _GetUcidFromAddressFamily();

/// See also [_getUcidFromAddress].
class _GetUcidFromAddressFamily extends Family<AsyncValue<int>> {
  /// See also [_getUcidFromAddress].
  const _GetUcidFromAddressFamily();

  /// See also [_getUcidFromAddress].
  _GetUcidFromAddressProvider call(
    String address,
    String network,
  ) {
    return _GetUcidFromAddressProvider(
      address,
      network,
    );
  }

  @override
  _GetUcidFromAddressProvider getProviderOverride(
    covariant _GetUcidFromAddressProvider provider,
  ) {
    return call(
      provider.address,
      provider.network,
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
  String? get name => r'_getUcidFromAddressProvider';
}

/// See also [_getUcidFromAddress].
class _GetUcidFromAddressProvider extends FutureProvider<int> {
  /// See also [_getUcidFromAddress].
  _GetUcidFromAddressProvider(
    String address,
    String network,
  ) : this._internal(
          (ref) => _getUcidFromAddress(
            ref as _GetUcidFromAddressRef,
            address,
            network,
          ),
          from: _getUcidFromAddressProvider,
          name: r'_getUcidFromAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUcidFromAddressHash,
          dependencies: _GetUcidFromAddressFamily._dependencies,
          allTransitiveDependencies:
              _GetUcidFromAddressFamily._allTransitiveDependencies,
          address: address,
          network: network,
        );

  _GetUcidFromAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
    required this.network,
  }) : super.internal();

  final String address;
  final String network;

  @override
  Override overrideWith(
    FutureOr<int> Function(_GetUcidFromAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _GetUcidFromAddressProvider._internal(
        (ref) => create(ref as _GetUcidFromAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
        network: network,
      ),
    );
  }

  @override
  FutureProviderElement<int> createElement() {
    return _GetUcidFromAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _GetUcidFromAddressProvider &&
        other.address == address &&
        other.network == network;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, network.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _GetUcidFromAddressRef on FutureProviderRef<int> {
  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `network` of this provider.
  String get network;
}

class _GetUcidFromAddressProviderElement extends FutureProviderElement<int>
    with _GetUcidFromAddressRef {
  _GetUcidFromAddressProviderElement(super.provider);

  @override
  String get address => (origin as _GetUcidFromAddressProvider).address;
  @override
  String get network => (origin as _GetUcidFromAddressProvider).network;
}

String _$ucidsTokensNotifierHash() =>
    r'd9b47b3203cfbc64177f4c18fda691a24c227379';

/// See also [_UcidsTokensNotifier].
@ProviderFor(_UcidsTokensNotifier)
final _ucidsTokensNotifierProvider =
    NotifierProvider<_UcidsTokensNotifier, Map<String, int>>.internal(
  _UcidsTokensNotifier.new,
  name: r'_ucidsTokensNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ucidsTokensNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UcidsTokensNotifier = Notifier<Map<String, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

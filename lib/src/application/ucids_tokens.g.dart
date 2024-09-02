// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ucids_tokens.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ucidsTokensHash() => r'9324c436181882b1e20b882e64ad2890c6b01f07';

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

/// See also [_ucidsTokens].
@ProviderFor(_ucidsTokens)
const _ucidsTokensProvider = _UcidsTokensFamily();

/// See also [_ucidsTokens].
class _UcidsTokensFamily extends Family<AsyncValue<Map<String, int>>> {
  /// See also [_ucidsTokens].
  const _UcidsTokensFamily();

  /// See also [_ucidsTokens].
  _UcidsTokensProvider call({
    String? network,
  }) {
    return _UcidsTokensProvider(
      network: network,
    );
  }

  @override
  _UcidsTokensProvider getProviderOverride(
    covariant _UcidsTokensProvider provider,
  ) {
    return call(
      network: provider.network,
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
  String? get name => r'_ucidsTokensProvider';
}

/// See also [_ucidsTokens].
class _UcidsTokensProvider extends FutureProvider<Map<String, int>> {
  /// See also [_ucidsTokens].
  _UcidsTokensProvider({
    String? network,
  }) : this._internal(
          (ref) => _ucidsTokens(
            ref as _UcidsTokensRef,
            network: network,
          ),
          from: _ucidsTokensProvider,
          name: r'_ucidsTokensProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ucidsTokensHash,
          dependencies: _UcidsTokensFamily._dependencies,
          allTransitiveDependencies:
              _UcidsTokensFamily._allTransitiveDependencies,
          network: network,
        );

  _UcidsTokensProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.network,
  }) : super.internal();

  final String? network;

  @override
  Override overrideWith(
    FutureOr<Map<String, int>> Function(_UcidsTokensRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UcidsTokensProvider._internal(
        (ref) => create(ref as _UcidsTokensRef),
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
    return _UcidsTokensProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UcidsTokensProvider && other.network == network;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, network.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _UcidsTokensRef on FutureProviderRef<Map<String, int>> {
  /// The parameter `network` of this provider.
  String? get network;
}

class _UcidsTokensProviderElement
    extends FutureProviderElement<Map<String, int>> with _UcidsTokensRef {
  _UcidsTokensProviderElement(super.provider);

  @override
  String? get network => (origin as _UcidsTokensProvider).network;
}

String _$ucidHash() => r'4d6dfd27cd477d31b6566d21238e0853afccc4e4';

/// See also [_ucid].
@ProviderFor(_ucid)
const _ucidProvider = _UcidFamily();

/// See also [_ucid].
class _UcidFamily extends Family<AsyncValue<int>> {
  /// See also [_ucid].
  const _UcidFamily();

  /// See also [_ucid].
  _UcidProvider call({
    required String address,
    String? network,
  }) {
    return _UcidProvider(
      address: address,
      network: network,
    );
  }

  @override
  _UcidProvider getProviderOverride(
    covariant _UcidProvider provider,
  ) {
    return call(
      address: provider.address,
      network: provider.network,
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
  String? get name => r'_ucidProvider';
}

/// See also [_ucid].
class _UcidProvider extends FutureProvider<int> {
  /// See also [_ucid].
  _UcidProvider({
    required String address,
    String? network,
  }) : this._internal(
          (ref) => _ucid(
            ref as _UcidRef,
            address: address,
            network: network,
          ),
          from: _ucidProvider,
          name: r'_ucidProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$ucidHash,
          dependencies: _UcidFamily._dependencies,
          allTransitiveDependencies: _UcidFamily._allTransitiveDependencies,
          address: address,
          network: network,
        );

  _UcidProvider._internal(
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
  final String? network;

  @override
  Override overrideWith(
    FutureOr<int> Function(_UcidRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UcidProvider._internal(
        (ref) => create(ref as _UcidRef),
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
    return _UcidProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UcidProvider &&
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

mixin _UcidRef on FutureProviderRef<int> {
  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `network` of this provider.
  String? get network;
}

class _UcidProviderElement extends FutureProviderElement<int> with _UcidRef {
  _UcidProviderElement(super.provider);

  @override
  String get address => (origin as _UcidProvider).address;
  @override
  String? get network => (origin as _UcidProvider).network;
}

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

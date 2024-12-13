/// Represents the different environments available for the Archethic network.
///
/// Each environment has a unique label and endpoint, allowing the user to
/// differentiate between Mainnet, Testnet, and Devnet.
///
/// Example:
/// ```dart
/// final env = Environment.mainnet;
/// print(env.label); // Output: Archethic Mainnet
/// print(env.endpoint); // Output: https://mainnet.archethic.net
///
/// // Retrieve an environment by its endpoint.
/// final testEnv = Environment.byEndpoint('https://testnet.archethic.net');
/// print(testEnv.label); // Output: Archethic Testnet
/// ```
enum Environment {
  /// The production network (Mainnet) of Archethic.
  mainnet(
    label: 'Archethic Mainnet',
    endpoint: 'https://mainnet.archethic.net',
  ),

  /// The test network (Testnet) of Archethic.
  testnet(
    label: 'Archethic Testnet',
    endpoint: 'https://testnet.archethic.net',
  ),

  /// The development network (Devnet) for local testing.
  devnet(
    label: 'Archethic Devnet',
    endpoint: 'http://localhost:4000',
  );

  /// Creates an [Environment] with a specific [label] and [endpoint].
  const Environment({
    required this.label,
    required this.endpoint,
  });

  /// The human-readable name of the environment.
  final String label;

  /// The URL endpoint for the environment.
  final String endpoint;

  /// Retrieves the [Environment] corresponding to the given [endpoint].
  ///
  /// Throws a [StateError] if no environment matches the provided endpoint.
  static Environment byEndpoint(String endpoint) =>
      Environment.values.firstWhere(
        (environment) => environment.endpoint == endpoint,
        orElse: () =>
            throw StateError('No environment found for endpoint $endpoint'),
      );
}

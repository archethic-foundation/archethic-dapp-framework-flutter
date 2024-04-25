import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';
part 'failures.g.dart';

class FailureJsonConverter
    extends JsonConverter<Failure, Map<String, dynamic>> {
  const FailureJsonConverter();

  @override
  Failure fromJson(Map<String, dynamic> json) {
    return Failure.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Failure object) => object.toJson();
}

@freezed
class Failure with _$Failure implements Exception {
  const Failure._();
  const factory Failure.loggedOut() = LoggedOut;
  const factory Failure.network() = NetworkFailure;
  const factory Failure.quotaExceeded({
    DateTime? cooldownEndDate,
  }) = QuotaExceededFailure;
  const factory Failure.serviceNotFound() = ServiceNotFound;
  const factory Failure.serviceAlreadyExists() = ServiceAlreadyExists;
  const factory Failure.poolAlreadyExists() = PoolAlreadyExists;
  const factory Failure.lpTokenAmountExceedBalance() =
      LPTokenAmountExceedBalance;
  const factory Failure.poolNotExists() = PoolNotExists;
  const factory Failure.insufficientFunds() = InsufficientFunds;
  const factory Failure.unauthorized() = Unauthorized;
  const factory Failure.invalidValue() = InvalidValue;
  const factory Failure.htlcWithoutFunds() = HTLCWithoutFunds;
  const factory Failure.notHTLC() = NotHTLC;
  const factory Failure.faucetUCOError() = FaucetUCOError;
  const factory Failure.faucetUCOUserRejected() = FaucetUCUserRejected;
  const factory Failure.wrongNetwork(
    String cause,
  ) = WrongNetwork;
  const factory Failure.insufficientPoolFunds() = InsufficientPoolFunds;
  const factory Failure.incompatibleBrowser() = IncompatibleBrowser;
  const factory Failure.chainSwitchNotSupported() = ChainSwitchNotSupported;
  const factory Failure.connectivityEVM() = ConnectivityEVM;
  const factory Failure.walletNotSupportedEVM() = WalletNotSupportedEVM;
  const factory Failure.noWalletSupportedEVM() = NoWalletSupportedEVM;
  const factory Failure.paramEVMChain() = ParamEVMChain;
  const factory Failure.userRejected() = UserRejected;
  const factory Failure.connectivityArchethic() = ConnectivityArchethic;
  const factory Failure.timeout() = Timeout;
  const factory Failure.rpcErrorEVM(
    String? cause,
  ) = RPCErrorEVM;

  const factory Failure.other({
    String? cause,
    String? stack,
  }) = OtherFailure;

  factory Failure.fromError(Object error) {
    if (error is Failure) return error;

    return const Failure.other();
  }

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}

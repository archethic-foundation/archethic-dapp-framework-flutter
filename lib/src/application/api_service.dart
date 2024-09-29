import 'package:archethic_dapp_framework_flutter/src/domain/models/environment.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(
  ApiServiceRef ref,
  Environment environment,
) =>
    ApiService(environment.endpoint);

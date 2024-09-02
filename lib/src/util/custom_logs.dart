/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LogManager {
  LogManager({
    required this.url,
    this.sendInterval = const Duration(seconds: 60),
    this.batchSize = 1,
    this.logsActived = true,
  }) {
    if (!kDebugMode) {
      _timer = Timer.periodic(sendInterval, (Timer t) => _sendLogs());
    }
  }
  final Duration sendInterval;
  final int batchSize;
  bool logsActived;
  List<Map<String, dynamic>> _logQueue = [];
  Timer? _timer;
  final String url;

  void log(
    String message, {
    String? name,
    StackTrace? stackTrace,
    LogLevel level = LogLevel.info,
  }) {
    final timeStamp = DateTime.now().toIso8601String();
    if (logsActived == false) return;
    if (message.isEmpty) return;
    if (kDebugMode) {
      if (name != null) {
        if (stackTrace != null) {
          debugPrint('$timeStamp, $message, $name, $stackTrace');
        } else {
          debugPrint('$timeStamp, $message, $name');
        }
      } else {
        if (stackTrace != null) {
          debugPrint('$timeStamp, $message, $stackTrace');
        } else {
          debugPrint('$timeStamp, $message');
        }
      }
    } else {
      final logEntry = <String, dynamic>{
        'timestamp': timeStamp,
        'message': message,
        'level': level.toString(),
        'stacktrace': stackTrace.toString(),
        'name': name ?? '',
      };
      _logQueue.add(logEntry);
      if (_logQueue.length >= batchSize) {
        _sendLogs();
      }
    }
  }

  Future<void> _sendLogs() async {
    if (_logQueue.isEmpty) return;

    try {
      final response = await http.post(
        Uri.parse(
          url,
        ),
        body: json.encode(_logQueue),
      );

      if (response.statusCode == 200) {
        _logQueue = [];
      } else {
        developer.log(
          'Failed to send logs to server, response status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      developer.log('Error sending logs to server: $e');
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}

enum LogLevel { debug, info, warning, error }

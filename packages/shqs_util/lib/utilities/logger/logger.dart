import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';

enum LogLevel { verbose, debug, info, warn, error }

extension _LogLevelOperator on LogLevel {

  bool operator <(LogLevel other) => index < other.index;
  bool operator <=(LogLevel other) => index <= other.index;
  bool operator >(LogLevel other) => index > other.index;
  bool operator >=(LogLevel other) => index >= other.index;
}

extension Level on LogLevel {

  String get level {
    if (index == LogLevel.verbose.index) return 'verbose';
    if (index == LogLevel.debug.index) return 'debug';
    if (index == LogLevel.info.index) return 'info';
    if (index == LogLevel.warn.index) return 'warn';
    return 'error';
  }
}

/// Print log message and return itself.
///
/// ```Dart
/// // Example
/// 'Debug'.d(); // Print `[d] [2021-04-22T13:26:37.199067][Shqs] Debug` and return `Debug`
/// 'Debug'.d(tag: 'TAG'); // Print `[d] [2021-04-22T13:26:37.199067][TAG] Debug` and return `Debug`
/// ```
const _defaultTag = 'Shqs';
extension LoggerEx on String {

  String v({String tag = _defaultTag}) {
    GeLog.v(tag, this);
    return this;
  }

  String d({String tag = _defaultTag}) {
    GeLog.d(tag, this);
    return this;
  }

  String i({String tag = _defaultTag}) {
    GeLog.i(tag, this);
    return this;
  }

  String w({String tag = _defaultTag}) {
    GeLog.w(tag, this);
    return this;
  }

  String e({String tag = 'Shqs', Error? error, Exception? exception}) {
    GeLog.e(tag, this, error: error, exception: exception);
    return this;
  }
}

enum AnsiColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  grey
}

// https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
extension Code on AnsiColor {

  String get code {
    if (index == AnsiColor.black.index) return '30';
    if (index == AnsiColor.red.index) return '31';
    if (index == AnsiColor.green.index) return '32';
    if (index == AnsiColor.yellow.index) return '33';
    if (index == AnsiColor.blue.index) return '34';
    if (index == AnsiColor.magenta.index) return '35';
    if (index == AnsiColor.cyan.index) return '36';
    if (index == AnsiColor.white.index) return '37';
    return '38;5;241';
  }
}

class GeLog {
  static LogLevel logLevel = LogLevel.verbose;
  static var _encrypt = false;

  static var _verboseColor = AnsiColor.grey;
  static var _debugColor = AnsiColor.grey;
  static var _infoColor = AnsiColor.green;
  static var _warnColor = AnsiColor.yellow;
  static var _errorColor = AnsiColor.red;

  static void setProperty({
    AnsiColor verbose = AnsiColor.grey,
    AnsiColor debug = AnsiColor.grey,
    AnsiColor info = AnsiColor.green,
    AnsiColor warn = AnsiColor.yellow,
    AnsiColor error = AnsiColor.red,
    bool encrypt = false
  }) {
    _verboseColor = verbose;
    _debugColor = debug;
    _infoColor = info;
    _warnColor = warn;
    _errorColor = error;
    _encrypt = encrypt;
  }

  static void v(String tag, String message) {
    if (logLevel <= LogLevel.verbose) {
      final log = '[v] [$_time][$tag] $message';

      _history.add(MapEntry(tag, log));
      print('\x1B[${_verboseColor.code}m$log\x1B[0m');
    }
  }

  static void d(String tag, String message) {
    if (logLevel <= LogLevel.debug) {
      final log = '[d] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[${_debugColor.code}m$log\x1B[0m');
    }
  }

  static void i(String tag, String message) {
    if (logLevel <= LogLevel.info) {
      final log = '[i] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[${_infoColor.code}m$log\x1B[0m');
    }
  }

  static void w(String tag, String message) {
    if (logLevel <= LogLevel.warn) {
      final log = '[w] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[${_warnColor.code}m$log\x1B[0m');
    }
  }

  static void e(String tag, String message, {Error? error, Exception? exception}) {
    if (logLevel <= LogLevel.error) {
      var log = '';
      final base = '[e] [$_time][$tag] $message';

      if (error != null) {
        log = base + '- $error';
      } else if (exception != null) {
        log = base + '- $exception';
      } else {
        log = base;
      }

      _history.add(MapEntry(tag, log));
      print('\x1B[${_errorColor.code}m$log\x1B[0m');
    }
  }

  static String get _time => DateTime.now().toIso8601String();

  static final List<MapEntry<String, String>> _history = [];

  // Load saved log data after filtering.
  static Future<List<String>> history({String? filter}) async {
    final completer = Completer<List<String>>()..complete(_filter(filter));

    return completer.future;
  }

  static List<String> _filter(String? tag) {
    var filtered = <String>[];
    if (tag != null) {
      for (MapEntry entry in _history) {
        if (entry.key == tag) filtered.add(entry.value);
      }
    } else {
      for (MapEntry entry in _history) {
        filtered.add(entry.value);
      }
    }
    return filtered;
  }

  // Clear saved log messages
  static void clear() => _history.clear();

  // To read and Write File in Flutter Web
  // https://stackoverflow.com/a/63842948
  static Future<void> save() async {
    final fs = MemoryFileSystem();

    final tmp = await fs.systemTempDirectory.createTemp('example_');
    final output = tmp.childFile('output.txt');

    final sink = output.openWrite(mode: FileMode.writeOnlyAppend);

    for (MapEntry entry in _history) {
      print('value: ${entry.value}');
      sink.writeln(entry.value);
    }

    GeLog.d('path', '${output.path}');

    await output.length().then((value) => GeLog.d('size', '$value'));

    final read = output.readAsStringSync();
    GeLog.d('read', read);
  }
}

/// Extend Dio LogInterceptor
class GeLogInterceptor extends LogInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final requestLog = StringBuffer('\n');
    requestLog.writeln('=====================================================');
    requestLog.writeln('uri : ${options.uri}');

    if (request) {
      requestLog.writeln('method : ${options.method}');
      requestLog.writeln('responseType : ${options.responseType.toString()}');
      requestLog.writeln('followRedirects : ${options.followRedirects}');
      requestLog.writeln('connectTimeout : ${options.connectTimeout}');
      requestLog.writeln('sendTimeout : ${options.sendTimeout}');
      requestLog.writeln('receiveTimeout : ${options.receiveTimeout}');
      requestLog.writeln('receiveDataWhenStatusError : ${options.receiveDataWhenStatusError}');
      requestLog.writeln('extra : ${options.extra}');
    }
    requestLog.writeln('-----------------------------------------------------');
    requestLog.writeln('headers');
    if (requestHeader) {
      for (var entry in options.headers.entries) {
        requestLog.writeln('\t${entry.key} :${entry.value}');
      }
    }
    requestLog.writeln('-----------------------------------------------------');
    requestLog.writeln('body');
    for (var message in options.data.toString().split('\n')) {
      requestLog.writeln('\t$message');
    }
    requestLog.writeln('=====================================================');
    GeLog.d('Request', requestLog.toString());

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    GeLog.d('Response', _buildResponseLog(response));

    final requestLog = StringBuffer('\n');
    requestLog.writeln('response status: ${response.statusCode}');
    requestLog.writeln('response statusMessage: ${response.statusMessage}');
    requestLog.writeln('response data: ${response.data is Uint8List ? 'Uint8List' : response.data}');
    requestLog.writeln('response isRedirect: ${response.isRedirect}');
    GeLog.d('Response', requestLog.toString());



    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      final errorLog = StringBuffer('\n');
      errorLog.writeln('=====================================================');
      errorLog.writeln('uri : ${err.requestOptions.uri}');
      errorLog.writeln('$err');
      if (err.response != null) {
        GeLog.e('DioError', _buildResponseLog(err.response!, log: errorLog));
      } else {
        errorLog.writeln('=====================================================');
        GeLog.e('DioError', errorLog.toString());
      }
    }

    handler.next(err);
  }

  String _buildResponseLog(Response response, {StringBuffer? log}) {
    log ??= StringBuffer('\n=====================================================\n');
    log.writeln('uri : ${response.requestOptions.uri}');

    if (responseHeader) {
      log.writeln('statusCode : ${response.statusCode}');
      if (response.isRedirect == true) {
        log.writeln('redirect : ${response.realUri}');
      }

      log.writeln('-----------------------------------------------------');
      log.writeln('headers');

      for (var entry in response.headers.map.entries) {
        log.writeln('\t${entry.key} :${entry.value.join('\r\n\t')}');
      }
    }
    if (responseBody) {
      log.writeln('-----------------------------------------------------');
      log.writeln('body');
      for (var message in response.toString().split('\n')) {
        log.writeln('\t$message');
      }
    }
    log.writeln('=====================================================');
    return log.toString();
  }
}

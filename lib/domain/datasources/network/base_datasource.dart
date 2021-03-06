import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../domain/datasources/network/exceptions/network_exceptions.dart';
import '../../../../domain/enum/network_request.dart';
import 'network_request_handler.dart';
import 'response/api_response.dart';

enum Message { IGNORED, SNACK_BAR, DIALOG }

class BaseDataSource extends NetworkHandler {
  Future<Either<T, Message>> request<T extends ApiResponse>(
      {required NetworkRequest type,
      required String url,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    final resp =
        processRequest(type: type, url: url, headers: headers, data: data);
    return handleResponse<T>(url, resp);
  }

  Future<Either<T, Message>> handleResponse<T extends ApiResponse>(
      String type, dynamic res) async {
    try {
      final resp = ApiResponse.fromJson(res) as T;
      return Left(resp);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      final msg = handleException(exception);
      return Right(msg);
    }
  }

  Future<Either<T, Message>> getResult<T>(Future<T> apiCall) async {
    try {
      debugPrint('===>Api  $apiCall');
      final resp = await apiCall;
      debugPrint('===>Api end resp: ');
      debugPrint('$resp');
      return Left(resp);
    } catch (e) {
      debugPrint('===>Api Exception: ${e.toString()}');
      final exception = NetworkExceptions.getDioException(e);
      final msg = handleException(exception);
      return Right(msg);
    }
  }

  Message handleException(NetworkExceptions networkExceptions) {
    final exceptionMessage = networkExceptions.toString();
    networkExceptions.when(requestCancelled: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, unauthorizedRequest: () {
      return msg(Message.DIALOG, exceptionMessage);
    }, badRequest: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, methodNotAllowed: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, notAcceptable: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, requestTimeout: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, sendTimeout: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, conflict: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, internalServerError: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, notImplemented: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, serviceUnavailable: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, noInternetConnection: () {
      return msg(Message.SNACK_BAR, exceptionMessage);
    }, formatException: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, unableToProcess: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, unexpectedError: () {
      return msg(Message.IGNORED, exceptionMessage);
    }, notFound: (String reason) {
      return msg(Message.IGNORED, exceptionMessage);
    }, defaultError: (String error) {
      return msg(Message.IGNORED, exceptionMessage);
    });
    return Message.IGNORED;
  }

  Message msg(Message msg, String message) {
    switch (msg) {
      case Message.IGNORED:
        break;
      case Message.SNACK_BAR:
        //Get.snackbar("alert", message);
        Get.snackbar('Fault Codes', 'This feature is not implemented');
        break;
      case Message.DIALOG:
        //Get.dialog(widget)
        break;
    }
    return msg;
  }
}

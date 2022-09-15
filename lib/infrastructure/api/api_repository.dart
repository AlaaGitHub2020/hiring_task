import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hiring_task/domain/api/api_failure.dart';
import 'package:hiring_task/domain/api/i_api_repository.dart';
import 'package:hiring_task/domain/api/interceptors/logging_interceptor.dart';
import 'package:hiring_task/domain/core/utilities/config.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/core/utilities/strings.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAPIRepository)
class APIRepository implements IAPIRepository {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config().get(
        kReleaseMode ? Strings.cReleaseApiBaseUrl : Strings.cDebugApiBaseUrl),
    contentType: ContentType.json.toString(),
    responseType: ResponseType.plain,
    connectTimeout: 10000,
    receiveTimeout: 30000,
  );

  late Dio _dio;
  final log = getLogger();

  APIRepository() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options}) async {
    try {
      log.i("getData Started");
      Response getDataResponse = await _dio.get(endpoint);
      return right(getDataResponse);
    } catch (e) {
      log.e(e);
      return left(const APIFailure.failedToFetchData());
    }
  }
}

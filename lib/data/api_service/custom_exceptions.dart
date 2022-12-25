import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r): super(requestOptions: r);

  @override
  String toString() {
    return 'So‘rov noto‘g‘ri';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r): super(requestOptions: r);

  @override
  String toString() {
    return 'Nomalum xatolik yuz berdi, keyinroq qayta urinib koring';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Mojaro yuz berdi';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Ruxsat yoq';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Soʻralgan maʼlumotni topib boʻlmadi';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Internet aloqasi aniqlanmadi, qayta urinib ko‘ring.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);
  
  @override
  String toString() {
    return 'Ulanish vaqti tugadi, qayta urinib ko‘ring.';
  }
}

class ReceiveTimeOutException extends DioError{
  ReceiveTimeOutException(RequestOptions r):super(requestOptions: r);

  String myError  = "ReceiveTimeOutException";

  @override
  String toString() {
    return 'qayta urinib koring.';
  }
}
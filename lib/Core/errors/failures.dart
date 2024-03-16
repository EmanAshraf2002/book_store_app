import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure{

  final String errorMessage;

  Failure(this.errorMessage);

}
class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {

      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode , dynamic response){
    
    if(statusCode==400 ||statusCode==401 ||statusCode==403  ){
      return ServerFailure(response['error']['message']);
    }
    else if(statusCode==404){
      return ServerFailure('Your Request not found,please try later');
    }
    else if(statusCode==500){
      return ServerFailure('Internal server error ,please try later');
    }
    else{
      return ServerFailure('Ops there was an ,please try later');
    }

  }
  

}
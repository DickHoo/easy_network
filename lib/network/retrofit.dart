import 'dart:io';
import 'package:dio/dio.dart';
import 'base/response_entity.dart';
import 'defaultBuilder.dart';

class Retrofit {
  static final Retrofit _retrofit = Retrofit();
  late DefaultBuilder _defaultBuilder;

  static Retrofit getInstance() {
    return _retrofit;
  }

  DefaultBuilder getBuilder() {
    _defaultBuilder = DefaultBuilder();
    return _defaultBuilder;
  }

  Dio getDio() {
    return _defaultBuilder.dio;
  }

  void setHeaders(Map<String, String> headers) {
    getDio().options.headers.addAll(headers);
  }

  Future<ResponseEntity?> get(path, {Map<String, dynamic>? data}) async {
    Response? response;
    response = await getDio().get(path, queryParameters: data);
    var responseEntity = _getResponseEntity(response);
    if (null != responseEntity) {
      return Future.value(responseEntity);
    }
    return null;
  }

  Future<ResponseEntity?> post(path, {dynamic? data}) async {
    Response? response;
    response = await getDio().post(path, data: data);
    var responseEntity = _getResponseEntity(response);
    if (null != responseEntity) {
      return Future.value(responseEntity);
    }
    return null;
  }


  Future<Response> getResponse(path, {dynamic? data}) async {
    Response? response;
    response = await getDio().get(path, data: data);
    return _response(response);
  }

  Future<Response> postResponse(path, {Map<String, dynamic>? data,ProgressCallback? callback}) async {
    return await getDio().post(path, data: data,onSendProgress:callback);
  }

  Future<Response> downloadFile(urlPath,savePath,ProgressCallback? callback) async{
    return await getDio().download(urlPath, savePath,onReceiveProgress:callback);
  }

  dynamic _response(Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response;
    }
    return null;
  }

  ResponseEntity? _getResponseEntity(Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return ResponseEntity.fromJson(response.data);
    }
    return ResponseEntity(msg: response.statusMessage, code: response.statusCode, data: null);
  }
}

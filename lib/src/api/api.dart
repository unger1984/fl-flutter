import 'package:dio/dio.dart';

import '../../config.dart';

APIResponse sendData(response) => APIResponse.fromJson(response.data);

class APIError {
  final String message;
  final int code;
  final dynamic info;

  APIError(this.message, {this.code = 500, this.info});

  APIError.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        code = json['code'],
        info = json['info'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json.addAll({'message': message});
    if (code > 0) json.addAll({'code': code});
    if (info != null) json.addAll({'info': info});
    return json;
  }
}

class APIResponse {
  final bool success;
  final APIError error;
  final dynamic data;

  APIResponse(this.success, {this.error, this.data});

  APIResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        data = json.containsKey('error')
            ? null
            : json.containsKey('data')
                ? json['data']
                : null,
        error =
            json.containsKey('error') ? APIError.fromJson(json['error']) : null;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json.addAll({'success': success});
    if (error != null) json.addAll({'error': error.toJson()});
    if (data != null) json.addAll({'data': data});

    // json.addAll({'body': json});

    return json;
  }
}

class API {
  final _dio = Dio();

  API() {
    _dio.options.baseUrl = '$urlBackend/api';
    _dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error) async {
          print('NET ERROR $error');
          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();
          if (error.response.statusCode == 401) {
            // api.delAuthHeader();
            // await LocalStorage.removeAuthState();
            // Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
          }
          return await _dio.resolve(
              APIResponse(false, error: APIError(error.message, info: error))
                  .toJson());
        },
      ),
    );
  }

  void setAuthHeader(String token) {
    _dio.options.headers['Authorization'] = token;
  }

  void delAuthHeader() {
    _dio.options.headers.remove('Authorization');
  }

  /// Список проектов
  Future<APIResponse> getProjects() => _dio.get('/project').then(sendData);
}

final api = new API();

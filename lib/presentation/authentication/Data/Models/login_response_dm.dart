import 'package:movies/presentation/authentication/Domain/Entity/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
      super.data,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'];
  }
  int? statusCode;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}
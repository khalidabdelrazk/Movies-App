import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

class GetProfileResponseDm extends GetProfileResponseEntity {
  GetProfileResponseDm({
    super.message,
    super.data,
    super.statusCode,
  });

  GetProfileResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? GetDataDm.fromJson(json['data']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class GetDataDm extends GetDataEntity {
  GetDataDm({
    super.id,
    super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  GetDataDm.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  @override
  String? createdAt;
  @override
  String? updatedAt;
  @override
  int? v;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

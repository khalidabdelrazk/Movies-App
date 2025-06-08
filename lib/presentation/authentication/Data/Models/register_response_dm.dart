import 'package:movies/presentation/authentication/Domain/Entity/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
    super.message,
    super.data,
  });

  RegisterResponseDm.fromJson(dynamic json) {
    final rawMessage = json['message'];

    // Safely assign message as string
    if (rawMessage is String) {
      message = rawMessage;
    } else if (rawMessage is List) {
      message = rawMessage.join(', ');
    } else {
      message = rawMessage?.toString();
    }

    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DataDm extends DataEntity {
  DataDm({
    super.email,
    this.password,
    super.name,
    super.phone,
    super.avaterId,
    super.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  DataDm.fromJson(dynamic json) {
    email = json['email'] as String?;
    password = json['password'] as String?;
    name = json['name'] as String?;
    phone = json['phone'] as String?;
    avaterId = json['avaterId'];
    id = json['_id'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    v = json['__v'] as int?;
  }

  String? password;
  String? createdAt;
  String? updatedAt;
  int? v;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

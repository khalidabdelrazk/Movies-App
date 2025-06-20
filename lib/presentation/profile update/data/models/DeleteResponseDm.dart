import 'package:movies/presentation/profile%20update/domain/entitys/DeleteResponseEntity.dart';

class DeleteResponseDm extends DeleteResponseEntity {
  DeleteResponseDm({
    super.message,
    super.data,
    super.error,
  });

  DeleteResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDeleteDm.fromJson(json['data']) : null;
    error = json['error'];
  }
}

class DataDeleteDm extends DataDeleteEntity {
  DataDeleteDm({
    super.id,
    super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  DataDeleteDm.fromJson(dynamic json) {
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
}

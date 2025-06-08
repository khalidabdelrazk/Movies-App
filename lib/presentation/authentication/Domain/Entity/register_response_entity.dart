class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.data,});

  RegisterResponseEntity.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataEntity.fromJson(json['data']) : null;
  }
  String? message;
  DataEntity? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class DataEntity {
  DataEntity({
      this.email, 
      this.name,
      this.phone, 
      this.avaterId, 
      this.id,});

  DataEntity.fromJson(dynamic json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
  }
  String? email;
  String? name;
  String? phone;
  int? avaterId;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    return map;
  }

}
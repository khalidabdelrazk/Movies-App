class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.data,});

  LoginResponseEntity.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  dynamic message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}
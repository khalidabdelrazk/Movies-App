import 'package:movies/presentation/profile%20update/domain/entitys/UpdateProfileResponseEnity.dart';

class UpdateResponseDm extends UpdateProfileResponseEntity {
  UpdateResponseDm({
    super.message,
    super.error,
  });

  UpdateResponseDm.fromJson(dynamic json) {
    // Handle case where JSON might return a List<dynamic>
    message = json['message'] is List ? (json['message'] as List?)?.first : json['message'] as String?;
    error = json['error'] is List ? (json['error'] as List?)?.first : json['error'] as String?;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    return map;
  }
}
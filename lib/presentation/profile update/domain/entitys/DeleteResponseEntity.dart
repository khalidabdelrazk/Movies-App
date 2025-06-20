class DeleteResponseEntity {
  DeleteResponseEntity({
      this.message, 
      this.data,
      this.error,
      });


  String? message;
  DataDeleteEntity? data;
  String? error;



}

class DataDeleteEntity {
  DataDeleteEntity({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;



}
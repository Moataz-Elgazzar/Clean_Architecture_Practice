import 'package:clean_architecture_practice/core/service/dio/dio_endpoint.dart';
import 'package:clean_architecture_practice/features/user/data/models/sub_models/address_model.dart';
import 'package:clean_architecture_practice/features/user/data/models/sub_models/company_model.dart';
import 'package:clean_architecture_practice/features/user/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({required this.id, required super.name, required this.username, required super.email, required super.phone, required this.website, required super.address, required this.company});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json[ApiKey.id], name: json[ApiKey.name], username: json[ApiKey.username], email: json[ApiKey.email], phone: json[ApiKey.phone], website: json[ApiKey.website], address: AddressModel.fromJson(json[ApiKey.address]), company: CompanyModel.fromJson(json[ApiKey.company]));
  }

  Map<String, dynamic> tojason() {
    return {ApiKey.id: id, ApiKey.name: name, ApiKey.username: username, ApiKey.email: email, ApiKey.phone: phone, ApiKey.website: website};
  }
}

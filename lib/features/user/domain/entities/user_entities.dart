import 'package:clean_architecture_practice/features/user/domain/entities/sub_entities/address_entity.dart';

class UserEntities {
  final String name;
  final String email;
  final String phone;
  final AddressEntity address;

  UserEntities({required this.name, required this.email, required this.phone, required this.address});
}

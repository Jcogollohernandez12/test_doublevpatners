import 'package:app_test/src/core/models/addrees.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<Address> addresses;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.addresses,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birthDate": birthDate.toIso8601String(),
        "addresses": addresses.map((address) => address.toJson()).toList(),
      };
}

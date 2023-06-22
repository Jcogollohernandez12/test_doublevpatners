class User {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> addresses;

  User({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.addresses,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate,
      'addresses': addresses,
    };
  }
}

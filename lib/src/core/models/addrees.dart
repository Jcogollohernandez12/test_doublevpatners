class Address {
  final String street;
  final String number;
  final String neighborhood;

  Address({
    required this.street,
    required this.number,
    required this.neighborhood,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
    };
  }
}

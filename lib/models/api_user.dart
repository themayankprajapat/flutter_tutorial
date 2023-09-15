class ApiUser {
  final int id;
  final String name;
  final String userName;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  ApiUser({
    required this.id,
    required this.name,
    required this.userName,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) {
    return ApiUser(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      catchPhrase: json['catchPhrase'],
      name: json['name'],
      bs: json['bs'],
    );
  }
}

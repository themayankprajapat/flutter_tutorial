class RandomUser {
  final ID id;
  final Name name;
  final String gender;
  final String email;
  final String phone;
  final DOB dob;
  final Images images;
  final Location location;

  RandomUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.gender,
    required this.dob,
    required this.images,
  });

  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      id: ID.fromJson(json['id']),
      name: Name.fromJson(json['name']),
      email: json['email'],
      phone: json['phone'],
      location: Location.fromJson(json['location']),
      gender: json['gender'],
      dob: DOB.fromJson(json['dob']),
      images: Images.fromJson(json['picture']),
    );
  }
}

class Location {
  final Street street;
  final String state;
  final String city;
  final String country;
  // final String postcode;

  Location({
    required this.street,
    required this.state,
    required this.city,
    // required this.postcode,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      street: Street.fromJson(json['street']),
      state: json['state'],
      city: json['city'],
      // postcode: json['postcode'],
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(number: json['number'], name: json['name']);
  }
}

class ID {
  final String? value;
  final String name;

  ID({required this.value, required this.name});

  factory ID.fromJson(Map<String, dynamic> json) {
    return ID(value: json['value'], name: json['name']);
  }
}

class DOB {
  final String date;
  final int age;

  DOB({required this.date, required this.age});

  factory DOB.fromJson(Map<String, dynamic> json) {
    return DOB(date: json['date'], age: json['age']);
  }
}

class Images {
  final String large;
  final String medium;
  final String thumbnail;

  Images({required this.large, required this.medium, required this.thumbnail});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

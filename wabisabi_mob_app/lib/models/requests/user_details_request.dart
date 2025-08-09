class UserDetailsRequest {
  String date_ofBirth;
  String? nationality;
  String placeOfBirth;
  String nif;
  String street;
  String postalCode;
  String city;
  String country;
  String occupation;
  String company;
  String estimatedIncome;
  String sourceOfFunds;
  String province;
  int pageIndex;

  UserDetailsRequest({
    required this.date_ofBirth,
    this.nationality,
    required this.placeOfBirth,
    required this.nif,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.occupation,
    required this.company,
    required this.estimatedIncome,
    required this.sourceOfFunds,
    required this.province,
    required this.pageIndex,
  });

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'date_of_birth': date_ofBirth,
      'nationality': nationality,
      'place_of_birth': placeOfBirth,
      'nif': nif,
      'street': street,
      'postal_code': postalCode,
      'city': city,
      'country': country,
      'occupation': occupation,
      'company': company,
      'estimated_income': estimatedIncome,
      'source_of_funds': sourceOfFunds,
      'province': province,
      'page_index': pageIndex,
    };
  }

  // Create an object from a JSON map
  factory UserDetailsRequest.fromJson(Map<String, dynamic> json) {
    return UserDetailsRequest(
      date_ofBirth: json['date_of_birth'],
      nationality: json['nationality'],
      placeOfBirth: json['place_of_birth'],
      nif: json['nif'],
      street: json['street'],
      postalCode: json['postal_code'],
      city: json['city'],
      country: json['country'],
      occupation: json['occupation'],
      company: json['company'],
      estimatedIncome: json['estimated_income'],
      sourceOfFunds: json['source_of_funds'],
      province: json['province'],
      pageIndex: json['page_index'],
    );
  }
}

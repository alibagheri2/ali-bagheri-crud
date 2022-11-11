class infomodel {
  late String? firstname;
  late String? lastname;
  late String?birthday;
  late String? phonenumber;
  late String email;
  late String? banckacountnumber;

  infomodel(
      {
      required this.birthday,
      required this.lastname,
      required this.banckacountnumber,
      required this.email,
      required this.firstname,
      required this.phonenumber});

  Map< String , dynamic> tojson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'birthday': birthday,
      'email': email,
      'phonenumber': phonenumber,
      'banckacountnumber': banckacountnumber
    };
  }

  infomodel.fromjson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'],
        birthday = json['birthday'],
        email = json['email'],
        phonenumber = json['phonenumber'],
        banckacountnumber = json['banckacountnumber'];
}

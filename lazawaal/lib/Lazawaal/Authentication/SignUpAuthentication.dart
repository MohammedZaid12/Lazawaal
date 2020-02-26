


import 'package:lazawaal/Lazawaal/Authentication/LoginAuthentication.dart';

class SignUpAuth{

  final String name;
  final String email;
  final String password;
  final String picture;
  final int phoneNumber;
  final int income;
  final String guardianName;
  final int guardianContact;
  final int guardianNic;
  final String DateOfBirth;

  SignUpAuth({this.name, this.email , this.password , this.picture , this.phoneNumber , this.guardianName , this.guardianContact ,this.guardianNic , this.income , this.DateOfBirth});

factory SignUpAuth.fromjson(Map<String, dynamic> json){
  return SignUpAuth(
    name: getString(json['name']),
    email: getString(json['email']),
    password: getString(json['password']),
    picture: getString(json['picture']),
    phoneNumber: getInt(json['mobile']),
    income: getInt(json['income']),
    guardianName: getString(json['guardian_name']),
    guardianContact: getInt(json['guardian_contact']),
    guardianNic: getInt(json['guardian_nic']),
    DateOfBirth: getString(json['dob']),
   );


}


}



import 'package:lazawaal/Lazawaal/Authentication/LoginAuthentication.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';

class SignUpAuth{
  final int Id;
  final String userId;
  final String name;
  final String email;
  final String password;

  final String phoneNumber;
  final String income;
  final String guardianName;
  final String guardianContact;
  final String guardianNic;
  final String DateOfBirth;

  SignUpAuth({this.name,this.Id ,this.userId ,this.email , this.password , this.phoneNumber , this.guardianName , this.guardianContact ,this.guardianNic , this.income , this.DateOfBirth});

factory SignUpAuth.fromjson(Map<String, dynamic> json){
  return SignUpAuth(
    userId: getString(json["user_id"]),
    name: getString(json['name']),
    email: getString(json['email']),
    password: getString(json['password']),

    phoneNumber: getString(json['mobile']),
    income: getString(json['income']),
    guardianName: getString(json['guardian_name']),
    guardianContact: getString(json['guardian_contact']),
    guardianNic: getString(json['guardian_nic']),
    DateOfBirth: json['dob'],
   );


}
Map tomap(){
  var map = new Map<String, dynamic>();
  map["name"] = name;
  map['userId'] = userId;

  map["email"] = email;
  map["password"] = password;
  map["mobile"] = phoneNumber;
  map["income"] = income;
  map["guardian_name"] = guardianName;
  map["guardian_contact"] = guardianContact;
  map["guardian_nic"] = guardianNic;
  map["dob"] = DateOfBirth;

  return map;
}

}
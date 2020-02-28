

import 'LoginAuthentication.dart';

class GetUserProfile{
  final int Id;
  final String userId;
  final String name;
  final String email;
  final String picture;

  final String phoneNumber;
  final String income;
  final String guardianName;
  final String guardianContact;
  final String guardianNic;
  final String DateOfBirth;
  final String points;


  GetUserProfile({this.name,this.Id ,this.userId ,this.email , this.picture , this.phoneNumber , this.guardianName , this.guardianContact ,this.guardianNic ,this.points , this.income , this.DateOfBirth});


  factory GetUserProfile.fromjson(Map<String, dynamic> json){
    return GetUserProfile(
      userId: getString(json["user_id"]),
      name: getString(json['name']),
      email: getString(json['email']),
      picture: getString(json['picture']),

      phoneNumber: getString(json['contact_no']),
      income: getString(json['income']),
      guardianName: getString(json['guardian_name']),
      guardianContact: getString(json['guardian_contact']),
      guardianNic: getString(json['guardian_nic']),
      DateOfBirth: json['dob'],
      points: json['points'],
    );


  }




}
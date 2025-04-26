// class UserModel {
//   final String uid;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phone;

//   UserModel({
//     required this.uid,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'phone': phone,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       uid: map['uid'],
//       firstName: map['firstName'],
//       lastName: map['lastName'],
//       email: map['email'],
//       phone: map['phone'],
//     );
//   }
// }

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final DateTime dateOfBirth;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}

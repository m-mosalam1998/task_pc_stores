import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emial;
  const UserData({
    required this.firstName,
    required this.emial,
    required this.lastName,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber, emial];
  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': emial
      };
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        emial: json['emial'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
      );
}

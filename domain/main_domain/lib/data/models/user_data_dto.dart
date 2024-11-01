class UserDataDTO {
  final dynamic id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UserDataDTO({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => UserDataDTO(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );
}

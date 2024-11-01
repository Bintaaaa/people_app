class UserModelDTO {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserModelDTO({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserModelDTO.fromJson(Map<String, dynamic> json) => UserModelDTO(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

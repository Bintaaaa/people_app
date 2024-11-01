class UserModelDTO {
  final dynamic id;
  final String? email;
  final String? name;
  final String? avatar;

  const UserModelDTO({
    this.id,
    this.email,
    this.name,
    this.avatar,
  });

  factory UserModelDTO.fromJson(Map<String, dynamic> json) => UserModelDTO(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
      );
}

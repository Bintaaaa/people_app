class LoginModelDto {
  final String? token;

  const LoginModelDto({
    this.token,
  });

  factory LoginModelDto.fromJson(Map<String, dynamic> json) => LoginModelDto(
        token: json["token"],
      );
}

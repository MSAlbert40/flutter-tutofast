class LoginResultDTO {
  final String token;
  final String username;
  final String roles;

  LoginResultDTO({
    this.token,
    this.username,
    this.roles,
  });

  factory LoginResultDTO.fromJson(Map<String, dynamic> json) {
    return LoginResultDTO(
      token: json['token'],
      username: json['username'],
      roles: json['roles']
    );
  }
}

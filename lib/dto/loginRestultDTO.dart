class LoginResultDTO {
  final String token;
  final String username;

  LoginResultDTO({this.token, this.username});

  factory LoginResultDTO.fromJson(Map<String, dynamic> json) {
    return LoginResultDTO(token: json['token'], username: json['username']);
  }
}

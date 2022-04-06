class SignUpModel {
  final String username;
  final String email;
  final String password;

  SignUpModel(this.username, this.email, this.password);

  static List<SignUpModel> get mockUsers {
    return [
      SignUpModel("hakan", "hknpksn@gmail.com", "H1234567"),
      SignUpModel("hasan", "hasan@gmail.com", "Ha123456"),
    ];
  }

  // static SignUpModel get mockUser {
  //   return SignUpModel("hakan", "hknpksn@gmail.com", "H1234567");
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}

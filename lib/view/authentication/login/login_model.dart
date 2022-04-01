class LoginModel {
  //final String? name;
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  static LoginModel get mockUser {
    return LoginModel("hknpksn@gmail.com", "H1234567");
  }

  static List<LoginModel> get mockUsers {
    return [
      LoginModel("hknpksn@gmail.com", "H1234567"),
      //UserModel(name: "hasan", email: "hasan@gmail.com", password: "5678hn12")
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel && other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

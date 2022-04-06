import '../../../product/mixin/auth_mixin.dart';

class LoginModel with AuthMixin {
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  static List<LoginModel> get mockUsers {
    return [
      LoginModel("hknpksn@gmail.com", "H1234567"),
      LoginModel("hasan@gmail.com", "Ha123456"),
    ];
  }

  // static LoginModel get mockUser {
  //   return LoginModel("hknpksn@gmail.com", "H1234567");
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel && other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

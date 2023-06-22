abstract class AuthCredentials {
  String email;
  String password;

  AuthCredentials({
    required this.email,
    required this.password,
  });
}

class LoginCredentials extends AuthCredentials {
  LoginCredentials({required String email, required String password})
      : super(
          email: email,
          password: password,
        );
}

class SignUpCredentials extends AuthCredentials {
  String? role;
  String? countrycode;
  String? number;
  String? network;
  String? urlNetword;

  SignUpCredentials({
    required String email,
    required String password,
    this.role,
    this.countrycode,
    this.number,
    this.network,
    this.urlNetword,
  }) : super(email: email, password: password);
}

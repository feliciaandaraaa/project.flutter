class User {
  String _username;
  String _password;

  User(this._username, this._password);

  // Getter
  String get username => _username;
  String get password => _password;

  // Setter
  set username(String value) => _username = value;
  set password(String value) => _password = value;
}

// daftar user global
List<User> users = [User("admin", "1234")];

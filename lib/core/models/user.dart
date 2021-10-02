enum Mode { dark, light }

class A11User {
  final String id;
  final String userName;
  final String password;
  final String displayName;
  final String avatarURL;
  final Mode displayMode;
  final bool isAdmin;

  A11User({
    required this.id,
    required this.userName,
    required this.password,
    required this.displayName,
    this.avatarURL = '',
    this.displayMode = Mode.light,
    this.isAdmin = false,
  });
}

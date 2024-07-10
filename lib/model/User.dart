
class User
{
  final String username;
	final String password;
	final String hint;
	final DateTime createdDate;
	final DateTime lastLogin;
	final String blabName;
	final String realName;

  const User({
    required this.username,
    required this.password,
    required this.hint,
    required this.lastLogin,
    required this.createdDate,
    required this.blabName,
    required this.realName,
  })
}
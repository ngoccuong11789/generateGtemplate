class RegexUtils {
  RegexUtils._();

  static RegExp defaultAvatarRegex = RegExp(r'default/UserAvatar\.jpg');

  static bool isDefaultAvatar(String url) => defaultAvatarRegex.hasMatch(url);
}

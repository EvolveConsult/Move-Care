class AppRoutes {
  //SPLASH
  static const splash = '/';

  //AUTH
  static const auth = '/auth';

  //RECOVERY
  static const _recoveryPassword = '/recoveryPassword';
  static const recoveryPasswordEmail = '$_recoveryPassword/recoveryPassword';
  // static const recoveryPasswordToken = '$recoveryPassword/token';
  // static const recoveryPasswordPassword = '$recoveryPassword/password';
  static const recoveryPasswordSuccess = '$_recoveryPassword/success';

  //REGISTER
  static const register = '/register';
  static const registerSuccess = '/registerSuccess';

  //HOME
  static const start = '/start';
  static const wellcome = '$start/wellcome';
  static const home = '$start/home';
  static const profile = '$start/profile';

  //TESTS
  static const tests = '/tests';
  static const answerTest = '$tests/answer';
  static const resultTest = '$answerTest/resultTest';

  //GUIDANCE_FOR_USERS
  static const guidanceForUsers = '/guidanceForUsers';
  static const guidanceForUsersDetails = '$guidanceForUsers/details';

  //GUIDANCE_FOR_USERS
  static const contactUs = '/contactUs';
}

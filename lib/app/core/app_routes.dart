class AppRoutes {
  //SPLASH
  static const splash = '/';

  //AUTH
  static const auth = '/auth';

  //RECOVERY
  static const recoveryPassword = '/recoveryPassword';
  static const recoveryPasswordEmail = '$recoveryPassword/recoveryPassword';
  static const recoveryPasswordToken = '$recoveryPassword/token';
  static const recoveryPasswordPassword = '$recoveryPassword/password';
  static const recoveryPasswordSuccess = '$recoveryPassword/success';

  //REGISTER
  static const register = '/register';

  //HOME
  static const home = '/home';
  static const wellcome = '/wellcome';

  //TESTS
  static const tests = '/tests';
  static const answerTest = '$tests/answer';
  static const resultTest = '$answerTest/resultTest';

  //GUIDANCE_FOR_USERS
  static const guidanceForUsers = '/guidanceForUsers';
}

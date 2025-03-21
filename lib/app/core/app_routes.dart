class AppRoutes {
  //SPLASH
  static const splash = '/';

  //AUTH
  static const auth = '/auth';

  //RECOVERY
  static const _recoveryPassword = '/recoveryPassword';
  static const recoveryPasswordEmail = '$_recoveryPassword/recoveryPassword';
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
  static const testChildTdah = '$tests/testChildTdah';
  static const testChildTea = '$tests/testChildTea';
  static const testChildTdc = '$tests/testChildTdc';
  static const testAdultTea = '$tests/testAdultTea';
  static const testAdultTdc = '$tests/testAdultTdc';
  static const testAdultTdah = '$tests/testAdultTdah';
  static const resultTest = '$answerTest/resultTest';

  //GUIDANCE_FOR_USERS
  static const guidanceForUsers = '/guidanceForUsers';
  static const guidanceForUsersDetails = '$guidanceForUsers/details';

  //GUIDANCE_FOR_USERS
  static const contactUs = '/contactUs';
}

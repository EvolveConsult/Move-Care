import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../core/app_routes.dart';
import 'presentation/pages/result_test_page.dart';
import 'presentation/pages/tests/test_adult_tdah_page.dart';
import 'presentation/pages/tests/test_adult_tdc_page.dart';
import 'presentation/pages/tests/test_adult_tea_page.dart';
import 'presentation/pages/tests/test_child_tdah_page.dart';
import 'presentation/pages/tests/test_child_tdc_page.dart';
import 'presentation/pages/tests/test_child_tea_page.dart';
import 'presentation/pages/tests_page.dart';

class TestsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.tests, child: (context) => const TestsPage());
    // r.child(AppRoutes.answerTest, child: (context) => AnswerTestPage(test: r.args.data));
    r.child(AppRoutes.testChildTdah, child: (context) => const TestChildTeahPage());
    r.child(AppRoutes.testChildTea, child: (context) => const TestChildTeaPage());
    r.child(AppRoutes.testChildTdc, child: (context) => const TestChildTdcPage());
    r.child(AppRoutes.testAdultTea, child: (context) => const TestAdultTeaPage());
    r.child(AppRoutes.testAdultTdah, child: (context) => const TestAdultTdahPage());
    r.child(AppRoutes.testAdultTdc, child: (context) => const TestAdultTdcPage());
    r.child(AppRoutes.resultTest, child: (context) => ResultTestPage(vo: r.args.data));
  }
}

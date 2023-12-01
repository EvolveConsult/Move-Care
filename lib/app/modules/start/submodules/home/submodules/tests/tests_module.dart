import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../core/app_routes.dart';
import 'presentation/pages/answer_test_page.dart';
import 'presentation/pages/result_test_page.dart';
import 'presentation/pages/tests_page.dart';

class TestsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.tests, child: (context) => const TestsPage());
    r.child(AppRoutes.answerTest, child: (context) => AnswerTestPage(test: r.args.data));
    r.child(AppRoutes.resultTest, child: (context) => ResultTestPage(vo: r.args.data));
  }
}

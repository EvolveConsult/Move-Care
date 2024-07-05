import '../presentation/pages/tests_page.dart';

class TestsEntity {
  final String title;
  final String pathImage;
  final List<ButtonTest> tests;

  TestsEntity({
    required this.title,
    required this.tests,
    required this.pathImage,
  });
}

class QuestionEntity {
  final String title;
  final List<QuestionOptionsEntity> options;

  QuestionEntity({required this.title, required this.options});
}

class QuestionOptionsEntity {
  final String label;
  final int point;

  QuestionOptionsEntity({required this.label, required this.point});

  @override
  String toString() => label;
}

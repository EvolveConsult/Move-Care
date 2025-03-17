class TypeTestEntity {
  final String title;
  final String pathImage;
  final List<Test> tests;

  TypeTestEntity({
    required this.title,
    required this.tests,
    required this.pathImage,
  });
}

class Test {
  final String label;
  final String route;

  Test({required this.label, required this.route});
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

class TestsEntity {
  final String title;
  final String pathImage;
  final List<QuestionEntity> questions;

  TestsEntity({required this.title, required this.pathImage, required this.questions});
}

class QuestionEntity {
  final String title;
  final List<QuestionOptionsEntity> options;

  QuestionEntity({required this.title, required this.options});
}

class QuestionOptionsEntity {
  final String label;

  QuestionOptionsEntity({required this.label});

  @override
  String toString() => label;
}

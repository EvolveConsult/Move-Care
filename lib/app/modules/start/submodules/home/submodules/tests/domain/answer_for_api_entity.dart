import 'test_entity.dart';

class AnswerForApiEntity {
  String email = '';
  final int score;
  final String test;
  final List<Answer> answers;
  final String recomendation;

  AnswerForApiEntity({
    required this.recomendation,
    required this.test,
    required this.score,
    required this.answers,
  });

  factory AnswerForApiEntity.fromTest({
    required String recomendation,
    required String test,
    required int score,
    required Map<int, String> answersMap,
    required List<QuestionEntity> questions,
  }) {
    final answers = answersMap.entries.map((e) => Answer(title: questions[e.key].title, answer: e.value)).toList();

    return AnswerForApiEntity(
      recomendation: recomendation,
      test: test,
      score: score,
      answers: answers,
    );
  }

  Map<String, dynamic> toFirebase() {
    final respostas = {};

    for (var answer in answers) {
      respostas.addAll({answer.title: answer.answer});
    }
    return {
      'email': email,
      'pontos': score,
      'teste': test,
      'respostas': respostas,
      'recomendação': recomendation,
      'data': DateTime.now(),
    };
  }
}

class Answer {
  final String title;
  final String answer;
  Answer({required this.title, required this.answer});
}

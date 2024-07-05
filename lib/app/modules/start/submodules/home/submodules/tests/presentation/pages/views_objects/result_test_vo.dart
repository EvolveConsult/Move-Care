import 'package:flutter/widgets.dart';

import '../../../domain/answer_for_api_entity.dart';

class ResultTestVo {
  final String title;
  final int score;
  final String recomendation;
  final Widget? alert;
  final AnswerForApiEntity answerForApiEntity;

  ResultTestVo({
    required this.title,
    required this.score,
    required this.recomendation,
    this.alert,
    required this.answerForApiEntity,
  });
}

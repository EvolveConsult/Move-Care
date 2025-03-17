// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/theme/color_schemes.dart';
import 'package:moveecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:moveecare/app/core/ui/widgets/app_radio_button.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../../../../../core/app_routes.dart';
import '../../../domain/answer_for_api_entity.dart';
import '../../../domain/test_entity.dart';
import '../views_objects/result_test_vo.dart';

class TestAdultTdahPage extends StatefulWidget {
  const TestAdultTdahPage({super.key});

  @override
  State<TestAdultTdahPage> createState() => _TestAdultTdahPageState();
}

class _TestAdultTdahPageState extends State<TestAdultTdahPage> {
  String test = 'Rastreamento em adultos - TDAH';
  ValueNotifier<Map<int, String>> answersPart1 = ValueNotifier({});
  ValueNotifier<Map<int, String>> answersPart2 = ValueNotifier({});

  List<QuestionEntity> questionsPart1 = [];
  List<QuestionEntity> questionsPart2 = [];
  Map<int, int> answersQuestionsPart1 = {};
  Map<int, int> answersQuestionsPart2 = {};

  @override
  void initState() {
    setTests();
    super.initState();
  }

  void setTests() {
    questionsPart1 = [
      QuestionEntity(
          title:
              '1. Com que frequência você comete erros por falta de atenção quando tem de trabalhar num projeto chato ou difícil?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '2. Com que frequência você tem dificuldade para manter a atenção quando está fazendo um trabalho chato ou repetitivo?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '3. Com que frequência você tem dificuldade para se concentrar no que as pessoas dizem, mesmo quando elas estão falando diretamente com você?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '4. Com que frequência você deixa um projeto pela metade depois de já ter feito as partes mais difíceis?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title: '5. Com que frequência você tem dificuldade para fazer um trabalho que exige organização?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '6. Quando você precisa fazer algo que exige muita concentração, com que frequência você evita ou adia o início?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '7. Com que frequência você coloca as coisas fora do lugar ou tem dificuldade de encontrar as coisas em casa ou no trabalho?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(title: '8. Com que frequência você se distrai com atividades ou barulho a sua volta?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Raramente', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
        QuestionOptionsEntity(label: 'Frequentemente', point: 1),
        QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
      ]),
      QuestionEntity(
          title: '9. Com que frequência você tem dificuldade para lembrar de compromissos ou obrigações?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
    ];

    questionsPart2 = [
      QuestionEntity(
          title:
              '1. Com que frequência você fica se mexendo na cadeira ou balançando as mãos ou os pés quando precisa ficar sentado(a) por muito tempo?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '2. Com que frequência você se levanta da cadeira em reuniões ou em outras situações onde deveria ficar sentado(a)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(title: '3. Com que frequência você se sente inquieto(a) ou agitado(a)?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Raramente', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
        QuestionOptionsEntity(label: 'Frequentemente', point: 1),
        QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
      ]),
      QuestionEntity(
          title: '4. Com que frequência você tem dificuldade para sossegar e relaxar quando tem tempo livre para você?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title:
              '5. Com que frequência você se sente ativo(a) demais e necessitando fazer coisas, como se estivesse “com um motor ligado”?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(title: '6. Com que frequência você se pega falando demais em situações sociais?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Raramente', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
        QuestionOptionsEntity(label: 'Frequentemente', point: 1),
        QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
      ]),
      QuestionEntity(
          title:
              '7. Quando você está conversando, com que frequência você se pega terminando as frases das pessoas antes delas?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(
          title: '8. Com que frequência você tem dificuldade para esperar nas situações onde cada um tem a sua vez?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Raramente', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
            QuestionOptionsEntity(label: 'Frequentemente', point: 1),
            QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
          ]),
      QuestionEntity(title: '9. Com que frequência você interrompe os outros quando eles estão ocupados?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Raramente', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 0),
        QuestionOptionsEntity(label: 'Frequentemente', point: 1),
        QuestionOptionsEntity(label: 'Muito frequentemente', point: 1),
      ]),
    ];
    setState(() {});
  }

  void showResult() {
    final totalPointsPart1 = _calcTotalPoints(answersQuestionsPart1);
    final totalPointsPart2 = _calcTotalPoints(answersQuestionsPart2);
    final totalPoints = totalPointsPart1 + totalPointsPart2;
    final recomendation = _recomendation(totalPoints);
    final answerForApi = AnswerForApiEntity.fromTest(
      recomendation: recomendation,
      test: test,
      score: totalPoints,
      answersMap: {...answersPart1.value, ...answersPart2.value},
      questions: [...questionsPart1, ...questionsPart2],
    );
    ResultTestVo vo = ResultTestVo(
        answerForApiEntity: answerForApi,
        title: 'Recomendação para o resultado atingido:',
        score: totalPoints,
        recomendation: recomendation,
        alert: AppRichText(
          children: [
            const TextSpan(
              text:
                  'Caso deseje participar de uma pesquisa mais aprofundada, você pode entrar em contato com a equipe Move&Care através da opção',
            ),
            TextSpan(
                style: TextStyle(color: Theme.of(context).primaryColor),
                text: ' Fale Conosco',
                recognizer: TapGestureRecognizer()..onTap = () => Modular.to.pushNamed(AppRoutes.contactUs)),
            const TextSpan(text: '.')
          ],
        ));
    Modular.to.pushNamed(AppRoutes.resultTest, arguments: vo);
  }

  int _calcTotalPoints(Map<int, int> answers) {
    int total = 0;
    answers.forEach((key, value) => total += value);
    return total;
  }

  String _recomendation(int totalPoints) {
    if (totalPoints >= 4) {
      return 'O resultado do teste pode indicar um quadro de TDAH. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.';
    } else {
      return 'O resultado do teste não indica quadro de TDAH. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: test,
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppText(
                'Esta é uma escala de autoavaliação de TDAH dos adultos. Complete as partes A e B do conjunto de sintomas marcando a opção que melhor representa a frequência da ocorrência do sintoma em questão.',
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(color: lightColorScheme.secondary, border: Border.all()),
                child: const AppText('Parte A'),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (_, questionsIndex) {
                  final question = questionsPart1[questionsIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        question.title,
                        size: AppTextSize.great,
                        textStyle: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      AppRadioButton<QuestionOptionsEntity>(
                          items: question.options,
                          onChange: (selected) {
                            if (selected != null) {
                              answersPart1.value[questionsIndex] = selected.label;

                              answersQuestionsPart1[questionsIndex] = selected.point;
                              answersPart1.notifyListeners();
                            }
                          })
                    ],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemCount: questionsPart1.length,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(color: lightColorScheme.secondary, border: Border.all()),
                child: const AppText('Parte B'),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (_, questionsIndex) {
                  final question = questionsPart2[questionsIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        question.title,
                        size: AppTextSize.great,
                        textStyle: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      AppRadioButton<QuestionOptionsEntity>(
                          items: question.options,
                          onChange: (selected) {
                            if (selected != null) {
                              answersPart2.value[questionsIndex] = selected.label;

                              answersQuestionsPart2[questionsIndex] = selected.point;
                              answersPart2.notifyListeners();
                            }
                          })
                    ],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemCount: questionsPart2.length,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: AnimatedBuilder(
          animation: Listenable.merge([answersPart1, answersPart2]),
          builder: (context, child) {
            return AppButton(
                text: 'Finalizar teste',
                onTap: (answersPart1.value.entries.length + answersPart2.value.entries.length) ==
                        (questionsPart1.length + questionsPart2.length)
                    ? () {
                        showResult();
                      }
                    : null);
          },
        ),
      )),
    );
  }
}

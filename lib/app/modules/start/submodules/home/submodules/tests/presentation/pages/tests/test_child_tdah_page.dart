// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:moveecare/app/core/ui/widgets/app_radio_button.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../../../../../core/app_routes.dart';
import '../../../domain/answer_for_api_entity.dart';
import '../../../domain/test_entity.dart';
import '../views_objects/result_test_vo.dart';

class TestChildTeahPage extends StatefulWidget {
  const TestChildTeahPage({super.key});

  @override
  State<TestChildTeahPage> createState() => _TestChildTeahPageState();
}

class _TestChildTeahPageState extends State<TestChildTeahPage> {
  String test = 'Rastreamento em crianças - TDAH';
  ValueNotifier<Map<int, String>> answers = ValueNotifier({});

  List<QuestionEntity> questions = [];
  Map<int, int> answersQuestions = {};

  @override
  void initState() {
    setTests();
    super.initState();
  }

  void setTests() {
    questions = [
      QuestionEntity(
        title:
            '1. Não consegue prestar muita atenção a detalhes ou comete erros por descuido nos trabalhos da escola ou tarefas',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '2. Tem dificuldade de manter a atenção em tarefas ou atividades de lazer',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '3. Parece não estar ouvindo quando se fala diretamente com ele/ela',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '4. Não segue instruções até o fim e não termina deveres de escola, tarefas ou obrigações',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '5. Tem dificuldade para organizar tarefas e atividades',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '6. Evita, não gosta ou se envolve contra a vontade em tarefas que exigem esforço mental prolongado',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '7. Perde coisas necessárias para atividades (brinquedos, deveres da escola, lápis ou livros)',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '8. Distrai-se com estímulos externos',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '9. É esquecido em atividades do dia a dia',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '10. Mexe com as mãos ou os pés ou se remexe na cadeira',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '11. Sai do lugar na sala de aula ou em outras situações em que se espera que fique sentado',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '12. Corre de um lado para o outro ou sobe demais nas coisas em situações em que isto é inapropriad1',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '13. Tem dificuldade em brincar ou envolver-se em atividades de lazer de forma calma',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '14. Não para ou frequentemente está a “mil por hora”',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '15. Fala em excesso',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '16. Responde perguntas de forma precipitada antes que elas tenham sido terminadas',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '17. Tem dificuldade em esperar sua vez',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
      QuestionEntity(
        title: '18. Interrompe os outros ou se intromete (nas conversas, jogos, etc.)',
        options: [
          QuestionOptionsEntity(label: 'Nem um pouco', point: 0),
          QuestionOptionsEntity(label: 'Só um pouco', point: 0),
          QuestionOptionsEntity(label: 'Bastante', point: 1),
          QuestionOptionsEntity(label: 'Demais', point: 1),
        ],
      ),
    ];
    setState(() {});
  }

  void showResult() {
    final totalPoints = _calcTotalPoints();
    final recomendation = _recomendation(totalPoints);
    final answerForApi = AnswerForApiEntity.fromTest(
      recomendation: recomendation,
      test: test,
      score: totalPoints,
      answersMap: answers.value,
      questions: questions,
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
                  'IMPORTANTE: Não se pode fazer o diagnóstico de TDAH apenas com base nos sintomas, existem outros critérios a serem avaliados. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.\nCaso deseje participar de uma pesquisa mais aprofundada, você pode entrar em contato com a equipe Move&Care através da opção',
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

  int _calcTotalPoints() {
    int total = 0;
    answersQuestions.forEach((key, value) => total += value);
    return total;
  }

  String _recomendation(int totalPoints) {
    int totalGroup1 = 0;
    int totalGroup2 = 0;

    for (var i = 0; i < 9; i++) {
      if (answersQuestions[i] == 1) totalGroup1++;
    }

    for (var i = 9; i < 18; i++) {
      if (answersQuestions[i] == 1) totalGroup2++;
    }

    if (totalGroup1 >= 6) {
      return 'A criança/adolescente possui mais sintomas de desatenção do que o esperado.';
    } else if (totalGroup2 >= 6) {
      return 'A criança/adolescente possui mais sintomas de hiperatividade/impulsividade do que o esperado.';
    } else if (totalPoints >= 6) {
      return 'A criança/adolescente possui mais sintomas de desatenção e hiperatividade/impulsividade do que o esperado.';
    } else {
      return 'Não foram identificados sinais de desatenção ou hiperatividade/impulsividade.';
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
                'Esta é uma escala de indicativos de TDAH em crianças e adolescentes. Trata-se apenas de um instrumento de rastreio para ajudar no possível encaminhamento da criança/adolescente ao profissional especializado. Marque a opção que melhor descreve o comportamento da criança ou adolescente.',
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemBuilder: (_, questionsIndex) {
                    final question = questions[questionsIndex];
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
                                answers.value[questionsIndex] = selected.label;

                                answersQuestions[questionsIndex] = selected.point;
                                answers.notifyListeners();
                              }
                            })
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                  itemCount: questions.length),
            ],
          ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ValueListenableBuilder(
            valueListenable: answers,
            builder: (_, value, __) {
              return AppButton(
                  text: 'Finalizar teste',
                  onTap: value.entries.length == questions.length
                      ? () {
                          // answers.value.forEach((key, value) {
                          // print('$key: $value');
                          // });
                          showResult();
                        }
                      : null);
            }),
      )),
    );
  }
}

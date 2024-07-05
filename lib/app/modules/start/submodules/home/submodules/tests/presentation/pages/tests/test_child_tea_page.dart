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

class TestChildTeaPage extends StatefulWidget {
  const TestChildTeaPage({super.key});

  @override
  State<TestChildTeaPage> createState() => _TestChildTeaPageState();
}

class _TestChildTeaPageState extends State<TestChildTeaPage> {
  String test = 'Rastreamento em crianças - TEA';
  ValueNotifier<Map<int, String>> answers = ValueNotifier({});

  List<int> indexCritics = [1, 6, 8, 12, 13, 14];
  List<QuestionEntity> questions = [];
  Map<int, int> answersQuestions = {};

  @override
  void initState() {
    setTests();
    super.initState();
  }

  void setTests() {
    questions = [
      QuestionEntity(title: '1. A criança gosta de se balançar (ex. brincar de “cavalinho”, etc.)?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '2. Interessa-se por outras crianças?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '3. Gosta de subir em coisas, como escadas ou móveis?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '4. Gosta de brincar de esconder e mostrar o rosto ou de esconde-esconde?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(
          title:
              '5. Já brincou de faz-de-conta, como, por exemplo, falando no telefone ou cuidando da boneca, ou qualquer outra brincadeira de faz-de-conta?',
          options: [
            QuestionOptionsEntity(label: 'Sim', point: 0),
            QuestionOptionsEntity(label: 'Não', point: 1),
          ]),
      QuestionEntity(title: '6. Aponta com o indicador para pedir alguma coisa?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '7. Aponta com o indicador para mostrar interesse em alguma coisa?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(
          title:
              '8. Consegue brincar de forma correta com brinquedos pequenos (ex. carros ou blocos), sem colocar na boca, balançar os brinquedos ou deixá-los cair?',
          options: [
            QuestionOptionsEntity(label: 'Sim', point: 0),
            QuestionOptionsEntity(label: 'Não', point: 1),
          ]),
      QuestionEntity(title: '9. Alguma vez trouxe objetos para você para lhe mostrar?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '10. Olha para você no olho por mais de um segundo ou dois?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '11. Já pareceu muito sensível ao barulho (ex. tapando os ouvidos)?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 1),
        QuestionOptionsEntity(label: 'Não', point: 0),
      ]),
      QuestionEntity(title: '12. Sorri em resposta ao seu rosto ou ao seu sorriso?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '13. Imita você (ex. você faz expressões/caretas e seu filho imita)?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '14. Responde quando você chama pelo nome?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(
          title: '15. Se você aponta um brinquedo do outro lado do cômodo, a criança olha para ele?',
          options: [
            QuestionOptionsEntity(label: 'Sim', point: 0),
            QuestionOptionsEntity(label: 'Não', point: 1),
          ]),
      QuestionEntity(title: '16. Já sabe andar?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '17. Olha para coisas que você está olhando?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '18. A criança faz movimentos estranhos com os dedos perto do rosto dela?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 1),
        QuestionOptionsEntity(label: 'Não', point: 0),
      ]),
      QuestionEntity(title: '19. A criança tenta atrair a sua atenção para a atividade dela?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(title: '20. Você alguma vez já se perguntou se a criança é surda?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 1),
        QuestionOptionsEntity(label: 'Não', point: 0),
      ]),
      QuestionEntity(title: '21. A criança entende o que as pessoas dizem?', options: [
        QuestionOptionsEntity(label: 'Sim', point: 0),
        QuestionOptionsEntity(label: 'Não', point: 1),
      ]),
      QuestionEntity(
          title: '22. Às vezes a criança fica aérea, “olhando para o nada” ou caminhando sem direção definida?',
          options: [
            QuestionOptionsEntity(label: 'Sim', point: 1),
            QuestionOptionsEntity(label: 'Não', point: 0),
          ]),
      QuestionEntity(
          title: '23. A criança olha para o seu rosto para conferir a sua reação quando vê algo estranho?',
          options: [
            QuestionOptionsEntity(label: 'Sim', point: 0),
            QuestionOptionsEntity(label: 'Não', point: 1),
          ]),
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
                  'É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico. Caso deseje participar de uma pesquisa mais aprofundada, você pode entrar em contato com a equipe Move&Care através da opção',
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
    int totalCritical = 0;

    for (var index in indexCritics) {
      if (answersQuestions[index] == 1) totalCritical++;
    }

    if (totalCritical >= 2) {
      return 'É importante coletar minuciosamente o histórico da criança para entender o quadro.';
    } else if (totalPoints >= 0 && totalPoints <= 2) {
      return 'Não foram identificados sinais de que a criança possa desenvolver o Transtorno do Espectro Autista. Se a criança tiver menos de 2 anos (24 meses), é preciso repetir o teste.';
    } else if (totalPoints >= 3 && totalPoints <= 7) {
      return 'É importante coletar minuciosamente o histórico da criança para entender o quadro.';
    } else {
      return 'O resultado do seu teste merece atenção, pois foram identificados sinais que podem indicar autismo.';
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
                'Esta é uma escala de triagem precoce para crianças de 16 a 30 meses. Por favor, preencha este questionário sobre o comportamento usual da criança. Responda a todas as questões. Se o comportamento descrito for raro (ex. foi observado uma ou duas vezes), responda com “Não”.',
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
                          answers.value.forEach((key, value) {
                            // print('${questions[key].title}: $value');
                          });
                          showResult();
                        }
                      : null);
            }),
      )),
    );
  }
}

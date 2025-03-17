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

class TestAdultTdcPage extends StatefulWidget {
  const TestAdultTdcPage({super.key});

  @override
  State<TestAdultTdcPage> createState() => _TestAdultTdcPageState();
}

class _TestAdultTdcPageState extends State<TestAdultTdcPage> {
  String test = 'Rastreamento em adultos - TDC';
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
          title: '1. Tinha dificuldade com tarefas de autocuidado, como amarrar os cadarços, fechar botões e zíper?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '2. Tinha dificuldade para comer sem se sujar?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '3. Teve dificuldade para aprender a andar de bicicleta comparado(a) a seus colegas?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(
          title:
              '4. Tinha dificuldade em participar de jogos em equipe, como futebol, vôlei, pegar ou arremessar bola com precisão?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(
          title: '5. Tinha dificuldade em escrever de forma legível (para que outras pessoas pudessem ler)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '6. Tinha dificuldade em escrever rápido como seus colegas?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '7. Esbarrava em objetos ou pessoas, tropeçava mais em algumas coisas do que outras?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(
          title: '8. Tinha dificuldade para tocar instrumentos musicais (violão, teclado, violino, etc)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '9. Tinha dificuldade com a organização ou de localizar coisas em seu quarto?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '10. Outras pessoas comentavam sobre sua falta de coordenação ou o(a) chamavam de desajeitado(a)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
    ];

    questionsPart2 = [
      QuestionEntity(title: '1. Atividades de autocuidado, como se barbear ou se maquiar?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '2. Comer com faca e garfo/colher?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '3. Hobbies que necessitam boa coordenação?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '4. Escrever de forma legível e organizada quando tem que escrever rápido?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '5. Escrever de forma rápida comparada a seus colegas?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '6. Ler sua própria escrita?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '7. Copiar coisas sem cometer erros?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '8. Organizar/Localizar coisas em seu quarto?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '9. Localizar-se em prédios ou lugares novos?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '10. Outras pessoas o chamam de desorganizado(a)?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '11. Você tem dificuldade em ficar parado(a) ou aparenta estar inquieto(a)?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '12. Você perde ou esquece seus pertences?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '13. Você diria que esbarra em coisas, derrama ou quebra coisas?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '14. Você é mais lento(a) do que os outros para acordar de manhã e ir ao trabalho ou faculdade?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '15. Você demorou mais do que os outros para aprender a dirigir?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '16. Os outros acham difícil ler a sua escrita?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '17. Você evita hobbies que exigem boa coordenação?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '18. Você prefere passar seu tempo de lazer mais sozinho do que com outras pessoas?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '19. Você evita jogos/esportes em equipe?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title:
              '20. Se você pratica algum esporte, é mais provável que seja sozinho, por exemplo, indo para a academia, do que com outras pessoas?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(
          title: '21. Durante a adolescência ou por volta dos 20 anos evitava ir a festas/baladas/locais para dançar?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '22. Se você dirige, você tem dificuldade para estacionar um carro?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '23. Você tem dificuldade em preparar uma refeição do zero?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '24. Você tem dificuldade em fazer uma mala para viajar?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title: '25. Você tem dificuldade em dobrar as roupas para guardá-las de maneira organizada?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '26. Você tem dificuldade em administrar dinheiro?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(
          title:
              '27. Você tem dificuldade em realizar duas coisas ao mesmo tempo (por exemplo, dirigir e ouvir ou receber uma mensagem telefônica)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(
          title:
              '28. Você tem dificuldade com a noção de distância (por exemplo, em relação a estacionar, passar por objetos)?',
          options: [
            QuestionOptionsEntity(label: 'Nunca', point: 0),
            QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
            QuestionOptionsEntity(label: 'Frequentemente', point: 2),
            QuestionOptionsEntity(label: 'Sempre', point: 3),
          ]),
      QuestionEntity(title: '29. Você tem dificuldade em planejar com antecedência?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
      ]),
      QuestionEntity(title: '30. Você sente que está perdendo a atenção em determinadas situações?', options: [
        QuestionOptionsEntity(label: 'Nunca', point: 0),
        QuestionOptionsEntity(label: 'Algumas vezes', point: 1),
        QuestionOptionsEntity(label: 'Frequentemente', point: 2),
        QuestionOptionsEntity(label: 'Sempre', point: 3),
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
    if (totalPoints >= 65) {
      return 'O resultado do teste pode indicar um quadro provável de TDC. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.';
    } else if (totalPoints >= 56) {
      return 'O resultado do teste pode indicar possível risco para TDC. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.';
    } else {
      return 'O resultado do teste não indica sinais de TDC. É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.';
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(color: lightColorScheme.secondary, border: Border.all()),
                child: const AppText('Parte 1'),
              ),
              const AppText(
                'Nesta primeira parte do questionário, você precisa relembrar a sua infância e responder às seguintes questões referentes às dificuldades que apresentava quando era criança, marcando uma opção de resposta para cada pergunta.',
                textStyle: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
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
                child: const AppText('Parte 2'),
              ),
              const AppText(
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                'Nesta segunda parte do questionário, você irá responder questões referentes às dificuldades que apresenta atualmente, marcando uma opção de resposta para cada pergunta. Atualmente, você tem dificuldades com os seguintes itens?',
              ),
              const SizedBox(height: 24),
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

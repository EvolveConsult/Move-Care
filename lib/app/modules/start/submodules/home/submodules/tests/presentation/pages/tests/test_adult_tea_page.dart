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

class TestAdultTeaPage extends StatefulWidget {
  const TestAdultTeaPage({super.key});

  @override
  State<TestAdultTeaPage> createState() => _TestAdultTeaPageState();
}

class _TestAdultTeaPageState extends State<TestAdultTeaPage> {
  String test = 'Rastreamento em adultos - TEA';
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
      QuestionEntity(title: '1. Prefiro fazer coisas com outras pessoas do que sozinho(a).', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '2. Prefiro fazer as coisas sempre da mesma maneira.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title: '3. Quando tento imaginar uma coisa, tenho muita facilidade em criar uma imagem na minha mente.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(
          title: '4. Com frequência fico tão absorvido(a) com uma coisa que esqueço todo o resto.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(title: '5. Frequentemente noto pequenos ruídos que outras pessoas não ouvem.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title:
              '6. Costumo prestar atenção aos números das placas dos carros ou outras sequências de informação do mesmo tipo.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(
          title: '7. As outras pessoas dizem-me com frequência que disse algo rude, apesar de eu achar que não.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(
          title: '8. Quando leio uma história, consigo imaginar facilmente a aparência dos personagens.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(title: '9. Tenho um fascínio por datas.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title: '10. Quando estou em grupo, tenho facilidade em seguir várias conversas ao mesmo tempo.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(title: '11. Tenho facilidade em compreender situações sociais.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '12. Tenho tendência a notar detalhes que os outros não reparam.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '13. Prefiro ir a uma biblioteca do que a uma festa.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '14. Tenho facilidade em inventar histórias.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '15. Tenho maior tendência a aproximar-me de pessoas do que objetos.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(
          title: '16. Tenho tendência a ter interesses fortes e fico incomodado(a) se não posso me dedicar a eles.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(title: '17. Gosto de conversa fiada.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '18. Quando falo, as outras pessoas têm dificuldade em tomar a palavra.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '19. Os números me fascinam.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title: '20. Quando leio uma história, sinto dificuldade em entender as intenções dos personagens.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(title: '21. Não aprecio ler livros de ficção.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '22. Tenho dificuldade em fazer novos amigos.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '23. Vejo constantemente padrões nas coisas que me rodeiam.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '24. Prefiro ir ao teatro do que ir a um museu.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '25. Não fico incomodado(a) se a minha rotina diária for alterada.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '26. Com frequência sinto que não sei manter uma conversa.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '27. Tenho facilidade em “ler nas entrelinhas” quando falam comigo.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '28. Geralmente concentro-me mais no todo do que nos detalhes.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '29. Não tenho facilidade de lembrar números de telefone.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(
          title: '30. Geralmente não reparo nas pequenas mudanças de uma situação ou na aparência de uma pessoa.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(title: '31. Consigo dizer quando a pessoa com quem estou a conversar fica entediada.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '32. Consigo facilmente fazer mais do que uma coisa ao mesmo tempo.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(
          title: '33. Quando falo ao telefone, não tenho a certeza quando é a minha vez de falar.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(title: '34. Gosto de fazer as coisas de forma espontânea.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '35. Com frequência, sou o(a) último(a) que entende uma piada.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title:
              '36. Tenho facilidade em entender o que uma pessoa está pensando ou sentindo apenas olhando para o seu rosto.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(title: '37. Se sou interrompido(a), consigo rapidamente voltar ao que estava fazendo.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '38. Sou bom/boa em fazer conversa fiada.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '39. Os outros frequentemente dizem que eu falo muito das mesmas coisas.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(
          title: '40. Quando era criança, gostava de brincar de faz-de-conta com as outras crianças.',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
          ]),
      QuestionEntity(
          title:
              '41. Gosto de colecionar informações sobre categorias de coisas (p. ex., tipos de carros, de aves, de trens, de plantas, etc.).',
          options: [
            QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
            QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
            QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
            QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
          ]),
      QuestionEntity(title: '42. Tenho dificuldade de imaginar-me na pele de outra pessoa.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '43. Gosto de planejar com cuidado todas as atividades em que participo.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '44. Aprecio eventos sociais.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '45. Tenho dificuldade em entender as intenções das outras pessoas.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '46. Situações novas me deixam ansioso(a).', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 1),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 0),
      ]),
      QuestionEntity(title: '47. Gosto de conhecer pessoas novas.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '48. Sou bom/boa diplomata.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '49. Tenho dificuldade em lembrar do dia de aniversário das outras pessoas.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
      ]),
      QuestionEntity(title: '50. Tenho muita facilidade em brincar de faz de conta com crianças.', options: [
        QuestionOptionsEntity(label: 'Concordo totalmente', point: 0),
        QuestionOptionsEntity(label: 'Concordo parcialmente', point: 0),
        QuestionOptionsEntity(label: 'Discordo parcialmente', point: 1),
        QuestionOptionsEntity(label: 'Discordo totalmente', point: 1),
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
                  'IMPORTANTE: Não se pode fazer o diagnóstico apenas com base neste resultado, existem outros critérios a serem avaliados.É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.\nCaso deseje participar de uma pesquisa mais aprofundada, você pode entrar em contato com a equipe Move&Care através da opção',
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
    return (totalPoints >= 26)
        ? 'O resultado do teste pode indicar sinais de TEA.'
        : 'O resultado do teste não indica sinais de TEA.';
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
                'O Quociente do Espectro Autista em Adultos é um questionário autoaplicável que permite identificar traços relacionados ao Transtorno do Espectro Autista (TEA) em adultos. Este questionário foi desenhado para pessoas com mais de 16 anos sem deficiência intelectual.\nResponda a todos os itens, considerando apenas uma resposta dentre as quatro opções.',
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

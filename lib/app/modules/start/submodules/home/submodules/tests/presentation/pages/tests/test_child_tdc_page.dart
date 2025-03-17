// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:moveecare/app/core/ui/widgets/app_radio_button.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';
import 'package:moveecare/app/modules/start/submodules/home/submodules/tests/domain/answer_for_api_entity.dart';

import '../../../../../../../../../core/app_routes.dart';
import '../../../domain/test_entity.dart';
import '../views_objects/result_test_vo.dart';

class TestChildTdcPage extends StatefulWidget {
  const TestChildTdcPage({super.key});

  @override
  State<TestChildTdcPage> createState() => _TestChildTdcPageState();
}

class _TestChildTdcPageState extends State<TestChildTdcPage> {
  String test = 'Rastreamento em crianças - TDC';
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
        title: '1. Qual a idade da criança?',
        options: [
          QuestionOptionsEntity(label: 'De 5 anos a 7 anos 11 meses', point: 1),
          QuestionOptionsEntity(label: 'De 8 anos a 9 anos 11 meses', point: 2),
          QuestionOptionsEntity(label: 'De 10 anos a 15 anos', point: 3),
        ],
      ),
      QuestionEntity(
        title:
            '2. A criança não consegue prestar muita atenção a detalhes ou comete erros por descuido nos trabalhos da escola ou tarefas.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '3. Agarra uma bola pequena (por exemplo, do tamanho de uma bola de tênis) lançada de uma distância de cerca de 2 metros.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '4. Se sai tão bem em esportes de equipe (como futebol e queimada) quanto em esportes individuais (como natação e skate), porque suas habilidades motoras são boas o suficiente para participar bem de um time.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '5. Salta facilmente por cima de obstáculos encontrados no quintal, parque ou no ambiente onde brinca.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '6. Corre com a mesma rapidez e de maneira parecida com outras crianças do mesmo sexo e idade.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '7. Se tem um plano de fazer uma atividade motora, ela consegue organizar seu corpo para seguir o plano e completar a tarefa de modo eficaz (por exemplo, construir um “esconderijo” ou “cabaninha” de papelão ou almofadas, mover-se nos equipamentos do parquinho, construir uma casa ou uma estrutura com blocos, ou usar materiais artesanais).',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '8. Escreve ou desenha rápido o suficiente para acompanhar o resto das crianças na sala de aula.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '9. Escreve letras, números e palavras de maneira legível e precisa ou, se ainda não aprendeu a escrever, consegue colorir e desenhar de maneira coordenada, e faz desenhos que você consegue reconhecer.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '10. Usa esforço ou tensão apropriados quando está escrevendo (não usa pressão excessiva ou segura forte demais o lápis, não escreve forte ou escuro demais, nem leve demais).',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '11. Recorta gravuras e formas com precisão e facilidade.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '12. Aprendeu a cortar carne com garfo e faca na mesma idade que seus amigos.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '13. Tem interesse e gosta de participar de atividades esportivas ou jogos ativos que exigem boa habilidade motora.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '14. Aprende novas tarefas motoras (por exemplo, nadar, andar de patins) facilmente e não precisa de mais treino ou mais tempo que outras crianças para atingir o mesmo nível de habilidade.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title: '15. É rápida e competente em se arrumar, colocando e amarrando sapatos, vestindo-se, etc.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
        ],
      ),
      QuestionEntity(
        title:
            '16. Não se cansa facilmente ou não parece desmontar ou “escorregar da cadeira” quando tem que ficar sentada por muito tempo.',
        options: [
          QuestionOptionsEntity(label: 'Não é nada parecido com a criança', point: 1),
          QuestionOptionsEntity(label: 'Parece um pouquinho com a criança', point: 2),
          QuestionOptionsEntity(label: 'Moderadamente parecido com a criança', point: 3),
          QuestionOptionsEntity(label: 'Parece bastante com a criança', point: 4),
          QuestionOptionsEntity(label: 'Extremamente parecido com a criança', point: 5),
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
          textAlign: TextAlign.justify,
          children: [
            const TextSpan(
                text:
                    'É recomendado consultar um especialista para confirmar ou descartar qualquer tipo de diagnóstico.\nCaso deseje participar de uma pesquisa mais aprofundada, você pode entrar em contato com a equipe Move&Care através da opção'),
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
    for (var i = 1; i < answersQuestions.values.length; i++) {
      total += answersQuestions[i]?.toInt() ?? 0;
    }
    return total;
  }

  String _recomendation(int totalPoints) {
    int rangeAge = answersQuestions.values.first;

    if (rangeAge == 1) {
      if (totalPoints >= 15 && totalPoints <= 46) {
        return 'O resultado do teste pode indicar suspeita de TDC para a criança/adolescente avaliado(a).';
      } else if (totalPoints >= 47 && totalPoints <= 75) {
        return 'O resultado do teste não reflete indicação ou suspeita de TDC para a criança/adolescente avaliado(a).';
      }
    } else if (rangeAge == 2) {
      if (totalPoints >= 15 && totalPoints <= 55) {
        return 'O resultado do teste pode indicar suspeita de TDC para a criança/adolescente avaliado(a).';
      } else if (totalPoints >= 56 && totalPoints <= 75) {
        return 'O resultado do teste não reflete indicação ou suspeita de TDC para a criança/adolescente avaliado(a).';
      }
    } else if (rangeAge == 3) {
      if (totalPoints >= 15 && totalPoints <= 57) {
        return 'O resultado do teste pode indicar suspeita de TDC para a criança/adolescente avaliado(a).';
      } else if (totalPoints >= 58 && totalPoints <= 75) {
        return 'O resultado do teste não reflete indicação ou suspeita de TDC para a criança/adolescente avaliado(a).';
      }
    }
    return '';
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
                'A maioria dos itens deste questionário tem como referência as atividades motoras que a criança faz com as mãos ou quando se movimenta. A coordenação motora tende a melhorar a cada ano, à medida que a criança cresce e se desenvolve. Por esse motivo, será mais fácil responder às perguntas se você pensar em outras crianças que você conhece e que têm a mesma idade da criança avaliada. Marque a opção que mais parece com a criança.',
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
                            // print('$key - ${questions[key].title}: $value');
                          });
                          showResult();
                        }
                      : null);
            }),
      )),
    );
  }
}

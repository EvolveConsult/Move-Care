import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/app_routes.dart';

import '../../../../../../../../core/ui/theme/app_typography.dart';
import '../../../../../../../../core/ui/widgets/app_scaffold_widget.dart';
import '../../domain/test_entity.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({super.key});

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  List<TestsEntity> tests = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tests = [
      TestsEntity(
          title:
              'Teste 1 - Avaliação de habilidades intelectuais com texto maio para exemplicar uma quebra de linhaaaaaa maio para exemplicar uma quebra de linhaaaaaa',
          questions: [
            QuestionEntity(title: '1 Pergunta:', options: [
              QuestionOptionsEntity(label: '1 Pergunta - 1 opção'),
              QuestionOptionsEntity(label: '1 Pergunta - 2 opção'),
              QuestionOptionsEntity(label: '1 Pergunta - 3 opção'),
              QuestionOptionsEntity(label: '1 Pergunta - 4 opção'),
            ]),
            QuestionEntity(title: '2 Pergunta:', options: [
              QuestionOptionsEntity(label: '2 Pergunta - 1 opção'),
              QuestionOptionsEntity(label: '2 Pergunta - 2 opção'),
              QuestionOptionsEntity(label: '2 Pergunta - 3 opção'),
              QuestionOptionsEntity(label: '2 Pergunta - 4 opção'),
            ]),
            QuestionEntity(title: '3 Pergunta:', options: [
              QuestionOptionsEntity(label: '3 Pergunta - 1 opção'),
              QuestionOptionsEntity(label: '3 Pergunta - 2 opção'),
              QuestionOptionsEntity(label: '3 Pergunta - 3 opçãoLoremLoremLorem'),
              QuestionOptionsEntity(label: '3 Pergunta - 4 opção'),
            ]),
            QuestionEntity(title: '4 Pergunta:', options: [
              QuestionOptionsEntity(label: '4 Pergunta - 1 opção Lorem Ipsum damp'),
              QuestionOptionsEntity(label: '4 Pergunta - 2 opção'),
              QuestionOptionsEntity(label: '4 Pergunta - 3 opção'),
              QuestionOptionsEntity(label: '4 Pergunta - 4 opção'),
            ]),
            QuestionEntity(title: '5 Pergunta:', options: [
              QuestionOptionsEntity(label: '5 Pergunta - 1 opção'),
              QuestionOptionsEntity(label: '5 Pergunta - 2 opção'),
              QuestionOptionsEntity(label: '5 Pergunta - 3 opção'),
              QuestionOptionsEntity(label: '5 Pergunta - 4 opção'),
            ]),
          ]),
      TestsEntity(title: 'Teste 2 - Avaliação teste', questions: [
        QuestionEntity(title: '2 Pergunta:', options: [
          QuestionOptionsEntity(label: '1 opção'),
          QuestionOptionsEntity(label: '2 opção'),
          QuestionOptionsEntity(label: '3 opção'),
          QuestionOptionsEntity(label: '4 opção'),
        ])
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Testes',
      page: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (_, index) => _ItemsTests(test: tests[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemCount: tests.length),
    );
  }
}

class _ItemsTests extends StatelessWidget {
  final TestsEntity test;

  const _ItemsTests({required this.test});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 2),
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.2),
          )
        ],
      ),
      padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: 'https://picsum.photos/200/300',
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator.adaptive(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => const Icon(Icons.error), //TODO mudar para logo do app
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: AppText(test.title,
                            size: AppTextSize.small, textOverflow: TextOverflow.ellipsis, maxLine: 4)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ButtonTest(label: 'TDC', test: test),
                _ButtonTest(label: 'TEA', test: test),
                _ButtonTest(label: 'TDAH', test: test),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonTest extends StatelessWidget {
  const _ButtonTest({required this.label, required this.test});
  final String label;
  final TestsEntity test;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(AppRoutes.answerTest, arguments: test),
      child: Column(
        children: [
          AppText(label),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: const AppText('Iniciar', size: AppTextSize.small),
          )
        ],
      ),
    );
  }
}

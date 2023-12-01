import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';

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
          title: 'Teste 1 - Avaliação de habilidades intelectuais',
          pathImage: 'https://picsum.photos/200/300',
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
      TestsEntity(title: 'Teste 2 - Avaliação teste', pathImage: 'https://picsum.photos/200/300', questions: [
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
          padding: const EdgeInsets.symmetric(vertical: 24),
          itemBuilder: (_, index) => _ItemsTests(test: tests[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 100,
                height: 80,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: test.pathImage,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator.adaptive(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error), //TODO mudar para logo do app
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Align(alignment: Alignment.topCenter, child: AppText(test.title, size: AppTextSize.small))),
            const SizedBox(width: 8),
            Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => Modular.to.pushNamed(AppRoutes.answerTest, arguments: test),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: const AppText('Iniciar', size: AppTextSize.small),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

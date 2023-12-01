import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import '../../../../../../../../core/ui/widgets/app_scaffold_widget.dart';
import 'views_objects/result_test_vo.dart';

class ResultTestPage extends StatelessWidget {
  const ResultTestPage({super.key, required this.vo});

  final ResultTestVo vo;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      hasAppBar: false,
      page: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            const AppText('Sua pontuação', size: AppTextSize.great, textStyle: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 50,
              child: AppText(vo.score.toString()),
            ),
            const SizedBox(height: 62),
            const AppText('Recomendação para o resultado atingido:', textStyle: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            AppText(vo.recomendation),
          ],
        ),
      ),
      // bottomNavigationBar: IntrinsicHeight(
      //     child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      //   child: AppButton(text: 'Compartilhar resultado', onTap: () {}),
      // )),
    );
  }
}

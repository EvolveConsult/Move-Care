import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/app_routes.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import '../../../../../../../../core/ui/widgets/app_button_widget.dart';
import '../../../../../../../../core/ui/widgets/app_scaffold_widget.dart';
import 'views_objects/result_test_vo.dart';

class ResultTestPage extends StatefulWidget {
  const ResultTestPage({super.key, required this.vo});

  final ResultTestVo vo;

  @override
  State<ResultTestPage> createState() => _ResultTestPageState();
}

class _ResultTestPageState extends State<ResultTestPage> {
  @override
  void initState() {
    _saveFirebase();
    super.initState();
  }

  Future<void> _saveFirebase() async {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';
    widget.vo.answerForApiEntity.email = email;
    CollectionReference tests = FirebaseFirestore.instance.collection('tests');
    tests.add(widget.vo.answerForApiEntity.toFirebase());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      hasAppBar: false,
      page: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            const AppText('Sua pontuação', size: AppTextSize.great, textStyle: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 50,
              child: AppText(widget.vo.score.toString()),
            ),
            const SizedBox(height: 62),
            const AppText('Recomendação para o resultado atingido:', textStyle: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            AppText(widget.vo.recomendation, textAlign: TextAlign.justify),
            if (widget.vo.alert != null) ...[const SizedBox(height: 20), widget.vo.alert!]
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: AppButton(text: 'Tela inicial', onTap: () => Modular.to.popUntil(ModalRoute.withName(AppRoutes.start))),
      )),
    );
  }
}

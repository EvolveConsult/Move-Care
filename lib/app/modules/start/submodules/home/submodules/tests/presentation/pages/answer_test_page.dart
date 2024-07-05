// // ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:moveecare/app/core/app_routes.dart';
// import 'package:moveecare/app/core/ui/theme/app_typography.dart';
// import 'package:moveecare/app/core/ui/widgets/app_button_widget.dart';
// import 'package:moveecare/app/core/ui/widgets/app_radio_button.dart';
// import 'package:moveecare/app/modules/start/submodules/home/submodules/tests/presentation/pages/views_objects/result_test_vo.dart';

// import '../../../../../../../../core/ui/widgets/app_scaffold_widget.dart';
// import '../../domain/test_entity.dart';

// class AnswerTestPage extends StatefulWidget {
//   const AnswerTestPage({super.key, required this.test});

//   final TestsEntity test;

//   @override
//   State<AnswerTestPage> createState() => _AnswerTestPageState();
// }

// class _AnswerTestPageState extends State<AnswerTestPage> {
//   ValueNotifier<Map<int, String>> answers = ValueNotifier({});

//   void showResult() {
//     ResultTestVo vo = ResultTestVo(
//         titleTest: widget.test.title,
//         score: 38,
//         recomendation:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sodales vel urna a euismod. Mauris ullamcorper purus at porta efficitur. Curabitur mollis hendrerit lectus, eget venenatis elit facilisis eget. Donec commodo ligula id sem sollicitudin, ac euismod magna luctus. Donec molestie nunc vel diam maximus dictum. Proin eu urna elementum, suscipit elit quis, tempor quam. Mauris suscipit pharetra libero, mattis volutpat quam. Quisque convallis lorem cursus velit eleifend egestas. Aliquam nec nibh dolor.');
//     Modular.to.pushNamed(AppRoutes.resultTest, arguments: vo);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldWidget(
//       title: 'Avaliação de habilidades intelectuais',
//       page: ScrollConfiguration(
//         behavior: const ScrollBehavior().copyWith(overscroll: false),
//         child: ListView.separated(
//             physics: const ClampingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             itemBuilder: (_, questionsIndex) {
//               final question = widget.test.questions[questionsIndex];
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     question.title,
//                     size: AppTextSize.great,
//                     textStyle: const TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 16),
//                   AppRadioButton<QuestionOptionsEntity>(
//                       items: question.options,
//                       onChange: (selected) {
//                         if (selected != null) {
//                           answers.value[questionsIndex] = selected.label;
//                           answers.notifyListeners();
//                         }
//                       })
//                 ],
//               );
//             },
//             separatorBuilder: (_, __) => const SizedBox(height: 24),
//             itemCount: widget.test.questions.length),
//       ),
//       bottomNavigationBar: IntrinsicHeight(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//         child: ValueListenableBuilder(
//             valueListenable: answers,
//             builder: (_, value, __) {
//               return AppButton(
//                   text: 'Finalizar teste',
//                   onTap: value.entries.length == widget.test.questions.length
//                       ? () {
//                           answers.value.forEach((key, value) {
//                             print('$key: $value');
//                           });
//                           showResult();
//                         }
//                       : null);
//             }),
//       )),
//     );
//   }
// }

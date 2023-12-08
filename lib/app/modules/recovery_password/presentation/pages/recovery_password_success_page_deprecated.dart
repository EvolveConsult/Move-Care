// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:movecare/app/core/ui/theme/app_typography.dart';
// import 'package:movecare/app/core/ui/widgets/app_countdown_widget.dart';

// import '../../../../core/app_routes.dart';
// import '../../../../core/ui/widgets/app_scaffold_widget.dart';

// class RecoveryPasswordSuccessPage extends StatelessWidget {
//   const RecoveryPasswordSuccessPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldWidget(
//         hasAppBar: false,
//         page: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 140,
//               width: 140,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(200),
//                   border: Border.all(width: 4, color: Theme.of(context).colorScheme.secondary)),
//               child: Icon(Icons.done_rounded, size: 60, color: Theme.of(context).colorScheme.secondary),
//             ),
//             const SizedBox(height: 32),
//             AppText(
//               'Senha de acesso alterada com sucesso.',
//               size: AppTextSize.great,
//               textStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w600),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 80),
//             AppCountdownWidget(
//               seconds: 4,
//               child: (seconds) => AppText(
//                 'Você será direcionado para tela inicial em $seconds segundos.',
//                 size: AppTextSize.small,
//                 textAlign: TextAlign.center,
//               ),
//               onFinished: () => Modular.to.pushNamed(AppRoutes.home),
//             )
//           ],
//         ));
//   }
// }

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
  List<TypeTestEntity> tests = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tests = [
      TypeTestEntity(pathImage: 'assets/images/imageTest.png', title: 'Rastreamento em crianças', tests: [
        Test(label: 'TDAH', route: AppRoutes.testChildTdah),
        Test(label: 'TEA', route: AppRoutes.testChildTea),
        Test(label: 'TDC', route: AppRoutes.testChildTdc),
      ]),
      TypeTestEntity(pathImage: 'assets/images/imageTest.png', title: 'Rastreamento em adultos', tests: [
        Test(label: 'TDAH', route: AppRoutes.testAdultTdah),
        Test(label: 'TEA', route: AppRoutes.testAdultTea),
        Test(label: 'TDC', route: AppRoutes.testAdultTdc),
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
  final TypeTestEntity test;

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
                    child: Image.asset(test.pathImage, fit: BoxFit.fill),
                    // child: CachedNetworkImage(
                    //   fit: BoxFit.fill,
                    //   imageUrl: test.pathImage,
                    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                    //       Center(child: CircularProgressIndicator.adaptive(value: downloadProgress.progress)),
                    //   errorWidget: (context, url, error) => AppIcons.logo.icon(),
                    // ),
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
              children: test.tests.map((test) => _ButtonTestWidget(label: test.label, route: test.route)).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonTestWidget extends StatelessWidget {
  const _ButtonTestWidget({required this.label, required this.route});
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(route),
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

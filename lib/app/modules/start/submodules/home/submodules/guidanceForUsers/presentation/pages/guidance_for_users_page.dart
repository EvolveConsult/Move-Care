import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/app_routes.dart';
import 'package:moveecare/app/core/ui/theme/app_icons.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../domain/entities/guidance_for_users_entity.dart';
import '../controllers/guidance_for_users_controller.dart';

class GuidanceForUsersPage extends StatefulWidget {
  const GuidanceForUsersPage({super.key, required this.controller});
  final GuidanceForUsersController controller;

  @override
  State<GuidanceForUsersPage> createState() => _GuidanceForUsersPageState();
}

class _GuidanceForUsersPageState extends State<GuidanceForUsersPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      pagePadding: EdgeInsets.zero,
      title: 'Orientações ao usuário',
      page: ListenableBuilder(
          listenable: widget.controller,
          builder: (BuildContext context, Widget? child) {
            return switch (widget.controller.state) {
              GuidanceForUsersControllerState.loading => _StateGuidanceForUsersPageLoading(),
              GuidanceForUsersControllerState.empty => _StateGuidanceForUsersPageEmpty(),
              GuidanceForUsersControllerState.success =>
                _StateGuidanceForUsersPageSuccess(widget.controller.listGuidanceForUser),
              GuidanceForUsersControllerState.error => _StateGuidanceForUsersPageError(widget.controller.errorMessage),
            };
          }),
    );
  }
}

class _StateGuidanceForUsersPageSuccess extends StatelessWidget {
  const _StateGuidanceForUsersPageSuccess(this.listGuidanceForUser);

  final List<GuidanceForUsersEntity> listGuidanceForUser;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          final guidanceForUser = listGuidanceForUser[index];
          return GestureDetector(
            onTap: () {
              Modular.to.pushNamed(AppRoutes.guidanceForUsersDetails, arguments: guidanceForUser);
            },
            child: Container(
              height: 100,
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: double.maxFinite,
                        width: 112,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: guidanceForUser.urlImage,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: CircularProgressIndicator.adaptive(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => AppIcons.logo.icon(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Tooltip(
                          message: guidanceForUser.title,
                          child: AppText(
                            guidanceForUser.title,
                            size: AppTextSize.small,
                            textOverflow: TextOverflow.ellipsis,
                            maxLine: 3,
                          ),
                        )),
                  ),
                  const SizedBox(width: 8),
                  const Align(alignment: Alignment.centerRight, child: AppIcon(icon: AppIcons.arrowRight))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: listGuidanceForUser.length);
  }
}

class _StateGuidanceForUsersPageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container();
}

class _StateGuidanceForUsersPageEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Center(child: AppText('Nenhuma orientação disponível no momento.'));
}

class _StateGuidanceForUsersPageError extends StatelessWidget {
  const _StateGuidanceForUsersPageError(this.errorMessage);
  final String errorMessage;
  @override
  Widget build(BuildContext context) => Center(
        child: AppText(errorMessage),
      );
}

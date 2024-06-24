import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intersperse/intersperse.dart';
import 'package:moveecare/app/core/functions/open_url.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';
import 'package:open_store/open_store.dart';

import '../../../../../../core/app_routes.dart';
import '../../../../../../core/services/app_remote_config.dart';
import '../../../../../../core/ui/theme/app_icons.dart';
import '../../../../../../core/ui/widgets/app_bar_widget.dart';
import '../../../../../../core/ui/widgets/default_bottom_sheet.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Modular.get<ProfileController>();
  List<_ProfileOption> profileOptions = [];

  String nameUser = "";

  bool isIOS = false;

  Future<void> _logout() async {
    try {
      final googleSignIn = GoogleSignIn();
      final firebaseAuth = FirebaseAuth.instance;

      var isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        googleSignIn.signOut();
      } else {
        firebaseAuth.signOut();
      }
      Modular.to.navigate(AppRoutes.splash);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();

    _fetchUserData();
  }

  void _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    nameUser = user?.displayName ?? "Move&Care";
    setState(() {});
  }

  Future<void> _rateApp() async {
    final appStoreId = AppRemoteConfig().getString(RemoteConfigEnum.appStoreId);
    final androidAppBundleId = AppRemoteConfig().getString(RemoteConfigEnum.androidAppBundleId);

    OpenStore.instance.open(
      appStoreId: appStoreId,
      androidAppBundleId: androidAppBundleId,
    );
  }

  Future<void> _confirmDeleteAccount() async {
    controller.bottomSheetAlert.value = DefaultBottomSheet(
      title: 'Excluir conta',
      content: const AppText('Deseja realmente excluir sua conta? Essa ação não pode ser desfeita.'),
      confirmText: 'Confirmar',
      onConfirm: () {
        Modular.to.pop();
        controller.onConfirmDeleteAccount();
      },
      cancelText: 'Cancelar',
      onCancel: Modular.to.pop,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final Color colorButtons = Theme.of(context).colorScheme.onSecondary.withOpacity(.75);
    profileOptions = [
      // _ProfileOption(
      //     onTap: () => Modular.to.pushNamed(AppRoutes.contactUs),
      //     icon: AppIcon(icon: AppIcons.mail, color: colorButtons),
      //     label: 'Fale conosco'),
      // _ProfileOption(
      //     onTap: _rateApp,
      //     icon: AppIcon(icon: AppIcons.star, color: colorButtons),
      //     label: isIOS ? 'Avaliar na Apple Store' : 'Avaliar na Google Play'),
      _ProfileOption(
          onTap: onTapTerms,
          icon: AppIcon(icon: AppIcons.terms, color: colorButtons),
          label: 'Política de privacidade e Termos de uso'),
      _ProfileOption(
          onTap: _confirmDeleteAccount,
          icon: AppIcon(icon: AppIcons.trash, color: colorButtons),
          label: 'Excluir conta'),
      _ProfileOption(onTap: _logout, icon: AppIcon(icon: AppIcons.exit, color: colorButtons), label: 'Sair'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      backgroundColorAppBar: Theme.of(context).colorScheme.onBackground,
      pagePadding: const EdgeInsets.all(0),
      leadingActionType: LeadingActionType.none,
      showAppTopPageWidget: true,
      bottomSheetAlert: controller.bottomSheetAlert,
      canPop: false,
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 16),
                    Center(
                        child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(140),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: AppIcons.logo.icon(),
                    )),
                    const SizedBox(height: 12),
                    AppText(
                      nameUser,
                      size: AppTextSize.great,
                      textOverflow: TextOverflow.ellipsis,
                      maxLine: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  ...intersperse(
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 1,
                          color: Theme.of(context).colorScheme.outline),
                      List.generate(
                          profileOptions.length,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: profileOptions[index],
                              ))),
                  Container(
                      padding: const EdgeInsets.only(top: 32),
                      alignment: Alignment.center,
                      child: const AppText('Versão: 1.1.0', size: AppTextSize.verySmall))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({required this.icon, required this.label, required this.onTap});
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [icon, const SizedBox(width: 12), Flexible(child: AppText(label, size: AppTextSize.small))]),
    );
  }
}

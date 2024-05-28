import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/modules/shared/domain/entities/send_email_entity.dart';

import '../../../../../../../../core/services/app_remote_config.dart';
import '../../../../../../../../core/ui/widgets/default_bottom_sheet.dart';
import '../../../../../../../shared/domain/usecases/send_email_usecase.dart';

class ContactUsController {
  final ValueNotifier<bool> acceptContact = ValueNotifier(false);
  final TextEditingController textController = TextEditingController();
  final int minimunSizeRequired = 15;
  final SendEmailUsecase sendEmailUsecase;
  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  ContactUsController({required this.sendEmailUsecase});

  Future<void> sendEmail() async {
    final subjectEmail = AppRemoteConfig().getString(RemoteConfigEnum.subjectEmail);
    final supportEmail = AppRemoteConfig().getString(RemoteConfigEnum.supportEmail);

    final user = FirebaseAuth.instance.currentUser;
    final acceptAnswer = acceptContact.value ? 'Sim' : 'Não';

    final body = StringBuffer(textController.text);
    if (user?.email != null) {
      body.write('\n\nEnviado por: ${user?.email}');
    }

    body.write('\nAceita receber resposta: $acceptAnswer');

    final request = SendEmailEntity(
      reciptient: supportEmail,
      sender: user?.email ?? '',
      body: body.toString(),
      subject: subjectEmail,
    );
    final result = await sendEmailUsecase(request);

    result.fold((l) {
      bottomSheetAlert.value = DefaultBottomSheet(
        content: AppText(l.errorMessage),
        confirmText: 'Entendi',
      );
    }, (r) => {});
  }
}

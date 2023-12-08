import 'dart:developer' as dev;

abstract class Failure {
  final String errorMessage;
  final String label;
  final String errorLog;

  Failure({StackTrace? stackTrace, dynamic exception, this.label = '', this.errorMessage = '', this.errorLog = ''}) {
    if (stackTrace != null) {
      dev.log(errorLog, error: exception, stackTrace: stackTrace, name: label);
    }
  }
}

class ConnectionError extends Failure {
  ConnectionError()
      : super(errorMessage: 'Não foi possível concluir o processo. Verifique sua conexão e tente novamente!');
}

class ServerFailure extends Failure {
  ServerFailure()
      : super(errorMessage: 'Erro interno no servidor. Tente novamente, se o problema persistir contate o suporte!');
}

class UnknownError extends Failure {
  UnknownError({
    super.errorLog,
    super.errorMessage = 'Error desconhecido. Tente novamente, se o problema persistir contate o suporte!',
    super.label = '',
    super.exception,
    super.stackTrace,
  });
}

abstract class Validator {
  String? validate(String? value);
}

class EmptyValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}

class EmailValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty && !value.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }
}

class DocumentValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    // Adicione a lógica de validação do documento (exemplo: CPF) aqui.
    return null;
  }
}

class EmailOrDocumentValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    // Adicione a lógica de validação do documento (exemplo: CPF) aqui.
    return null;
  }
}

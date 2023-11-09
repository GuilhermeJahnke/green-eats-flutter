import '../../../presentation/atomic/molecules/text_field_molecule.dart';
import 'validators.dart';

extension TextFieldTypeExtension on TextFieldType {
  Validator getValidator() {
    switch (this) {
      case TextFieldType.none:
        return EmptyValidator();
      case TextFieldType.email:
        return EmailValidator();
      case TextFieldType.password:
        return EmptyValidator();
      case TextFieldType.cpf:
        return CpfValidator();
      case TextFieldType.emailOrCpf:
        return EmailOrCpfValidator();
      case TextFieldType.search:
        return SearchValidator();
    }
  }
}

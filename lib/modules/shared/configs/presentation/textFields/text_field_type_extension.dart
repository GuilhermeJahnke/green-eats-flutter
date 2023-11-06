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
      case TextFieldType.document:
        return DocumentValidator();
      case TextFieldType.emailOrDocument:
        return EmailOrDocumentValidator();
    }
  }
}

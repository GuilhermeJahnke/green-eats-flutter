import '../domain/entities/user.dart';

User get userMock => const User(
      id: '12345',
      name: 'João',
      lastName: 'Silva',
      email: 'teste@fiap.com',
      document: '123.456.789-09',
    );

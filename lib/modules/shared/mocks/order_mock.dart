import '../domain/entities/order.dart';

List<Order> listOrdersMock = [
  Order(
    id: '5',
    price: 20.0,
    establishmentImage:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/17319541-construcao-da-loja-e-ilustracao-do-icone-do-dos-desenhos-animados-do-caminhao-de-entrega-conceito-de-icone-de-construcao-de-negocios-isolado-premium-estilo-cartoon-plana-vetor.jpg',
    quantity: 2,
    status: OrderStatus.inProgress,
    date: DateTime.now(),
  ),
  Order(
    id: '4',
    price: 20.0,
    establishmentImage:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/17319541-construcao-da-loja-e-ilustracao-do-icone-do-dos-desenhos-animados-do-caminhao-de-entrega-conceito-de-icone-de-construcao-de-negocios-isolado-premium-estilo-cartoon-plana-vetor.jpg',
    quantity: 2,
    status: OrderStatus.delivered,
    date: DateTime.now(),
  ),
  Order(
    id: '3',
    price: 50.0,
    establishmentImage:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/17319541-construcao-da-loja-e-ilustracao-do-icone-do-dos-desenhos-animados-do-caminhao-de-entrega-conceito-de-icone-de-construcao-de-negocios-isolado-premium-estilo-cartoon-plana-vetor.jpg',
    quantity: 5,
    status: OrderStatus.rejected,
    date: DateTime.now(),
  ),
  Order(
    id: '2',
    price: 20.0,
    establishmentImage:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/17319541-construcao-da-loja-e-ilustracao-do-icone-do-dos-desenhos-animados-do-caminhao-de-entrega-conceito-de-icone-de-construcao-de-negocios-isolado-premium-estilo-cartoon-plana-vetor.jpg',
    quantity: 2,
    status: OrderStatus.inProgress,
    date: DateTime.now(),
  ),
  Order(
    id: '1',
    price: 40.0,
    establishmentImage:
        'https://static.vecteezy.com/ti/vetor-gratis/p1/17319541-construcao-da-loja-e-ilustracao-do-icone-do-dos-desenhos-animados-do-caminhao-de-entrega-conceito-de-icone-de-construcao-de-negocios-isolado-premium-estilo-cartoon-plana-vetor.jpg',
    quantity: 1,
    status: OrderStatus.pending,
    date: DateTime.now(),
  ),
];

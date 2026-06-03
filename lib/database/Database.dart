import '../model/ServiceOrder.dart';

class Database {
  static final Database _instance = Database._internal();

  Database._internal();

  factory Database() => _instance;

  final List<ServiceOrder> serviceOrdersMock = [
    ServiceOrder(
      id: 'OS-001',
      client: 'Cliente A',
      status: 'Aberta',
      desc: 'Troca de equipamento',
    ),
    ServiceOrder(
      id: 'OS-002',
      client: 'Cliente B',
      status: 'Em Andamento',
      desc: 'Configuração de rede',
    ),
  ];

  List<ServiceOrder> getOrders() {
    return serviceOrdersMock;
  }

  void addOrder(ServiceOrder order) {
    serviceOrdersMock.add(order);
  }
}

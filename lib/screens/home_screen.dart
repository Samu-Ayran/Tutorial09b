import 'package:flutter/material.dart';

import '../database/Database.dart';
import '../model/ServiceOrder.dart';
import 'cadastro_order_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Database database = Database();

  late List<ServiceOrder> orders;

  @override
  void initState() {
    super.initState();
    orders = database.getOrders();
  }

  Future<void> abrirCadastro() async {
    final ServiceOrder? novaOS = await showModalBottomSheet<ServiceOrder>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const CadastroOrderModal();
      },
    );

    if (novaOS != null) {
      database.addOrder(novaOS);

      setState(() {
        orders = database.getOrders();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ordens de Serviço')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final item = orders[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item.client),
              subtitle: Text(item.desc),
              trailing: Text(item.status),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }
}

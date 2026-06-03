import 'package:flutter/material.dart';
import '../model/ServiceOrder.dart';

class CadastroOrderModal extends StatefulWidget {
  const CadastroOrderModal({super.key});

  @override
  State<CadastroOrderModal> createState() => _CadastroOrderModalState();
}

class _CadastroOrderModalState extends State<CadastroOrderModal> {
  final _formKey = GlobalKey<FormState>();

  final _clientController = TextEditingController();
  final _descController = TextEditingController();

  String _statusSelecionado = 'Aberta';

  @override
  void dispose() {
    _clientController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: bottomInset + 20,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Nova Ordem de Serviço',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _clientController,
                decoration: const InputDecoration(
                  labelText: 'Cliente',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o cliente';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _statusSelecionado,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Status',
                ),
                items: const [
                  DropdownMenuItem(value: 'Aberta', child: Text('Aberta')),
                  DropdownMenuItem(
                    value: 'Em Andamento',
                    child: Text('Em Andamento'),
                  ),
                  DropdownMenuItem(
                    value: 'Concluída',
                    child: Text('Concluída'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _statusSelecionado = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      ServiceOrder(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        client: _clientController.text,
                        status: _statusSelecionado,
                        desc: _descController.text,
                      ),
                    );
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

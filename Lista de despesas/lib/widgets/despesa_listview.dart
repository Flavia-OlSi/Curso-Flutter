import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/despesa.dart';

class DespesaListView extends StatelessWidget {
  final List<Despesa> despesas;
  final void Function(int index) removerDespesa;

  

  const DespesaListView(
      {super.key, required this.despesas, required this.removerDespesa});

  @override
  Widget build(BuildContext context) {
    return despesas.isNotEmpty
        ? ListView.builder(
            itemCount: despesas.length,
            itemBuilder: (ctx, index) {
              final despesa = despesas[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.blue),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            DateFormat('dd/MM/yyyy HH:mm').format(despesa.data),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                                'R\$ ${double.parse(despesa.valor.toString()).toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black)),
                            Text(despesa.descricao,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 121, 121, 121))),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => removerDespesa(index)))
                    ],
                  ),
                ),
              );
            })
        : const Center(child: Text('Nenhuma despesa cadastrada'));
  }
}

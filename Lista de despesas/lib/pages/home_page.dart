import 'package:flutter/material.dart';
import 'package:lista_tarefa/repositories/despesa_repository.dart';
import 'package:lista_tarefa/widgets/despesa_listview.dart';
import '../models/despesa.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _despesaRepository = DespesaRepository();
  final _descricaoDespesaController = TextEditingController();
  final _valorDespesaController = TextEditingController();
  List<Despesa> _despesas = [];

  @override
  void initState() {
    super.initState();
    _despesaRepository.getDespesas().then((despesas) => {
          setState(() {
            _despesas = despesas;
          })
        });
  }

  double calcularTotalDespesa() {
    double totalDespesa =
        _despesas.map((despesa) => despesa.valor).reduce((a, b) => a + b);
    return totalDespesa;
  }

  void _cadastrarDespesa(BuildContext context) {
    // if (_descricaoDespesaController.text.isEmpty ||
    //     _valorDespesaController.text.isEmpty) return;

    double valor = double.parse(_valorDespesaController.text);
    final novaDespesa = Despesa(
        descricao: _descricaoDespesaController.text,
        valor: valor,
        data: DateTime.now());

    setState(() {
      _despesas.add(novaDespesa);
    });

    _despesaRepository.saveDespesas(_despesas);

    _descricaoDespesaController.text = '';
    _valorDespesaController.text = '';
  }

  void _removerDespesa(int index) {
    setState(() {
      _despesas.removeAt(index);
    });

    _despesaRepository.saveDespesas(_despesas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
        // backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _descricaoDespesaController,
                  decoration: const InputDecoration(
                    hintText: 'Descrição da despesa',
                    labelText: 'Descrição da despesa',
                  ),
                ),
                TextFormField(
                  controller: _valorDespesaController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    hintText: 'Valor',
                    labelText: 'Valor',
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                    onPressed: () => _cadastrarDespesa(context),
                    child: const Text('Cadastrar'),
                  ),
                ])
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              child: Text(
                'Total: R\$ ${_despesas.isNotEmpty ? calcularTotalDespesa() : 0.0}',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: DespesaListView(
                  despesas: _despesas, removerDespesa: _removerDespesa),
            ),
          )
        ],
      ),
    );
  }
}

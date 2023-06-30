import 'dart:convert';
import 'package:lista_tarefa/models/despesa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DespesaRepository {
  late SharedPreferences sharedPreferences;
  String key = 'despesas_list';

  Future<List<Despesa>> getDespesas() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(key) ?? '[]';
    final parsed = jsonDecode(jsonString);
    return parsed.map<Despesa>((map) => Despesa.fromJson(map)).toList();
  }

  void saveDespesas(List<Despesa> despesas) async {
    final jsonString = jsonEncode(despesas);
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, jsonString);
  }
}

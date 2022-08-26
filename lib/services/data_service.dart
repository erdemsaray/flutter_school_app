import 'dart:convert';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogretmen.dart';
import 'package:http/http.dart' as http;

class DataService {
  final String baseUrl = 'https://615d80a012571a0017207680.mockapi.io/';

  Future<Ogretmen> ogretmenIndir() async {
    int randomSayi = Random().nextInt(15)+1;

    final response = await http.get(Uri.parse('$baseUrl/ogretmen/$randomSayi'));

    if (response.statusCode == 200) {
      return Ogretmen.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Ogretmen indirilemedi ${response.statusCode}');
    }

    /*const n = """{"ad": "Yeni", "soyad": "Yenioğlu", "yas": 22, "cinsiyet": "Erkek"}""";

    final b = jsonDecode(n);

    final ogretmen = Ogretmen.fromMap(b);

    return ogretmen;*/
  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});

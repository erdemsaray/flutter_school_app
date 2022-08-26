import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogretmen.dart';
import 'package:ogrenci_app/services/data_service.dart';

class OgretmenlerRepository extends ChangeNotifier {
  List<Ogretmen> ogretmenler = [
    Ogretmen("Faruk", "Mesela", 34, "Erkek"),
    Ogretmen("Umut", "Örnek", 32, "Kadın"),
  ];

  final DataService dataService;
  OgretmenlerRepository(this.dataService);

  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.ogretmenIndir();
    //final m = {"ad": "Yeni", "soyad": "Yenioğlu", "yas": 22, "cinsiyet": "Erkek"};

   

    ogretmenler.add(ogretmen);
    notifyListeners(); 
  }
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository(ref.watch(dataServiceProvider));
});

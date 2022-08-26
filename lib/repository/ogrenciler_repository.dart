import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogrenci.dart';

class OgrencilerRepository extends ChangeNotifier {
  List<Ogrenci> ogrenciler = [
    Ogrenci("Ali", "Kaya", 34, "Erkek"),
    Ogrenci("Ayşe", "Ayyıldız", 32, "Kadın"),
  ];

  final Set<Ogrenci> sevdiklerim = {};

  void sev(Ogrenci ogrenci) {
    if (sevdiklerim.contains(ogrenci)) {
      sevdiklerim.remove(ogrenci);
    } else {
      sevdiklerim.add(ogrenci);
    }
    notifyListeners();
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final ogrencilerProvider = ChangeNotifierProvider((ref) {
  return OgrencilerRepository();
});



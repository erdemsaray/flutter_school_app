import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/mesaj.dart';

class MesajlarRepositoty extends ChangeNotifier {
  final List<Mesaj> mesajlar = [
    Mesaj("Merhaba", "Ali", DateTime.now().subtract(const Duration(minutes: 10))),
    Mesaj("Orada mısın?", "Ali", DateTime.now().subtract(const Duration(minutes: 9))),
    Mesaj("Merhaba, evet buradayım", "Ayşe", DateTime.now().subtract(const Duration(minutes: 8))),
    Mesaj("Nasılsın", "Ayşe", DateTime.now().subtract(const Duration(minutes: 7))),
    Mesaj("İyiyim, seni merak ettim", "Ali", DateTime.now().subtract(const Duration(minutes: 6))),
    Mesaj("Yıllardır hiç gelmeyecek birini beklediğimi biliyorum", "Ali",
        DateTime.now().subtract(const Duration(minutes: 5))),
    Mesaj("Yine de bu durumdan şikayet etmiyorum", "Ali", DateTime.now().subtract(const Duration(minutes: 4))),
    Mesaj("Ama Ali...", "Ayşe", DateTime.now().subtract(const Duration(minutes: 3))),
  ];
}

final mesajlarProvider = ChangeNotifierProvider((ref) {
  return MesajlarRepositoty();
});

class YeniMesajSayisi extends StateNotifier<int> {
  YeniMesajSayisi(int state) : super(state);

  void sifirla() {
    state = 0;
  }
}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi, int>((ref) {
  return YeniMesajSayisi(4);
});


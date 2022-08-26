import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/mesaj.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';

class MesajlarSayfasi extends ConsumerStatefulWidget {
  const MesajlarSayfasi({Key? key}) : super(key: key);

  @override
  ConsumerState<MesajlarSayfasi> createState() => MesajlarSayfasiState();
}

class MesajlarSayfasiState extends ConsumerState<MesajlarSayfasi> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => ref.read(yeniMesajSayisiProvider.notifier).sifirla());
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRepositoty = ref.watch(mesajlarProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajlarRepositoty.mesajlar.length,
                itemBuilder: ((context, index) {
                  return MesajGorunumu(mesajlarRepositoty.mesajlar[mesajlarRepositoty.mesajlar.length - index - 1]);
                })),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(16.0))),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(decoration: InputDecoration(border: InputBorder.none)),
                      )),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      print("Gönder");
                    },
                    child: const Icon(
                      Icons.arrow_right,
                      size: 36,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu(
    this.mesaj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == 'Ali' ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: !(mesaj.gonderen == 'Ali') ? const Color.fromARGB(255, 223, 198, 159) : Colors.green,
              borderRadius: const BorderRadius.all(const Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(mesaj.yazi),
          ),
        ),
      ),
    );
  }
}

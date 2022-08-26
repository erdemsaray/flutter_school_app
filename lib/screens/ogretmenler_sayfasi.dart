import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.abc_outlined),
      ),
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                    child: Text(
                      'Kayıtlı Öğretmen: ${ogretmenlerRepository.ogretmenler.length}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: OgretmenIndirmeButonu(),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, int index) => ListTile(
                title: Text(
                    ogretmenlerRepository.ogretmenler[index].ad + ' ' + ogretmenlerRepository.ogretmenler[index].soyad),
                leading: Text(ogretmenlerRepository.ogretmenler[index].cinsiyet == 'Kadın' ? '👩‍💼' : '👨‍💼',
                    style: const TextStyle(fontSize: 25)), //👨‍💼
              ),
              separatorBuilder: (context, int index) => const Divider(),
              itemCount: ogretmenlerRepository.ogretmenler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgretmenIndirmeButonu extends StatefulWidget {
  const OgretmenIndirmeButonu({
    Key? key,
  }) : super(key: key);

  @override
  State<OgretmenIndirmeButonu> createState() => _OgretmenIndirmeButonuState();
}

class _OgretmenIndirmeButonuState extends State<OgretmenIndirmeButonu> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return isLoading
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                try {
                  await ref.read(ogretmenlerProvider).indir();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            );
    });
  }
}

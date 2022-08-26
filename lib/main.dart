import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';
import 'package:ogrenci_app/screens/mesajlar_sayfasi.dart';
import 'package:ogrenci_app/screens/ogrenciler_sayfasi.dart';
import 'package:ogrenci_app/screens/ogretmenler_sayfasi.dart';
import 'package:ogrenci_app/screens/widgets/drawer_widget.dart';

void main() {
  runApp(ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(title: 'Anasayfa'),
    );
  }
}

class Anasayfa extends ConsumerWidget {
  const Anasayfa({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: DefaultTextStyle(
          style: const TextStyle(),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OgrencilerSayfasi()),
                    );
                  },
                  child: Text(
                    "${ogrencilerRepository.ogrenciler.length} Kayıtlı Öğrenci",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OgretmenlerSayfasi()),
                    );
                  },
                  child: Text(
                    "${ogretmenlerRepository.ogretmenler.length} Kayıtlı Öğretmen",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () {
                    _mesajlaraGit(context);
                  },
                  child: Text(
                    '${ref.watch(yeniMesajSayisiProvider)} yeni mesajınız var.',
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
      drawer: const WidgetDrawer(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _mesajlaraGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const MesajlarSayfasi();
      },
    ));
  }
}

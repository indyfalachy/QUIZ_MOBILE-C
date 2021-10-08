import 'package:flutter/material.dart';
import 'package:quiz/custom_widget_barang.dart';
import 'package:quiz/detail_barang.dart';

void main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAMERA MAHAL',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/detailbarang': (context) => DetailBarang(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Barang> barang = [
    Barang(
        namaBarang: "Sony",
        hargaBarang: 50,
        jumlahBarang: 2,
        gambar: 'sony.jpg'),
    Barang(
        namaBarang: "Canon",
        hargaBarang: 40,
        jumlahBarang: 2,
        gambar: 'canon.jpg'),
    Barang(
        namaBarang: "Fujifilm",
        hargaBarang: 35,
        jumlahBarang: 2,
        gambar: 'fujifilm.jpg'),
  ];
  int total = 0;

  dynamic data;

  void setTotal(List<Barang> barang) {
    var initTotal = 0;
    for (var i = 0; i < barang.length; i++) {
      initTotal += (barang[i].hargaBarang * barang[i].jumlahBarang);
    }
    total = initTotal;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments;
    if (data != null) {
      barang[data['index']].jumlahBarang = data['jumlah'];
    }
    setTotal(barang);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 15,
        leading: Text(""),
        backgroundColor: Colors.red,
        title: Text(
          "JUAL KAMERA",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: ListView.builder(
        itemCount: barang.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomWidgetBarang(barang: barang[index], id: index);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Rp. $total",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          height: 50,
        ),
        color: Colors.red,
      ),
    );
  }
}

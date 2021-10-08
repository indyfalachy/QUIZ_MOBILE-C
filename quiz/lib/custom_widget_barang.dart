import 'package:flutter/material.dart';

class Barang {
  String namaBarang;
  int hargaBarang;
  int jumlahBarang;
  String gambar;
  Barang(
      {required this.namaBarang,
      required this.hargaBarang,
      required this.jumlahBarang,
      required this.gambar});
}

class CustomWidgetBarang extends StatefulWidget {
  int id;
  Barang barang;

  CustomWidgetBarang({
    required this.barang,
    required this.id,
  });

  @override
  _CustomWidgetBarangState createState() => _CustomWidgetBarangState();
}

class _CustomWidgetBarangState extends State<CustomWidgetBarang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'img/${widget.barang.gambar}',
                  height: 130,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.barang.namaBarang,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Harga Satuan Rp. ${widget.barang.hargaBarang}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Jumlah Yang dibeli ${widget.barang.jumlahBarang}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detailbarang',
                              arguments: {
                                'index': widget.id,
                                'namaBarang': widget.barang.namaBarang,
                                'harga': widget.barang.hargaBarang,
                                'jumlah': widget.barang.jumlahBarang,
                                'gambar': widget.barang.gambar,
                              });
                        },
                        child: Text("Lihat Detail"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

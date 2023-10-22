import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130048/providers/produk_provider.dart';

import '../models/produk.dart';

class ProdukScreen extends StatefulWidget {
  const ProdukScreen({super.key, required this.dataProduk});

  final Produk dataProduk;

  @override
  State<ProdukScreen> createState() => _ProdukScreenState();
}

class _ProdukScreenState extends State<ProdukScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = "1";
  }

  String changeFormat(int input) {
    String temp = "";
    var f = NumberFormat("###,###", "en_US");
    temp = f.format(input);
    temp = temp.replaceAll(",", ".");
    return temp;
  }

  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _controller.text = '$_counter';
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        _controller.text = '$_counter';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProdukProvider>(
        builder: (context, provider, child) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        widget.dataProduk.gambar,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.dataProduk.nama,
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Rp. ${changeFormat(widget.dataProduk.harga)}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.dataProduk.keterangan,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
              Expanded(
                flex: 2,
                child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                icon: const Icon(Icons.remove, size: 18.0),
                                onPressed: _decrementCounter,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: Center(
                                child: Text(_counter.toString()),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                icon: const Icon(Icons.add, size: 18.0),
                                onPressed: _incrementCounter,
                              ),
                            ),
                          ),
                          const Expanded(flex: 2, child: SizedBox()),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo[800],
                                  padding: const EdgeInsets.all(8.0),
                                ),
                                onPressed: () {
                                  widget.dataProduk.jumlah =
                                      int.parse(_controller.text);
                                  widget.dataProduk.total =
                                      widget.dataProduk.harga *
                                          int.parse(_controller.text);
                                  if (provider.produks
                                      .contains(widget.dataProduk)) {
                                    Navigator.pop(context);
                                  } else {
                                    provider.addProduk(widget.dataProduk);
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  "Add to cart ",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts_2020130048/models/produk.dart';
import 'package:uts_2020130048/repository/repository.dart';
import 'package:uts_2020130048/screens/cart_screen.dart';
import 'package:uts_2020130048/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.nama,
  });

  final String nama;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  RepositoryProduk repo = RepositoryProduk();
  List<Produk> _list = [];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) {
      _list = repo.list;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_sharp),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 100, child: Image.asset("/images/logo2.png")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.nama,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('All Products'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTap(0);
                _list = repo.list;
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Costume'),
              selected: _selectedIndex == 1,
              onTap: () {
                _list = repo.getListByJenis("Costume");
                _onItemTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Wig'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTap(2);
                _list = repo.getListByJenis("Wig");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Accessories'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTap(3);
                _list = repo.getListByJenis("Acc");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        backgroundColor: Colors.grey,
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              )),
          child: const Icon(Icons.shopping_cart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Expanded(
                flex: 1,
                child: SizedBox(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Our products",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))),
            Expanded(
              flex: 10,
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: _list.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            margin: const EdgeInsets.all(5),
                            shadowColor: Colors.blueGrey,
                            elevation: 3,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProdukScreen(
                                      dataProduk: _list[index],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            _list[index].gambar,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            _list[index].nama,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

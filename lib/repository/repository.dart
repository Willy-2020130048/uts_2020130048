import '../models/produk.dart';

class RepositoryProduk {
  List<Produk> list = [
    Produk(
        gambar: 'images/Hutao.jpg',
        nama: 'Costume Hu Tao',
        harga: 150000,
        jenis: 'Costume',
        keterangan: "Sewa Hutao Cosplay",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/Zerotwo.jpg',
        nama: 'Costume Zero Two',
        harga: 100000,
        jenis: 'Costume',
        keterangan: "Sewa Zerotwo Cosplay",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/Gura.jpg',
        nama: 'Costume Gura',
        harga: 100000,
        jenis: 'Costume',
        keterangan: "Sewa Gura Cosplay",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/WigKazuha.jpeg',
        nama: 'Wig Kazuha',
        harga: 50000,
        jenis: 'Wig',
        keterangan: "Sewa Wig Kazuha",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/WigMaki.jpeg',
        nama: 'Wig Maki',
        harga: 50000,
        jenis: 'Wig',
        keterangan: "Sewa Wig Maki",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/WigNeonGenesis.jpeg',
        nama: 'Wig Neon Genesis',
        harga: 50000,
        jenis: 'Wig',
        keterangan: "Sewa Wig Neon Genesis",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/AccAOT.jpg',
        nama: 'Senjata Sword Gun',
        harga: 65000,
        jenis: 'Acc',
        keterangan: "Sewa Senjata Sword Gun",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/AccSenjata.jpg',
        nama: 'Staff of Homa',
        harga: 65000,
        jenis: 'Acc',
        keterangan: "Sewa Staff of Homa",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/AccTopi.jpg',
        nama: 'Topi One Piece',
        harga: 50000,
        jenis: 'Acc',
        keterangan: "Sewa Topi Luffy",
        jumlah: 0,
        total: 0),
  ];

  List<Produk> getListByJenis(String jenis) {
    List<Produk> temp = [];
    for (var produk in list) {
      if (jenis == "All") {
        temp.addAll(list);
      } else if (produk.jenis == jenis) {
        temp.add(produk);
      }
    }
    return temp;
  }
}

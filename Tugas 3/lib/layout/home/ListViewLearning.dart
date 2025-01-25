import 'package:flutter/material.dart';

class ListsWithCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data list bersarang (list di dalam list) yang akan ditampilkan
    List<List<String>> listData = [
      ['Item 1', 'Item 2', 'Item 3'], // List pertama
      ['Item A', 'Item B', 'Item C', 'Item D'], // List kedua
      ['Item X', 'Item Y', 'Item Z'], // List ketiga
      ['Item M', 'Item N', 'Item O'], // List keempat
    ];

    // Menggunakan ListView.builder untuk menampilkan setiap daftar dalam bentuk kartu
    return ListView.builder(
      itemCount: listData.length, // Jumlah item berdasarkan panjang listData
      itemBuilder: (context, index) {
        // Setiap elemen di listData ditampilkan dalam CardList
        return CardList(listData: listData[index]);
      },
    );
  }
}

// Kelas CardList yang menampilkan daftar dalam bentuk kartu
class CardList extends StatelessWidget {
  // Variabel listData untuk menampung data yang akan ditampilkan
  final List<String> listData;

  // Konstruktor wajib menerima parameter listData
  CardList({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0), // Memberikan margin di sekitar kartu
      child: Column(
        children: [
          // ListTile pertama untuk menampilkan judul kartu
          ListTile(
            title: Text(
                'List ${listData[0]}'), // Judul berdasarkan elemen pertama listData
          ),
          Divider(), // Garis pemisah antara judul dan isi list

          // ListView.builder di dalam kartu untuk menampilkan item-item dalam listData
          ListView.builder(
            itemCount: listData.length, // Jumlah item dalam listData
            shrinkWrap:
            true, // Membatasi ukuran ListView agar tidak memakan ruang di luar widget
            physics:
            NeverScrollableScrollPhysics(), // Menonaktifkan scroll di ListView bersarang
            itemBuilder: (context, index) {
              // Menampilkan setiap item listData dalam ListTile
              return ListTile(
                title: Text(listData[index]), // Menampilkan teks dari listData
              );
            },
          ),
        ],
      ),
    );
  }
}
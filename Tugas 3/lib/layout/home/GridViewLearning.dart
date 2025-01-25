import 'package:flutter/material.dart';

class GridViewLearning extends StatelessWidget {
  // Konstruktor kelas GridViewLearning
  GridViewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengembalikan widget Container sebagai root widget
    return Container(
      // Memberikan dekorasi pada Container menggunakan BoxDecoration
      decoration: BoxDecoration(
        // Memberikan warna latar belakang hijau pada Container
        color: Colors.green,
        // Memberikan border radius untuk membuat sudut Container melengkung
        borderRadius: BorderRadius.circular(15),
      ),
      // Menempatkan widget Center agar child berada di tengah
      child: const Center(
        // Menampilkan teks di tengah-tengah Container
        child: Text('Hello World'), // Teks yang akan ditampilkan
      ),
    );
  }
}
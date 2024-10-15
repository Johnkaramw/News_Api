import 'package:flutter/material.dart';
import 'package:prog_john/Widget/item.dart';
import 'package:prog_john/screens/cars.dart';
import 'package:prog_john/screens/coine.dart';
import 'package:prog_john/screens/fashion.dart';
import 'package:prog_john/screens/phons.dart';
import 'package:prog_john/screens/policy.dart';
import 'package:prog_john/screens/profilePage.dart';
import 'package:prog_john/screens/relational.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  // قائمة العناصر (الاندكس) مع بيانات مثل الصور والعناوين والـ onPressed
  List<Map<String, dynamic>> get items => [
        {
          'title': 'عالم العربيات',
          'image': 'assets/shopping.png',
          'page': const CarsPage(),
        },
        {
          'title': 'عالم الموضة',
          'image': 'assets/clothes.png',
          'page': const FashionPage(),
        },
        {
          'title': 'عالم العملة',
          'image': 'assets/bitcoin.png',
          'page': const CoinePage(), // يمكنك تعديل الصفحة المناسبة
        },
        {
          'title': 'عالم الموبايل',
          'image': 'assets/phons.png',
          'page': const PhonsPage(),
        },
        {
          'title': 'عالم السياسة',
          'image': 'assets/polisy.png',
          'page': const PolicyPage(),
        },
        
        {
          'title': 'عالم العلاقات',
          'image': 'assets/courtship.png',
          'page': const  RelationalPag(),
        },
      ];

 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const profilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person_3_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: (items.length / 2).ceil(), // عدد الصفوف المطلوبة
          itemBuilder: (context, index) {
            int first = index * 2;
            int second = first + 1;

            return Column(
              children: [
                Row(
                  children: [
                    buildItem(context, items[first]),
                    const SizedBox(width: 10), // مسافة أفقية بين العناصر داخل الصف
                    if (second < items.length)
                      buildItem(context, items[second]), // عرض العنصر الثاني إن وُجد
                  ],
                ),
                const SizedBox(height: 20), // مسافة عمودية بين الصفوف
              ],
            );
          },
        ),
      ),
    );
  }
}
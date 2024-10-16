import 'package:flutter/material.dart';
import 'package:prog_john/models/item.dart';
import 'package:prog_john/screens/business.dart';
import 'package:prog_john/screens/entertainment.dart';
import 'package:prog_john/screens/health.dart';
import 'package:prog_john/screens/science.dart';
import 'package:prog_john/screens/technology.dart';
import 'package:prog_john/screens/cars.dart';
import 'package:prog_john/screens/coine.dart';
import 'package:prog_john/screens/fashion.dart';
import 'package:prog_john/screens/general.dart';
import 'package:prog_john/screens/sports.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
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
                    const SizedBox(
                        width: 10), // مسافة أفقية بين العناصر داخل الصف
                    if (second < items.length)
                      buildItem(
                          context, items[second]), // عرض العنصر الثاني إن وُجد
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

// قائمة العناصر (الاندكس) مع بيانات مثل الصور والعناوين والـ onPressed
List<Map<String, dynamic>> get items => [
      {
        'title': 'عالم Cars',
        'image': 'assets/shopping.png',
        'page': const CarsPage(),
      },
      {
        'title': 'عالم Fashion',
        'image': 'assets/clothes.png',
        'page': const FashionPage(),
      },
      {
        'title': 'عالم Coine',
        'image': 'assets/bitcoin.png',
        'page': const CoinePage(), // يمكنك تعديل الصفحة المناسبة
      },
      {
        'title': 'عالم technology',
        'image': 'assets/technology.png',
        'page': const TechnologyPage(),
      },
      {
        'title': 'عالم general',
        'image': 'assets/general.png',
        'page': const GeneralPage(),
      },
      {
        'title': 'عالم sports',
        'image': 'assets/balls-sports.png',
        'page': const SportsPage(),
      },
      {
        'title': 'عالم science',
        'image': 'assets/data-science.png',
        'page': const SciencePage(),
      },
      {
        'title': 'عالم   health',
        'image': 'assets/healthcare.png',
        'page': const HealthPage(),
      },
      {
        'title': 'عالم   business',
        'image': 'assets/business.png',
        'page': const BusinessPage(),
      },
      {
        'title': 'عالم entertainment',
        'image': 'assets/entertainment.png',
        'page': const EntertainmentPage(),
      }
    ];

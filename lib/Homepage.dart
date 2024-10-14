import 'package:flutter/material.dart';
import 'package:prog_john/cars.dart';
import 'package:prog_john/fashion.dart';
import 'package:prog_john/phons.dart';
import 'package:prog_john/profilePage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        child: Column(
          children: [
            Row(
               children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5, // نسبة العرض إلى الارتفاع
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/shopping.png'), // صورة السيارات
                          fit: BoxFit.contain, // جعل الصورة تغطي كامل المساحة
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CarsPage(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'عالم العربيات',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 0, 0, 0), // لجعل النص واضحًا على الصورة
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // مسافة بين المربعات
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5, // نسبة العرض إلى الارتفاع
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/clothes.png'), // صورة الموضة
                          fit: BoxFit.contain, // جعل الصورة تغطي كامل المساحة
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FashionPage()),
                          );
                        },
                        child: const Center(
                          child: Text(
                            ' عالم الموضة ',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 0, 0, 0), // لجعل النص واضحًا على الصورة
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 19,
            ),
            Row(
               children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                              image: AssetImage('assets/bitcoin.png'),
                              fit: BoxFit.contain)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FashionPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'عالم العملة',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage('assets/phnos.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhonsPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'عالم الموبايل ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

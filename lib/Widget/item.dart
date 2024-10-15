import 'package:flutter/material.dart';

Widget buildItem(BuildContext context, 
 Map<String, dynamic> item) {
  return Expanded(
    child: AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(item['image']),
            fit: BoxFit.contain,
          ),
        ),
        child: TextButton(
          onPressed: () {
            if (item['page'] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item['page']),
              );
            }
          },
          child: Text(
            item['title'],
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
  );
}

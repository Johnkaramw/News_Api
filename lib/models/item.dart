import 'package:flutter/material.dart';

Widget buildItem(BuildContext context, Map<String, dynamic> item) {
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
          child: Container(
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.5), // تقليل الشفافية لزيادة وضوح النص
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    color: Colors.red.withOpacity(0.7), // تقليل شفافية الظل
                  ),
                  Shadow(
                    offset: Offset(-1.5, -1.5), // تقليل الظل الإضافي
                    blurRadius: 4.0,
                    color: Colors.red.withOpacity(0.4), // تخفيف الظل الإضافي
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

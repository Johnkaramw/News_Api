// import 'package:flutter/cupertino.dart';
// import 'package:prog_john/Widget/contenar.dart';
 
// import 'package:prog_john/models/category_model.dart';

// class CategoryListView extends StatelessWidget {
//   const CategoryListView({
//     super.key,
//   });

//   final List<CategoryModel> category = const [
//     CategoryModel(image: 'assets/different_sports.jpg', text: 'Sports'),
//     CategoryModel(image: 'assets/games.jpg', text: 'Games'),
//     CategoryModel(image: 'assets/health.webp', text: 'Health'),
//     CategoryModel(image: 'assets/children.jpg', text: 'Children'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: category.length,
//         itemBuilder: (context, index) {
//           return Contenar(
//             category: category[index],
//           );
//         },
//       ),
//     );
//   }
// }

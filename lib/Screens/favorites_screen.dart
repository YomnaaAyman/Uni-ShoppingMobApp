// import 'package:flutter/material.dart';
// import 'package:shopping_app/Models/FavouriteItemModel.dart';

// class Favourites extends StatelessWidget {
//   const Favourites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final favourites = FavouriteItemModel.favourites;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favourites", style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.pink.shade300,
//       ),
//       body: ListView.builder(
//         itemCount: favourites.length,
//         itemBuilder: (context, index) {
//           final item = favourites[index];
//           return ListTile(
//             leading: Image.asset(item['imageUrl'], width: 50, height: 50),
//             title: Text(item['productName']),
//             subtitle: Text(item['productCategory']),
//             trailing: Text("\$${item['productPrice']}"),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
//import 'package:shopping_app/Models/ProductItemModel.dart';
import 'package:shopping_app/Models/FavouriteItemModel.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final favourites = FavouriteItemModel.favourites;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.pink.shade300,
      ),
      body: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final item = favourites[index];
          return ListTile(
            leading: Image.network(item.imgUrl, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text(item.category),
            trailing: Text("\$${item.price}"),
          );
        },
      ),
    );
  }
}

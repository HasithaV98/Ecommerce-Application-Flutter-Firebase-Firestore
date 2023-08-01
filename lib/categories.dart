import 'package:flutter/material.dart';
import 'package:suppliment_ordering_application/details.dart';
import 'package:suppliment_ordering_application/home.dart';
import 'package:suppliment_ordering_application/widget/bottomContainer.dart';

import 'models/supplementModel.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  //const Categories({super.key});
  List<SupplementModel> list = [];
  Categories({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              })),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: false,
        primary: false,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: list
            .map(
              (e) => BottomContainer(
                image: e.image,
                price: e.price,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            image: e.image,
                            name: e.name,
                            price: e.price,
                          )));
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

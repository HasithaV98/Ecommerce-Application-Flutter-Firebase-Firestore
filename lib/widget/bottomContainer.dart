import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final Function onTap;
  BottomContainer({
    required this.image,
    required this.price,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        height: 270.00,
        width: 220.00,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(image),
            ),
            ListTile(
              leading: Text(name,
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              trailing: Text(
                '\$ $price',
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suppliment_ordering_application/provider/my_proveder.dart';
//import 'package:suppliment_ordering_application/provider/my_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalPrice();

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ $total',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.deleteItem(index);
          return cartItem(
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
            onTap: () {
              provider.delete();
            },
          );
        },
      ),
    );
  }

  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required int quantity,
    required Function onTap,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 170,
              height: 170.0,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'data',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                                size: 35.0,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.black,
                                size: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onTap();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

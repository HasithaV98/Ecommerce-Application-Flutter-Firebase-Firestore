import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:suppliment_ordering_application/categories.dart';
import 'package:suppliment_ordering_application/home.dart';
import 'package:suppliment_ordering_application/provider/my_proveder.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  const DetailsPage(
      {required this.image, required this.name, required this.price});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(widget.image),
            ),
          )),
          const Divider(
            thickness: 2,
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(color: Colors.black, fontSize: 40.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity--;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '\$${widget.price}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30.0),
                          )
                        ],
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Whey protein is the protein from whey, the watery portion of milk that separates from the curds when making cheese. It is commonly used as a protein supplement. Whey protein might improve the nutrient content of the diet and also have effects on the immune system.',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 400,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.lightGreen),
                              ),
                              child: RawMaterialButton(
                                  onPressed: () {
                                    provider.addToCart(
                                        name: widget.name,
                                        image: widget.image,
                                        price: widget.price,
                                        quantity: quantity);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.shopping_cart),
                                      Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )
                    ]),
              )),
        ],
      ),
    );
  }
}

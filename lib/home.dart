import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suppliment_ordering_application/categories.dart';
import 'package:suppliment_ordering_application/details.dart';
import 'package:suppliment_ordering_application/models/categories_model.dart';
import 'package:suppliment_ordering_application/models/proteinModel.dart';
import 'package:suppliment_ordering_application/models/supplementModel.dart';
import 'package:suppliment_ordering_application/provider/my_proveder.dart';
import 'package:suppliment_ordering_application/widget/bottomContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> wheyCategoriesList = [];
  List<CategoriesModel> massCategoriesList = [];
  List<CategoriesModel> aminoCategoriesList = [];
  List<CategoriesModel> fishCategoriesList = [];
  List<CategoriesModel> creatienCategoriesList = [];
  List<CategoriesModel> energyCategoriesList = [];
  List<ProteinModel> protienList = [];
  List<SupplementModel> wheyModelList = [];
  List<SupplementModel> massModelList = [];
  List<SupplementModel> aminoModelList = [];
  List<SupplementModel> fishoilModelList = [];
  List<SupplementModel> creatienModelList = [];
  List<SupplementModel> energyModelList = [];
  Widget categoriesContainer({
    required String image,
    required String name,
    required Function onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap(),
          child: Container(
            margin: const EdgeInsets.only(left: 20.0),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          name,
          style: const TextStyle(color: Colors.black, fontSize: 25.0),
        )
      ],
    );
  }

  Widget userAccountSide({
    required String name,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.black, fontSize: 25.0),
      ),
    );
  }

  Widget whey() {
    return Row(
      children: wheyCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: wheyModelList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget mass() {
    return Row(
      children: massCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: massModelList),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget amino() {
    return Row(
      children: aminoCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Categories(
                          list: aminoModelList,
                        )));
              }))
          .toList(),
    );
  }

  Widget fish() {
    return Row(
      children: fishCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Categories(list: fishoilModelList)));
              }))
          .toList(),
    );
  }

  Widget creatien() {
    return Row(
      children: fishCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Categories(list: creatienModelList)));
              }))
          .toList(),
    );
  }

  Widget energy() {
    return Row(
      children: energyCategoriesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Categories(list: energyModelList)));
              }))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getWheyCategories();
    wheyCategoriesList = provider.throwWheyList;
    provider.getMassCategories();
    massCategoriesList = provider.throwMassList;
    provider.getAminoCategories();
    aminoCategoriesList = provider.throwAminoList;
    provider.getFishCategories();
    fishCategoriesList = provider.throwFishList;
    provider.getCreatienCategories();
    creatienCategoriesList = provider.throwCreatienList;
    provider.getEnergyCategories();
    energyCategoriesList = provider.throwEnergyList;
    provider.getProteinList();
    protienList = provider.throwProtienModelList;
    provider.getWheyCategoriesList();
    wheyModelList = provider.throwWhey;
    provider.getMassCategoriesList();
    massModelList = provider.throwMass;
    provider.getAminoCategoriesList();
    aminoModelList = provider.throwAmino;
    provider.getFishoilCategoriesList();
    fishoilModelList = provider.throwFishoil;
    provider.getCreatienCategoriesList();
    creatienModelList = provider.throwCreatien;
    provider.getEnergyCategoriesList();
    energyModelList = provider.throwEnergy;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.jpg'),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assetName'),
              ),
              accountName: Text('Hasitha Viduranga'),
              accountEmail: Text('hasithavidu55@gmail.com'),
            ),
            userAccountSide(
              icon: Icons.person,
              name: 'Profile',
            ),
            userAccountSide(
              icon: Icons.shopping_cart,
              name: 'Cart',
            ),
            userAccountSide(
              icon: Icons.shop,
              name: 'Order',
            ),
            userAccountSide(
              icon: Icons.info,
              name: 'About',
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const ListTile(
              leading: Text(
                'Coomunicate',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ),
            userAccountSide(
              icon: Icons.lock,
              name: 'About',
            ),
            userAccountSide(
              icon: Icons.logout,
              name: 'Log Out',
            ),
          ],
        )),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0.0, actions: const [
        Padding(
          padding: EdgeInsets.all(9.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
        )
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                whey(),
                mass(),
                amino(),
                fish(),
                creatien(),
                energy(),

                /*categoriesContainer(image: 'assets/all.png', name: 'All'),
                categoriesContainer(
                    image: 'assets/w.png', name: 'Whey Protein'),
                categoriesContainer(
                    image: 'assets/m.png', name: 'Mass Protein'),
                categoriesContainer(
                    image: 'assets/a.png', name: 'Amino Tablet'),
                categoriesContainer(image: 'assets/f.jpg', name: 'Fish Oils'),
                categoriesContainer(image: 'assets/c.png', name: 'Creatien'),
                categoriesContainer(
                    image: 'assets/e.jpg', name: 'Energy Drinks'),*/
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 1000.0,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: false,
              primary: false,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: protienList
                  .map(
                    (e) => BottomContainer(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                        image: e.image,
                                        name: e.name,
                                        price: e.price,
                                      )));
                        },
                        image: e.image,
                        price: e.price,
                        name: e.name),
                  )
                  .toList(),

              /*children: [
                bottomContainer(image: '', price: 50, name: ''),
                bottomContainer(image: '', price: 50, name: ''),
                bottomContainer(image: '', price: 50, name: ''),
                bottomContainer(image: '', price: 50, name: ''),
              ],*/
            ),
          ),
        ],
      ),
    );
  }
}

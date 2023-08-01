import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:suppliment_ordering_application/models/cartModel.dart';
import 'package:suppliment_ordering_application/models/supplementModel.dart';

import '../models/categories_model.dart';
import '../models/proteinModel.dart';

class MyProvider extends ChangeNotifier {
  ///Whey protein
  List<CategoriesModel> wheyCategoriesList = [];

  late CategoriesModel wheyCategoriesModel;

  Future<void> getWheyCategories() async {
    List<CategoriesModel> newCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('wheyProtein')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        wheyCategoriesModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
        );
        print(wheyCategoriesModel.name);
        newCategoriesList.add(wheyCategoriesModel);
        wheyCategoriesList = newCategoriesList;
      },
    );
    notifyListeners();
  }

  get throwWheyList {
    return wheyCategoriesList;
  }

  ////Mass Protein
  List<CategoriesModel> massCategoriesList = [];

  late CategoriesModel massCategoriesModel;

  Future<void> getMassCategories() async {
    List<CategoriesModel> newMassCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('massProtein')
        .get();
    querySnapshot.docs.forEach((element) {
      massCategoriesModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(massCategoriesModel.name);
      newMassCategoriesList.add(massCategoriesModel);
      massCategoriesList = newMassCategoriesList;
    });
    notifyListeners();
  }

  get throwMassList {
    return massCategoriesList;
  }
  ///// Amino tablet

  List<CategoriesModel> aminoCategoriesList = [];

  late CategoriesModel aminoCategoriesModel;

  Future<void> getAminoCategories() async {
    List<CategoriesModel> newAminoCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('aminoTablet')
        .get();
    querySnapshot.docs.forEach((element) {
      aminoCategoriesModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(aminoCategoriesModel.name);
      newAminoCategoriesList.add(aminoCategoriesModel);
      aminoCategoriesList = newAminoCategoriesList;
    });
    notifyListeners();
  }

  get throwAminoList {
    return aminoCategoriesList;
  }

  ///// Fish oil

  List<CategoriesModel> fishCategoriesList = [];

  late CategoriesModel fishCategoriesModel;

  Future<void> getFishCategories() async {
    List<CategoriesModel> newFishCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('fishOils')
        .get();
    querySnapshot.docs.forEach((element) {
      fishCategoriesModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(fishCategoriesModel.name);
      newFishCategoriesList.add(fishCategoriesModel);
      fishCategoriesList = newFishCategoriesList;
    });
    notifyListeners();
  }

  get throwFishList {
    return fishCategoriesList;
  }

  ////// Creatien

  List<CategoriesModel> creatienCategoriesList = [];

  late CategoriesModel creatienCategoriesModel;

  Future<void> getCreatienCategories() async {
    List<CategoriesModel> newCreatienCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('createin')
        .get();
    querySnapshot.docs.forEach((element) {
      creatienCategoriesModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(creatienCategoriesModel.name);
      newCreatienCategoriesList.add(creatienCategoriesModel);
      creatienCategoriesList = newCreatienCategoriesList;
    });
    notifyListeners();
  }

  get throwCreatienList {
    return creatienCategoriesList;
  }

  //// Energy drinks

  List<CategoriesModel> energyCategoriesList = [];

  late CategoriesModel energyCategoriesModel;

  Future<void> getEnergyCategories() async {
    List<CategoriesModel> newEnergyCategoriesList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('yY4dMwPlIvjWfvXmwWyc')
        .collection('energyDrinks')
        .get();
    querySnapshot.docs.forEach((element) {
      energyCategoriesModel = CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(energyCategoriesModel.name);
      newEnergyCategoriesList.add(energyCategoriesModel);
      energyCategoriesList = newEnergyCategoriesList;
    });
    notifyListeners();
  }

  get throwEnergyList {
    return energyCategoriesList;
  }

  /// types provide

  List<ProteinModel> proteinModelList = [];
  late ProteinModel proteinModel;

  Future<void> getProteinList() async {
    List<ProteinModel> newProteinModelList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Proteins').get();
    querySnapshot.docs.forEach((element) {
      proteinModel = ProteinModel(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newProteinModelList.add(proteinModel);
    });
    proteinModelList = newProteinModelList;
    notifyListeners();
  }

  get throwProtienModelList {
    return proteinModelList;
  }

  ///////Whey list

  List<SupplementModel> wheyModelList = [];
  late SupplementModel supplementModel;
  Future<void> getWheyCategoriesList() async {
    List<SupplementModel> newWheyModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('wheyProtein')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        supplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newWheyModelList.add(supplementModel);
        wheyModelList = newWheyModelList;
      },
    );
  }

  get throwWhey {
    return wheyModelList;
  }

  ///////Mass list

  List<SupplementModel> massModelList = [];
  late SupplementModel massSupplementModel;
  Future<void> getMassCategoriesList() async {
    List<SupplementModel> newMassModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('massProtein')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        massSupplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newMassModelList.add(massSupplementModel);
        massModelList = newMassModelList;
      },
    );
  }

  get throwMass {
    return massModelList;
  }

  ///////amino list

  List<SupplementModel> aminoModelList = [];
  late SupplementModel aminoSupplementModel;
  Future<void> getAminoCategoriesList() async {
    List<SupplementModel> newAminoModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('aminoTablet')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        aminoSupplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newAminoModelList.add(aminoSupplementModel);
        aminoModelList = newAminoModelList;
      },
    );
  }

  get throwAmino {
    return aminoModelList;
  }

  List<SupplementModel> fishoilModelList = [];
  late SupplementModel fishoilSupplementModel;
  Future<void> getFishoilCategoriesList() async {
    List<SupplementModel> newFishoilModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('fishOils')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        fishoilSupplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newFishoilModelList.add(fishoilSupplementModel);
        fishoilModelList = newFishoilModelList;
      },
    );
  }

  get throwFishoil {
    return fishoilModelList;
  }

  List<SupplementModel> creatienModelList = [];
  late SupplementModel creatienSupplementModel;
  Future<void> getCreatienCategoriesList() async {
    List<SupplementModel> newCreatienModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('creatien')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        creatienSupplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newCreatienModelList.add(creatienSupplementModel);
        creatienModelList = newCreatienModelList;
      },
    );
  }

  get throwCreatien {
    return creatienModelList;
  }

  List<SupplementModel> energyModelList = [];
  late SupplementModel energySupplementModel;
  Future<void> getEnergyCategoriesList() async {
    List<SupplementModel> newEnergyModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('supplementCategories')
        .doc('lf8GaIzX3MXszOgUlKSs')
        .collection('energyDrinks')
        .get();
    querySnapshot.docs.forEach(
      (element) {
        energySupplementModel = SupplementModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],
        );
        newEnergyModelList.add(energySupplementModel);
        energyModelList = newEnergyModelList;
      },
    );
  }

  get throwEnergy {
    return energyModelList;
  }

  ///// cart add

  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];
  late CartModel cartModel;

  void addToCart({
    required String name,
    required String image,
    required int price,
    required int quantity,
  }) {
    cartModel = CartModel(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModel);
    cartList = newCartList;
  }

  get throeCartList {
    return cartList;
  }

  int totalPrice() {
    int total = 1;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  late int deleteIndex;
  void deleteItem(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}

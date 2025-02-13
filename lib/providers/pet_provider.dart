import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetProvider with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final List<Pet> _pets = [
    Pet(name: "Luna", age: 2, price: 120.0, image: "https://cf.ltkcdn.net/cats/cat-training-and-behavior/images/slide/339216-850x566-do-cats-remember-owners-1305529106.jpg"),
    Pet(name: "Bella", age: 3, price: 150.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Milo", age: 1, price: 100.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/323398-850x547-hamster-hand.jpg"),
    Pet(name: "Charlie", age: 4, price: 130.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Max", age: 5, price: 140.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Daisy", age: 2, price: 110.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Coco", age: 3, price: 115.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Lucy", age: 4, price: 125.0, image: "https://cf.ltkcdn.net/cats/cat-training-and-behavior/images/slide/339216-850x566-do-cats-remember-owners-1305529106.jpg"),
    Pet(name: "Leo", age: 1, price: 105.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Nala", age: 2, price: 120.0, image: "https://cf.ltkcdn.net/cats/cat-training-and-behavior/images/slide/339216-850x566-do-cats-remember-owners-1305529106.jpg"),
    Pet(name: "Rocky", age: 3, price: 135.0, image: "https://cf.ltkcdn.net/life-with-pets/find-your-pet/images/slide/342473-850x567-dog-lying-on-womans-lap-1357930308.jpg"),
    Pet(name: "Loki", age: 2, price: 145.0, image: "https://cf.ltkcdn.net/cats/cat-training-and-behavior/images/slide/339216-850x566-do-cats-remember-owners-1305529106.jpg"),
  ];

  List<Pet> _filteredPets = [];
  List<Pet> get filteredPets => _filteredPets;
  List<Pet> get pets => _filteredPets.isNotEmpty ? _filteredPets : _loadedPets;

  final List<Pet> _loadedPets = [];
  int _currentPage = 0;
  final int _itemsPerPage = 8;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PetProvider() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMorePets();
      }
    });
    loadMorePets(); 
  }

  void adoptPet(int index) {
    _pets[index].isAdopted = true;
    notifyListeners();
  }

  void loadMorePets() {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      int nextIndex = _currentPage * _itemsPerPage;
      if (nextIndex < _pets.length) {
        _loadedPets.addAll(
          _pets.skip(nextIndex).take(_itemsPerPage),
        );
        _currentPage++;
      }

      _isLoading = false;
      notifyListeners();
    });
  }

  void searchPets(String query) {
    if (query.isEmpty) {
      _filteredPets.clear();
    } else {
      _filteredPets = _pets
          .where((pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

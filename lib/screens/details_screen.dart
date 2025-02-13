import 'package:flutter/material.dart';
import 'package:pet_adoption_app/widgets/confetti_popup.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../models/pet_model.dart';

class DetailsScreen extends StatelessWidget {
  final Pet pet;
  final int index;

  const DetailsScreen({super.key, required this.pet, required this.index});

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(pet.name)),
      body: Column(
        children: [
          Hero(
            tag: 'pet-${pet.name}',
            child: Image.network(pet.image),
          ),
          Text(pet.name),
          Text('Age: ${pet.age} years'),
          Text('Price: \$${pet.price}'),
          ElevatedButton(
            onPressed: pet.isAdopted
                ? null
                : () {
                    petProvider.adoptPet(index);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfettiPopup(petName: pet.name);
                      },
                    );
                  },
            child: Text(pet.isAdopted ? 'Already Adopted' : 'Adopt Me'),
          ),
        ],
      ),
    );
  }
}

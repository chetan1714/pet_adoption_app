import 'package:flutter/material.dart';
import 'package:pet_adoption_app/widgets/pet_card.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adoptedPets = Provider.of<PetProvider>(context)
        .pets
        .where((pet) => pet.isAdopted)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Adoption History')),
      body: adoptedPets.isEmpty
          ? const Center(child: Text("No pets adopted yet!"))
          : ListView.builder(
              itemCount: adoptedPets.length,
              itemBuilder: (context, index) {
                final pet = adoptedPets[index];
                return PetCard(pet: pet, index: index);
              },
            ),
    );
  }
}

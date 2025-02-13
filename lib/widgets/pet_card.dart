import 'package:flutter/material.dart';
import '../models/pet_model.dart';
import '../screens/details_screen.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final int index;

  const PetCard({super.key, required this.pet, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Hero(
          tag: 'pet-${pet.name}',
          child: Image.network(
            pet.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          pet.name,
          style: TextStyle(
            decoration: pet.isAdopted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text('Age: ${pet.age} | Price: \$${pet.price}'),
        trailing: Icon(
          pet.isAdopted ? Icons.check_circle : Icons.pets,
          color: pet.isAdopted ? Colors.green : Colors.grey,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(pet: pet, index: index),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_adoption_app/providers/pet_provider.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Consumer<PetProvider>(
      builder: (context, petProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: petProvider.searchController,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: 'Search pets...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              suffixIcon: petProvider.searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        petProvider.searchController.clear();
                        onChanged('');
                      },
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}

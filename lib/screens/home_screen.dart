import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/history_screen.dart';
import 'package:pet_adoption_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption App'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoryScreen()));
              },
              child: const Text("History")),
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(
            onChanged: (query) => petProvider.searchPets(query),
          ),
          Expanded(
            child: ListView.builder(
              controller: petProvider.scrollController,
              itemCount:
                  petProvider.pets.length + (petProvider.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < petProvider.pets.length) {
                  return PetCard(pet: petProvider.pets[index], index: index);
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

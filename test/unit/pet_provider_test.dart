import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/providers/pet_provider.dart';

void main() {
  late PetProvider petProvider;

  setUp(() async {
  petProvider = PetProvider();
  await Future.delayed(const Duration(milliseconds: 500));
});

  test("Search should return filtered results", () {
    petProvider.searchPets("Luna");
    expect(petProvider.filteredPets.length, greaterThan(0));
  });
}

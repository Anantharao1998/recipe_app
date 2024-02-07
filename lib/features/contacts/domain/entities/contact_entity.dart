import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contact Item entity
class ContactItem extends ItemTileEntity {
  /// Contact Item entity
  const ContactItem({
    required super.name,
    this.age,
    this.location,
    this.occupation,
    this.occupationType,
    super.description,
  });

  /// Person's age
  final int? age;

  /// Person's location
  final String? location;

  /// Person's occupation
  final String? occupation;

  /// Person's occupation type
  final OccupationCategory? occupationType;
}

import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/contacts/contacts.dart';

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

  /// toJson()
  Map<String, dynamic> toJson() => <String, dynamic>{
        'age': age,
        'name': name,
        'location': location,
        'occupation': occupation,
        'occupationType': occupationType,
      };
}

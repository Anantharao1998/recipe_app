import 'package:json_annotation/json_annotation.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

part 'contact_item_model.g.dart';

/// Contact items model class
@JsonSerializable()
class ContactItemsModel extends ContactItem {
  /// Contact items model class
  const ContactItemsModel({required super.name});

  /// FromJson method for ContactItemsModel
  factory ContactItemsModel.fromJson(final Map<String, dynamic> json) => _$ContactItemsModelFromJson(json);

  /// ToJson method for ContactItemsModel
  Map<String, dynamic> toJson() => _$ContactItemsModelToJson(this);
}

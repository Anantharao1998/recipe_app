import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/contacts/contacts.dart';

/// Contact Remote DataSource
abstract class ContactRemoteDataSource {
  /// Adds contact to the firestore
  Future<void> addContact<ContactItemModel>(final Map<String, dynamic> json);

  /// Gets contact from the firestoree
  Future<List<ContactItemsModel>> getContact();
}

/// ContactRemoteDataSource implementation
class ContactRemoteDataSourceImpl extends ContactRemoteDataSource with BaseFireStoreServices {
  @override
  Future<void> addContact<ContactItemModel>(final Map<String, dynamic> json) async {
    await post(AppStrings.contactCollection, json);
  }

  @override
  Future<List<ContactItemsModel>> getContact() => get(AppStrings.contactCollection).then(
        (
          final QuerySnapshot<Map<String, dynamic>> value,
        ) =>
            value.docs
                .map(
                  (final QueryDocumentSnapshot<Map<String, dynamic>> e) => ContactItemsModel.fromJson(
                    e.data(),
                  ),
                )
                .toList(),
      );
}

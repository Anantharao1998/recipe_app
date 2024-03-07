import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts View controller
class ContactsController extends BaseController {
  /// Constructor class
  ContactsController({required this.repository});

  /// Contact age controller
  final TextEditingController ageController = TextEditingController();

  /// Communication controller
  final TextEditingController communicationController = TextEditingController();

  /// master list of contacts list
  List<ContactItem> contactsList = <ContactItem>[];

  /// Firebase instance
  final FirebaseFirestore db = FirebaseFirestore.instance;

  /// interest controller
  final TextEditingController interestController = TextEditingController();

  /// location controller
  final TextEditingController locationController = TextEditingController();

  /// Contact name controller
  final TextEditingController nameController = TextEditingController();

  /// Occupatiuon controller
  final TextEditingController occupationController = TextEditingController();

  /// Relationship controller
  final TextEditingController relationshipController = TextEditingController();

  /// Repository for contacts module
  final ContactRepository repository;

  ///  total contacts to be displayed in the contacts list page
  final int totalContacts = AppValues.int_100;

  /// get data
  Future<void> getData() async {
    setLoading();
    await repository.getContacts().onResponse(
      (final List<ContactItem> result) {
        contactsList = result;
      },
      (final Exception error) {},
    );

    setSuccess();
  }

  /// Adds contact to the list
  Future<void> addContact() async {
    await repository.addContact(
      ContactItem(
        name: nameController.text,
        age: int.tryParse(ageController.text),
        location: locationController.text,
        occupation: occupationController.text,
      ),
    );
  }
}

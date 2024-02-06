import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts listing page
class ContactsListing extends BaseView {
  /// Contacts listing page
  ContactsListing({super.key});

  /// Page controller
  final ContactsController controller = ContactsController();

  @override
  Widget body(final BuildContext context) => const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ItemTile(
              item: ContactItem(name: 'Anantha'),
            ),
          ],
        ),
      );

  @override
  Widget? floatingActionButton() => FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /// TODO: Add contact
        },
      );
}

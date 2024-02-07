import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts listing page
class ContactsListing extends BaseView<ContactsController> {
  /// Contacts listing page
  ContactsListing({super.key});

  @override
  Widget body(final BuildContext context, final ContactsController controller) => const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ItemTile(
              item: ContactItem(name: 'Anantha'),
            ),
          ],
        ),
      );

  @override
  Widget? floatingActionButton() => FloatingActionButton.extended(
        label: const Icon(
          Icons.person_add_alt,
        ),
        onPressed: () {},
      );
}

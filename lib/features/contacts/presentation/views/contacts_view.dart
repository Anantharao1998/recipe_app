import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts listing page
class ContactsListing extends BaseView<ContactsController> {
  /// Contacts listing page
  ContactsListing({super.key});

  @override
  Widget body(final BuildContext context, final ContactsController controller) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: AppValues.double_20,
            ),
            ...controller.contactsList.map<ItemTile>((final ContactItem e) => ItemTile(item: e)),
          ],
        ).listen<ContactsController, List<ContactItem>>(controller, controller.contactsList),
      );

  @override
  Widget? floatingActionButton(final ContactsController controller) => FloatingActionButton.extended(
        label: const Icon(
          Icons.person_add_alt,
        ),
        onPressed: () async {
          await controller.addContact();
        },
      );

  @override
  Future<void> onInit(final ContactsController provider, final BuildContext context) async {
    await provider.getData();
  }
}

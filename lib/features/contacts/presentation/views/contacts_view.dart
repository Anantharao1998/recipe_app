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
            SizedBox(
              height: AppValues.double_20,
            ),
            ItemTile(
              item: ContactItem(name: 'Anantha'),
            ),
          ],
        ),
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
    // TODO: implement onInit
    // ignore: use_build_context_synchronously
    super.onInit(provider, context);
  }
}

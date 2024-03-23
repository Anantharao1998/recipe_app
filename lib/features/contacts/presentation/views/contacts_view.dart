import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/contacts/contacts.dart';

/// Contacts listing page
class ContactsListing extends BaseView<ContactsController> {
  /// Contacts listing page
  ContactsListing({super.key});

  @override
  Widget body(final BuildContext context, final ContactsController controller) => SingleChildScrollView(
        child: Selector<ContactsController, List<ContactItem>>(
          builder: (final _, final List<ContactItem> value, final __) => Column(
            children: <Widget>[
              const SizedBox(
                height: AppValues.double_20,
              ),
              ...value.map<ItemTile>((final ContactItem e) => ItemTile(item: e)),
            ],
          ),
          selector: (final _, final ContactsController controller) => controller.contactsList,
        ),
      );

  @override
  Widget? floatingActionButton(final BuildContext context, final ContactsController controller) => FloatingActionButton.extended(
        label: const Icon(
          Icons.person_add_alt,
        ),
        onPressed: () async {
          await navigationService.navigateTo(Routes.addContacts);
        },
      );

  @override
  Future<void> onInit(final ContactsController provider, final BuildContext context) async {
    await provider.getData();
  }
}

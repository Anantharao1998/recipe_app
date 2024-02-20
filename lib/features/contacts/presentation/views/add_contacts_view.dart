import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Add Contacts View
class AddContactsView extends BaseView<ContactsController> {
  /// Add Contacts View
  AddContactsView({super.key});

  @override
  Widget body(final BuildContext context, final BaseController controller) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.double_10),
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: AppStrings.name,
                hintText: AppStrings.name,
              ),
            ],
          ),
        ),
      );
}

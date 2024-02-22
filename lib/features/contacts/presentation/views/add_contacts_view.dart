import 'package:flutter/services.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Add Contacts View
class AddContactsView extends BaseView<ContactsController> {
  /// Add Contacts View
  AddContactsView({super.key});

  @override
  String? appBarTitle() => AppStrings.addContactAppBarTitle;

  @override
  Widget body(final BuildContext context, final BaseController controller) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.double_10),
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: AppStrings.name,
                hintText: AppStrings.contactName,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))],
              ),
              CustomTextField(
                maxLength: 2,
                labelText: AppStrings.age,
                hintText: AppStrings.age,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                labelText: AppStrings.occupation,
                hintText: AppStrings.occupation,
              ),
              CustomTextField(
                labelText: AppStrings.location,
                hintText: AppStrings.location,
              ),
              CustomTextField(
                labelText: AppStrings.interest,
                hintText: AppStrings.interest,
                maxLines: 3,
              ),
            ],
          ),
        ),
      );
}

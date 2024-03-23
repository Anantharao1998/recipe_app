import 'package:flutter/services.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/contacts/contacts.dart';

/// Add Contacts View
class AddContactsView extends BaseView<ContactsController> {
  /// Add Contacts View
  AddContactsView({super.key});

  @override
  String? appBarTitle() => AppStrings.addContactAppBarTitle;

  @override
  Widget body(final BuildContext context, final ContactsController controller) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.double_10),
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: AppStrings.name,
                hintText: AppStrings.contactName,
                textEditingController: controller.nameController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-zA-Z ]'),
                  ),
                ],
              ),
              CustomTextField(
                labelText: AppStrings.age,
                hintText: AppStrings.age,
                textEditingController: controller.ageController,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                labelText: AppStrings.occupation,
                hintText: AppStrings.occupation,
                textEditingController: controller.occupationController,
              ),
              CustomTextField(
                labelText: AppStrings.relationship,
                hintText: AppStrings.relationship,
                textEditingController: controller.relationshipController,
              ),
              CustomTextField(
                labelText: AppStrings.location,
                hintText: AppStrings.location,
                textEditingController: controller.locationController,
              ),
              CustomTextField(
                labelText: AppStrings.interest,
                hintText: AppStrings.interest,
                textEditingController: controller.interestController,
              ),
              CustomTextField(
                labelText: AppStrings.meansOfCommunication,
                hintText: AppStrings.meansOfCommunication,
                textEditingController: controller.communicationController,
              ),
              const SizedBox(
                height: AppValues.double_50,
              ),
              SingleButton(
                buttonName: AppStrings.addContactAppBarTitle,
                onPressed: () async => controller.addContact(),
              ),
            ],
          ),
        ),
      );
}

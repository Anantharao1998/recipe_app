// ignore_for_file: always_specify_types, unnecessary_statements

import 'package:recipe_app/core/core.dart';
import 'package:shimmer/shimmer.dart';

/// Common DropDown widget
class CustomDropDown extends StatelessWidget {
  ///build dropdown that customize to with the design of our app
  const CustomDropDown({
    required this.context,
    required this.hintText,
    this.selectedText,
    this.labelText,
    this.modelBottomList,
    this.onValueSelected,
    this.isLoading = false,
    this.hasError = false,
    this.description,
    this.onCloseCallback,
    this.borderColor = AppColors.greyPrimary,
    this.onRetry,
    this.validator,
    this.hasBottomSpacing = true,
    this.isNotMandatory = false,
    this.isEnabled = true,
    this.hideTitle = false,
    this.customRadius,
    super.key,
  });

  ///function tha will return metadata when choose one of the [modelBottomList]
  // ignore: avoid_annotating_with_dynamic
  final Function(dynamic value, String? name)? onValueSelected;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  ///
  /// The returned value is exposed by the [FormFieldState.errorText] property.
  /// The [TextFormField] uses this to override the [InputDecoration.errorText]
  /// value.
  ///
  /// Alternating between error and normal state can cause the height of the
  /// [TextFormField] to change if no other subtext decoration is set on the
  /// field. To create a field whose height is fixed regardless of whether or
  /// not an error is displayed, either wrap the  [TextFormField] in a fixed
  /// height parent like [SizedBox], or set the [InputDecoration.helperText]
  /// parameter to a space.
  final String? Function(String? value)? validator;

  ///border color of [_buildDropdownField]
  final Color borderColor;

  ///to specify [CustomDropDown] build context
  final BuildContext context;

  /// Drop down button radius
  final double? customRadius;

  ///title in for the bottomSheet if want difference than [labelText]
  final String? description;

  /// false by default. If true, added spacing of 20 to the bottom of the textfield.
  final bool hasBottomSpacing;

  ///boolean will change state if value still loading from the api
  final bool hasError;

  /// Set to true to hide button title
  final bool hideTitle;

  /// Set to true to hide hint text
  final String hintText;

  /// set to false to disable the button
  final bool isEnabled;

  ///boolean will change state if value still loading from the api
  final bool isLoading;

  /// if isNotMandatory is true, it disables field validation
  final bool isNotMandatory;

  ///show value in top of dropdown and in the bottomSheet
  final String? labelText;

  ///list off value in the listview of dropdown
  final List<BottomSheetEntity>? modelBottomList;

  ///callback when user click close button
  final VoidCallback? onCloseCallback;

  /// Callback to pass onRetry function
  final VoidCallback? onRetry;

  ///to show hintText and value, add setter to change value in [onValueSelected]
  final String? selectedText;

  ///dropdown body field
  Widget _buildDropdownField() => RepaintBoundary(
        child: GestureDetector(
          onTap: () async => !isLoading
              ? isEnabled
                  ? await _showBottomSheet(context, labelText, modelBottomList)
                  : null
              : null,
          child: isLoading
              ? _buildLoadingWidget()
              : hasError && !isLoading
                  ? _buildErrorWidget()
                  : _buildDropdownText(),
        ),
      );

  InputBorder _enabledBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.greyPrimary,
        ),
        borderRadius: BorderRadius.circular(customRadius ?? AppValues.double_10),
      );

  InputBorder _errorBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.redPrimary,
        ),
        borderRadius: BorderRadius.circular(customRadius ?? AppValues.double_10),
      );

  InputBorder _focusedBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(customRadius ?? AppValues.double_10),
      );

  InputBorder _disabledBorder() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.greyPrimary,
        ),
        borderRadius: BorderRadius.circular(customRadius ?? AppValues.double_10),
      );

  Widget _buildDropdownText() => AbsorbPointer(
        child: DropdownButtonFormField(
          items: modelBottomList!
              .map(
                (final BottomSheetEntity e) => DropdownMenuItem(
                  value: e.name,
                  child: Text(e.name!, maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          validator: (final String? input) {
            /// If isNotMandatory is true, validation will be disabled
            if (isNotMandatory) {
              return null;
            }

            /// General validation for empty field
            if (input == null) {
              return AppStrings.generalFieldEmptyError;
            }

            final String? error = validator?.call(input);

            return error;
          },
          hint: Text(
            hintText,
            style: AppStyles.h6.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
          isExpanded: true,
          value: selectedText,
          style: AppStyles.h6,
          decoration: InputDecoration(
            enabled: isEnabled,
            filled: true,
            fillColor: isEnabled ? AppColors.whitePrimary : AppColors.greyPrimary,
            contentPadding: const EdgeInsets.symmetric(horizontal: AppValues.double_15),
            errorBorder: _errorBorder(),
            focusedBorder: _focusedBorder(),
            disabledBorder: _disabledBorder(),
            enabledBorder: _enabledBorder(),
          ),
          onChanged: (final String? value) {
            return;
          },
          icon: _buildDropdownIcon(),
        ),
      );

  ///build loading widget
  Widget _buildLoadingWidget() => Container(
        height: AppValues.double_45,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(AppValues.double_10),
          color: AppColors.whitePrimary,
        ),
        child: Shimmer.fromColors(
          baseColor: AppColors.greyPrimary,
          highlightColor: AppColors.greyPrimary,
          child: Container(
            decoration: const ShapeDecoration(shape: RoundedRectangleBorder(), color: Colors.white),
          ),
        ),
      );

  Widget _buildErrorWidget() => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              AppStrings.generalErrorMessage,
              maxLines: 2,
              style: AppStyles.h5.copyWith(color: AppColors.redPrimary),
            ),
            Flexible(
              child: InkWell(
                onTap: onRetry,
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: const Icon(
                    Icons.refresh,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  //to show bottomSheet
  Future<T?> _showBottomSheet<T>(
    final BuildContext context,
    final String? title,
    final List<BottomSheetEntity>? actions,
  ) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: AppColors.whitePrimary,
      constraints: BoxConstraints(maxHeight: deviceHeight / 2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (final BuildContext context) => _buildDropdownBody(actions),
    );
  }

  ///Body for bottomSheet
  Widget _buildDropdownBody(final List<BottomSheetEntity>? actions) => SafeArea(
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * AppValues.doublePoint45),
          decoration: const BoxDecoration(
            color: AppColors.whitePrimary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildTitle(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppValues.double_24,
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: actions!.length,
                    shrinkWrap: true,
                    itemBuilder: (final BuildContext context, final int index) => _buildModalListTile(
                      context,
                      actions[index].id,
                      actions[index].name,
                      actions[index].metaData,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  ///build label Title top of [_buildDropdownField]
  Widget _buildLabelTitle() => Text(
        labelText ?? '',
        style: AppStyles.h5,
      );

  ///build dropdown icon in [_buildDropdownField]
  Widget _buildDropdownIcon() => const Icon(Icons.arrow_drop_down);

  ///ListTile for the list of value in bottomSheet
  Widget _buildModalListTile(
    final BuildContext context,
    final int? id,
    final String? name,
    final metaData,
  ) =>
      InkWell(
        onTap: () {
          onValueSelected?.call(metaData, name);
          Navigator.of(context).pop();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: AppValues.double_10,
                top: AppValues.double_45,
              ),
              child: Text(
                name ?? '',
                style: AppStyles.h4,
              ),
            ),
            _buildDivider(),
          ],
        ),
      );

  ///Divider for the between list and title
  Widget _buildDivider() => const Divider(
        height: 1,
      );

  ///build title in the [_buildDropdownBody]
  Widget _buildTitle(final BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: AppValues.double_22, right: AppValues.double_16, top: AppValues.double_12),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * AppValues.doublePoint65,
                  child: Text(
                    description ?? (labelText ?? ''),
                    maxLines: 2,
                    style: AppStyles.h6,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    onValueSelected?.call(null, null);
                    Navigator.of(context).pop();
                    onCloseCallback;
                  },
                  child: Container(
                    height: AppValues.double_30,
                    width: AppValues.double_30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppValues.double_50,
                      ),
                      color: AppColors.whitePrimary,
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: AppColors.blackPrimary,
                      size: AppValues.double_20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppValues.double_10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onCloseCallback;
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: AppValues.double_6),
            child: hideTitle ? const SizedBox() : _buildLabelTitle(),
          ),
          _buildDropdownField(),
          if (hasBottomSpacing)
            const SizedBox(
              height: AppValues.double_20,
            ),
        ],
      );
}

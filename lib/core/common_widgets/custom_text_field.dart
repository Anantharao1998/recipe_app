import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemondb/core/core.dart';

/// Generic textfield for the app
class CustomTextField extends StatelessWidget {
  /// Generic textfield for the app

  CustomTextField({
    this.labelText,
    this.autoFocus = false,
    this.textEditingController,
    this.validator,
    this.focusNode,
    this.maxLength,
    this.onChanged,
    this.isEnabled = true,
    this.disabledBorderColor,
    this.maxLines = 1,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.onSubmit,
    this.errorText,
    this.hintText,
    this.hasBottomSpacing = false,
    this.hasLabelText = true,
    this.isPasswordField = false,
    this.isMobileField = false,
    this.isNotMandatory = false,
    this.suffixIcon,
    this.isSearchField = false,
    this.labelFontSize,
    super.key,
  });

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

  /// Callback on textfield value is changed.
  final Function(String value)? onChanged;

  ///Whether this text field should focus itself if nothing else is already focused.
  /// If true, the keyboard will open as soon as this text field obtains focus. Otherwise, the keyboard is only shown after the user taps the text field.
  final bool autoFocus;

  /// Border color of the textfield on disabled state
  final Color? disabledBorderColor;

  /// String to pass as error text
  final String? errorText;

  /// Pass [FocusNode] to the textfield.
  final FocusNode? focusNode;

  /// false by default. If true, added spacing of 20 to the bottom of the textfield.
  final bool hasBottomSpacing;

  /// true by default. Shows the label for the textfield.
  final bool hasLabelText;

  /// String to pass as hint text.
  final String? hintText;

  /// List of [TextInputFormatter]s to the textfield. null by default.
  final List<TextInputFormatter>? inputFormatters;

  /// Boolean to control if this textfield is enabled or disabled.
  final bool isEnabled;

  /// Set to true for the textfield to be mobile number exclusive field
  final bool isMobileField;

  /// if isNotMandatory is true, it disables field validation
  final bool isNotMandatory;

  /// Set to true if the textfield is a password exclusive field
  final bool isPasswordField;

  /// Set to true if this field used for search
  final bool isSearchField;

  /// Pass the [TextInputType] to the textfield.
  final TextInputType? keyboardType;

  /// Textfield label name. if [hasLabelText] is false, this value will not be used anywhere.
  final String? labelText;

  /// Max length of text value inside the textfield.
  final int? maxLength;

  /// Max line of text the textfield can allow
  final int? maxLines;

  /// Callback to be called on textfield submit
  final ValueChanged<String>? onSubmit;

  /// Pass a widget as suffix icon for the textfield
  final Widget? suffixIcon;

  /// Controls the text being edited.
  /// If null, this widget will create its own [TextEditingController] and initialize its [TextEditingController.text]..
  final TextEditingController? textEditingController;

  /// Handles the text input action
  final TextInputAction? textInputAction;

  /// Pass true to enable the obscuring to the textfield
  final ValueNotifier<bool> _isPasswordHidden = ValueNotifier<bool>(false);

  /// Font size for the text field label.
  final double? labelFontSize;

  InputBorder _enabledBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.greyPrimary,
        ),
        borderRadius: BorderRadius.circular(isSearchField ? AppValues.double_40 : AppValues.double_10),
      );

  InputBorder _errorBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.redPrimary,
        ),
        borderRadius: BorderRadius.circular(isSearchField ? AppValues.double_40 : AppValues.double_10),
      );

  InputBorder _focusedBorder() => OutlineInputBorder(
        gapPadding: AppValues.double_28,
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(isSearchField ? AppValues.double_40 : AppValues.double_10),
      );

  InputBorder _disabledBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: disabledBorderColor ?? AppColors.greyPrimary,
        ),
        borderRadius: BorderRadius.circular(isSearchField ? AppValues.double_40 : AppValues.double_10),
      );

  @override
  Widget build(final BuildContext context) {
    if (isPasswordField) {
      _isPasswordHidden.value = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText != null && hasLabelText)
          Container(
            margin: EdgeInsets.only(left: AppValues.double_3.h, bottom: AppValues.double_6.h),
            child: Text(
              labelText!,
              style: labelFontSize != null ? AppStyles.h5.copyWith(fontSize: labelFontSize!.sp) : AppStyles.h5,
            ),
          ),
        ValueListenableBuilder<bool>(
          valueListenable: _isPasswordHidden,
          builder: (final BuildContext context, final bool value, final Widget? child) => TextFormField(
            autofocus: autoFocus,
            controller: textEditingController,
            validator: (final String? input) {
              /// If isNotMandatory is true, validation will be disabled
              if (input!.isEmpty && isNotMandatory) {
                return null;
              }

              /// General validation for empty field
              if (input.isEmpty) {
                return AppStrings.generalFieldEmptyError;
              }

              final String? error = validator?.call(input);

              return error;
            },
            focusNode: focusNode,
            onChanged: onChanged,
            onTapOutside: (final PointerDownEvent event) {
              FocusScope.of(context).unfocus();
            },
            maxLength: maxLength,
            style: AppStyles.norm_5,
            enableSuggestions: false,
            autocorrect: false,
            maxLines: maxLines,
            inputFormatters: inputFormatters,
            obscureText: _isPasswordHidden.value && isPasswordField,
            obscuringCharacter: '●',
            textInputAction: textInputAction ?? TextInputAction.done,
            onFieldSubmitted: (final String text) {
              onSubmit?.call(text);
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
              enabled: isEnabled,
              errorMaxLines: 2,
              filled: true,
              prefixIconConstraints: const BoxConstraints(maxWidth: AppValues.double_64),
              prefixIcon: isMobileField
                  ? SizedBox(
                      width: AppValues.double_64.h,
                      height: AppValues.double_45.h,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '+60',
                            style: AppStyles.norm_5,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: AppColors.greyPrimary,
                          ),
                        ],
                      ),
                    )
                  : null,
              suffixIcon: isPasswordField
                  ? InkWell(
                      onTap: () {
                        _isPasswordHidden.value = !_isPasswordHidden.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17, right: 20, bottom: 14),
                        child: ImageView(
                          imagePath: _isPasswordHidden.value ? '' : '',
                        ),
                      ),
                    )
                  : suffixIcon,
              fillColor: isEnabled ? AppColors.whitePrimary : AppColors.greyPrimary,
              hintText: hintText,
              enabledBorder: _enabledBorder(),
              focusedBorder: _focusedBorder(),
              disabledBorder: _disabledBorder(),
              hintStyle: AppStyles.norm_5.copyWith(color: AppColors.greyPrimary),
              errorBorder: _errorBorder(),
              focusedErrorBorder: _focusedBorder(),
              counterStyle: const TextStyle(color: Colors.transparent),
              contentPadding: const EdgeInsets.only(
                left: AppValues.double_16,
                right: AppValues.double_16,
              ),
            ),
          ),
        ),
        if (hasBottomSpacing)
          SizedBox(
            height: AppValues.double_20.h,
          ),
      ],
    );
  }
}

import 'package:equatable/equatable.dart';

/// Bottom Sheet Entity for customDropdownField
class BottomSheetEntity extends Equatable {
  /// Constructor
  const BottomSheetEntity({this.id, this.name, this.metaData});

  /// Dropdown item ID
  final int? id;

  /// Dropdown item metadata
  final dynamic metaData;

  /// Dropdown item name
  final String? name;

  @override
  List<Object?> get props => <Object?>[id, name, metaData];
}

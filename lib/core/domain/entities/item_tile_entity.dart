import 'package:equatable/equatable.dart';
import 'package:pokemondb/core/core.dart';

/// Generic Item Tile Entity
class ItemTileEntity extends Equatable {
  /// Generic Item Tile Entity\
  const ItemTileEntity({required this.name, this.description, this.eventDate, this.state = ItemState.initial});

  /// Item subtitle.
  final String? description;

  /// Events date
  final DateTime? eventDate;

  /// Item title
  final String name;

  /// Item state
  final ItemState state;

  @override
  List<Object?> get props => <Object?>[name, description, state, eventDate];
}

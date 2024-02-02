import 'package:equatable/equatable.dart';
import 'package:pokemondb/core/core.dart';

/// Generic Item Tile Entity
class ItemTileEntity extends Equatable {
  /// Generic Item Tile Entity\
  const ItemTileEntity({required this.title, this.subtitle, this.state = ItemState.initial});

  /// Item state
  final ItemState state;

  /// Item subtitle.
  final String? subtitle;

  /// Item title
  final String title;

  @override
  List<Object?> get props => <Object?>[title, subtitle, state];
}

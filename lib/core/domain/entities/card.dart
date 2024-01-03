import 'package:equatable/equatable.dart';

/// Pokemon Card entity
class PokemonCard extends Equatable {
  /// Pokemon Card constructor
  const PokemonCard({this.id, this.name});

  /// Card ID
  final String? id;

  /// Pokemon name in the card
  final String? name;

  @override
  List<Object?> get props => <Object?>[id, name];
}

import 'package:json_annotation/json_annotation.dart';
import 'package:pokemondb/core/core.dart';

part 'pokemon_card_model.g.dart';

/// Pokemon Card Model class
@JsonSerializable()
class PokemonCardModel extends PokemonCard {
  /// Pokemon Card Model class
  const PokemonCardModel({super.id, super.name});

  /// Converts Map object to [PokemonCardModel] class
  factory PokemonCardModel.fromJson(final Map<String, dynamic> json) => _$PokemonCardModelFromJson(json);

  /// Converts [PokemonCardModel] class into Map
  Map<String, dynamic> toJson() => _$PokemonCardModelToJson(this);
}

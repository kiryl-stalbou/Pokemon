// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_short_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonShortEntity _$PokemonShortEntityFromJson(Map<String, dynamic> json) {
  return _PokemonShortEntity.fromJson(json);
}

/// @nodoc
mixin _$PokemonShortEntity {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$PokemonShortEntityImpl implements _PokemonShortEntity {
  const _$PokemonShortEntityImpl({required this.name, required this.id});

  factory _$PokemonShortEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonShortEntityImplFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'PokemonShortEntity(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonShortEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonShortEntityImplToJson(
      this,
    );
  }
}

abstract class _PokemonShortEntity implements PokemonShortEntity {
  const factory _PokemonShortEntity(
      {required final String name,
      required final String id}) = _$PokemonShortEntityImpl;

  factory _PokemonShortEntity.fromJson(Map<String, dynamic> json) =
      _$PokemonShortEntityImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
}

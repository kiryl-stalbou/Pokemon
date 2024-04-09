// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_long_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonLongEntity {
  String get id => throw _privateConstructorUsedError;
  num get weight => throw _privateConstructorUsedError;
  num get height => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  String get frontImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$PokemonLongEntityImpl implements _PokemonLongEntity {
  const _$PokemonLongEntityImpl(
      {required this.id,
      required this.weight,
      required this.height,
      required this.name,
      required final List<String> types,
      required this.frontImageUrl})
      : _types = types;

  @override
  final String id;
  @override
  final num weight;
  @override
  final num height;
  @override
  final String name;
  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final String frontImageUrl;

  @override
  String toString() {
    return 'PokemonLongEntity(id: $id, weight: $weight, height: $height, name: $name, types: $types, frontImageUrl: $frontImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonLongEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.frontImageUrl, frontImageUrl) ||
                other.frontImageUrl == frontImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, weight, height, name,
      const DeepCollectionEquality().hash(_types), frontImageUrl);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonLongEntityImplToJson(
      this,
    );
  }
}

abstract class _PokemonLongEntity implements PokemonLongEntity {
  const factory _PokemonLongEntity(
      {required final String id,
      required final num weight,
      required final num height,
      required final String name,
      required final List<String> types,
      required final String frontImageUrl}) = _$PokemonLongEntityImpl;

  @override
  String get id;
  @override
  num get weight;
  @override
  num get height;
  @override
  String get name;
  @override
  List<String> get types;
  @override
  String get frontImageUrl;
}

// Entity Class DDD

import 'package:equatable/equatable.dart';
import 'package:notes/app/shared/domain/Uuid.dart';

class Entity<T> extends Equatable {
  Entity({
    required T entityProps,
    UuidId? id,
  }) {
    this.id = id ?? UuidId();
    this.entityProps = entityProps;
  }

  late final UuidId id;
  late final T entityProps;

  @override
  List<Object> get props => [];
}

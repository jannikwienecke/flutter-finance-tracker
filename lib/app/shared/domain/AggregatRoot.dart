import 'package:notes/app/shared/domain/Entity.dart';
import 'package:notes/app/shared/domain/Uuid.dart';

abstract class AggregatRoot<T> extends Entity<T> {
  AggregatRoot({
    required super.entityProps,
    required super.id,
  }) : super();

  @override
  UuidId get id => super.id;
}

import 'package:notes/app/shared/domain/Entity.dart';
import 'package:notes/app/shared/domain/Uuid.dart';

class UserId extends Entity<dynamic> {
  UserId({
    required super.entityProps,
    super.id,
  }) : super();

  UserId create(UuidId id) {
    return UserId(
      id: id,
      entityProps: null,
    );
  }
}

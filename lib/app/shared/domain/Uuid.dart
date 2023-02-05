import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UuidId extends Equatable {
  UuidId({String? id}) {
    final uuid = const Uuid()..v1();

    this.id = id ?? uuid.v1();
  }
  late final String id;

  @override
  List<Object> get props => [id];
}

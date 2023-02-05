import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/app.dart';
import 'package:notes/bootstrap.dart';

void main() {
  bootstrap(() => const ProviderScope(child: App()));
}

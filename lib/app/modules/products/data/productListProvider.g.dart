// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productListProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$fetchProductsListHash() => r'0ee73f059001765e064832456b685caacf6276bb';

/// See also [fetchProductsList].
final fetchProductsListProvider = AutoDisposeFutureProvider<List<Product>>(
  fetchProductsList,
  name: r'fetchProductsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProductsListHash,
);
typedef FetchProductsListRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$searchProductsListHash() =>
    r'65b69472c922c8b56597ac72dab825fbc58275aa';

/// See also [searchProductsList].
class SearchProductsListProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  SearchProductsListProvider({
    required this.query,
  }) : super(
          (ref) => searchProductsList(
            ref,
            query: query,
          ),
          from: searchProductsListProvider,
          name: r'searchProductsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchProductsListHash,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchProductsListProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SearchProductsListRef = AutoDisposeFutureProviderRef<List<Product>>;

/// See also [searchProductsList].
final searchProductsListProvider = SearchProductsListFamily();

class SearchProductsListFamily extends Family<AsyncValue<List<Product>>> {
  SearchProductsListFamily();

  SearchProductsListProvider call({
    required String query,
  }) {
    return SearchProductsListProvider(
      query: query,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Product>> getProviderOverride(
    covariant SearchProductsListProvider provider,
  ) {
    return call(
      query: provider.query,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'searchProductsListProvider';
}

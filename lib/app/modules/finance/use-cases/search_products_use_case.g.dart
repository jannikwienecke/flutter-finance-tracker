// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_use_case.dart';

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

String _$searchProductsControllerHash() =>
    r'ce812b3bd4e8fdd2de2cc78e16b92eea0da445e3';

/// See also [searchProductsController].
class SearchProductsControllerProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  SearchProductsControllerProvider({
    required this.query,
  }) : super(
          (ref) => searchProductsController(
            ref,
            query: query,
          ),
          from: searchProductsControllerProvider,
          name: r'searchProductsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchProductsControllerHash,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchProductsControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SearchProductsControllerRef
    = AutoDisposeFutureProviderRef<List<Product>>;

/// See also [searchProductsController].
final searchProductsControllerProvider = SearchProductsControllerFamily();

class SearchProductsControllerFamily extends Family<AsyncValue<List<Product>>> {
  SearchProductsControllerFamily();

  SearchProductsControllerProvider call({
    required String query,
  }) {
    return SearchProductsControllerProvider(
      query: query,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Product>> getProviderOverride(
    covariant SearchProductsControllerProvider provider,
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
  String? get name => r'searchProductsControllerProvider';
}

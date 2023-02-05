// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:notes/app/config/constants/test_products.dart';
// import 'package:notes/app/modules/products/domain/product.dart';
// import 'package:notes/app/shared/utils/in_memory_store.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'app.g.dart';

// Future<void> delay(bool addDelay, [int milliseconds = 2000]) {
//   if (addDelay) {
//     return Future.delayed(Duration(milliseconds: milliseconds));
//   } else {
//     return Future.value();
//   }
// }

// class Note extends Equatable {
//   const Note({
//     required this.id,
//     required this.title,
//   });

//   final String title;
//   final String id;

//   @override
//   List<Object?> get props => [title, id];
// }

// List<Note> ktestNotes = [
//   const Note(
//     id: '1',
//     title: 'test1',
//   ),
//   const Note(
//     id: '2',
//     title: 'test2',
//   ),
//   const Note(
//     id: '3',
//     title: 'test3',
//   ),
//   const Note(
//     id: '4',
//     title: 'test4',
//   ),
// ];

// class FakeProductsRepository {
//   FakeProductsRepository({this.addDelay = true});
//   final bool addDelay;

//   /// Preload with the default list of products when the app starts
//   final _products = InMemoryStore<List<Product>>(List.from(kTestProducts));

//   List<Product> getProductsList() {
//     print('get products list');
//     return _products.value;
//   }

//   Product? getProduct(String id) {
//     print('get product');
//     return _getProduct(_products.value, id);
//   }

//   Future<List<Product>> fetchProductsList() async {
//     print('fetchProductsList...');
//     return Future.value(_products.value);
//   }

//   Stream<List<Product>> watchProductsList() {
//     return _products.stream;
//   }

//   Stream<Product?> watchProduct(String id) {
//     print('watch product');
//     return watchProductsList().map((products) => _getProduct(products, id));
//   }

//   /// Update product or add a new one
//   Future<void> setProduct(Product product) async {
//     print('ADD PRODUCT REVIEQ $product');

//     await delay(true, 2500);
//     final products = _products.value;
//     final index = products.indexWhere((p) => p.id == product.id);
//     if (index == -1) {
//       // if not found, add as a new product
//       products.add(product);
//     } else {
//       print('overwriting product');
//       // else, overwrite previous product
//       products[index] = product;
//     }
//     _products.value = products;
//   }

//   /// Search for products where the title contains the search query
//   Future<List<Product>> searchProducts(String query) async {
//     assert(
//       _products.value.length <= 100,
//       'Client-side search should only be performed if the number of products is small. '
//       'Consider doing server-side search for larger datasets.',
//     );
//     // Get all products
//     final productsList = await fetchProductsList();
//     // Match all products where the title contains the query
//     return productsList
//         .where(
//           (product) =>
//               product.title.toLowerCase().contains(query.toLowerCase()),
//         )
//         .toList();
//   }

//   static Product? _getProduct(List<Product> products, String id) {
//     print('get product');
//     try {
//       return products.firstWhere((product) => product.id == id);
//     } catch (e) {
//       return null;
//     }
//   }
// }

// class NotesRepo {
//   final _notes = InMemoryStore<List<Note>>(List.from(ktestNotes));

//   @override
//   Future<List<Note>> fetchNotes() async {
//     print('fetch notes');
//     return Future.value(_notes.value);
//   }

//   Stream<List<Note>> watchProductsList() {
//     return _notes.stream;
//   }

//   Future<void> addNote() async {
//     await delay(true);

//     print('add note');
//     // final notes = _notes.value;

//     // final note = Note(
//     //   id: (_notes.value.length + 1).toString(),
//     //   title: 'test',
//     // );

//     // notes.add(note);

//     _notes.value = [];
//     print('notes: ${_notes.value}');
//   }
// }

// class App extends ConsumerWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// @riverpod
// FakeProductsRepository productsRepository(ProductsRepositoryRef ref) {
//   // * Set addDelay to false for faster loading
//   return FakeProductsRepository(addDelay: false);
// }

// @riverpod
// Stream<List<Note>> notesRepo(NotesRepoRef ref) {
//   return NotesRepo().watchProductsList();
// }

// final productsListStreamProvider =
//     StreamProvider.autoDispose<List<Product>>((ref) {
//   final productsRepository = ref.watch(productsRepositoryProvider);
//   return productsRepository.watchProductsList();
// });

// final productsListProvider = FutureProvider.autoDispose<List<Product>>((ref) {
//   final productsRepository = ref.watch(productsRepositoryProvider);
//   return productsRepository.fetchProductsList();
// });

// // @riverpod
// // Future<List<Note>> notesRepoActions(NotesRepoActionRef ref) {
// //   return NotesRepo().();
// // }

// class State extends Equatable {
//   const State({
//     required this.showAll,
//     required this.isLoading,
//   });
//   final bool showAll;
//   final bool isLoading;
//   // final Product optimisic

//   @override
//   List<Object?> get props => [showAll, isLoading];

//   State copyWith({
//     bool? showAll,
//     bool? isLoading,
//   }) {
//     return State(
//       showAll: showAll ?? this.showAll,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }

// @riverpod
// class NotesScreenState extends _$NotesScreenState {
//   NotesScreenState() : super();

//   @override
//   State build() {
//     return const State(showAll: false, isLoading: false);
//   }

//   Future<void> addProduct({required String title, required String id}) async {
//     state = state.copyWith(isLoading: true);

//     await ref.watch(productsRepositoryProvider).setProduct(
//           Product(
//             id: id,
//             imageUrl: 'assets/products/piggy-blue.jpg',
//             title: title,
//             description: 'New One',
//             price: 12,
//             availableQuantity: 5,
//           ),
//         );
//     // ref.refresh(productsListProvider);

//     state = state.copyWith(isLoading: false);
//   }
// }

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(
//     BuildContext context,
//     WidgetRef ref,
//   ) {
//     final notes = ref.watch(productsListProvider);

//     print(notes.value?.length);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [NotesList(data: notes)],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(notesScreenStateProvider.notifier).addProduct(
//                 id: (notes.value!.length + 1).toString(),
//                 title: 'This is my greay new Product',
//               );
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class NotesList extends ConsumerWidget {
//   const NotesList({super.key, required this.data});

//   final AsyncValue<List<Product>> data;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notesState = ref.watch(notesScreenStateProvider);

//     return Flexible(
//       child: Column(
//         children: [
//           Flexible(
//             child: data.when(
//               data: (data) {
//                 final notes = [...data];

//                 return ListView.builder(
//                   itemCount:
//                       notesState.isLoading ? notes.length + 1 : notes.length,
//                   itemBuilder: (context, index) {
//                     if (notesState.isLoading && index == notes.length) {
//                       return const ListTile(
//                         title: Text('Loading...'),
//                       );
//                     }

//                     return ListTile(
//                       title: Text(notes[index].title),
//                     );
//                   },
//                 );
//               },
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (error, stack) => Text(error.toString()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/app/view/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,

      //   title: Text(
      //     'Hi, Jannik',
      //     style: TextStyle(
      //       fontSize: 14,
      //       color: Theme.of(context).colorScheme.onTertiaryContainer,
      //     ),
      //   ),
      //   // ignore: prefer_const_literals_to_create_immutables
      //   actions: [
      //     // user icon
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16),
      //       child: Text('AH'),
      //     )
      //   ],
      //   centerTitle: false,
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: -50,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
            Positioned(
              top: -50,
              left: 250,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //       bottom: 1,
            //       left: 12,
            //       right: 12,
            //       top: 15,
            //     ),
            //     child: Center(
            //       child: BlurryContainer(
            //         elevation: 12,
            //         width: double.infinity,
            //         height: 200,
            //         color: Theme.of(context)
            //             .colorScheme
            //             .onBackground
            //             .withOpacity(0.2),
            //         blur: 10,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const SizedBox(height: 20),
            //               Text(
            //                 "Today's Balance: 500.00",
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   color: Theme.of(context).colorScheme.onBackground,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              top: 20,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          // const Color(0x0025242a),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 180,
                        width: MediaQuery.of(context).size.width - 24,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                "Today's Balance: 500.00",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 250,
              child: Material(
                elevation: 36,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Container(
                      height: 300,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryContainer
                            .withOpacity(.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transactions',
                              style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                // search icon rounded border
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    size: 12,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                  child: Text(
                                    'Period',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                  child: Text(
                                    'Product',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                  child: Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text(
          'Add Expense',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        icon: const Icon(Icons.add_box_outlined),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

// // product_cubit.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping_app/Models/ProductItemModel.dart';

// class ProductState {
//   final ProductSize selectedSize;
//   final int selectedQuantity;

//   ProductState({required this.selectedSize, required this.selectedQuantity});

//   ProductState copyWith({ProductSize? selectedSize, int? selectedQuantity}) {
//     return ProductState(
//       selectedSize: selectedSize ?? this.selectedSize,
//       selectedQuantity: selectedQuantity ?? this.selectedQuantity,
//     );
//   }
// }

// class ProductCubit extends Cubit<ProductState> {
//   final ProductItemModel product;

//   ProductCubit(this.product)
//     : super(
//         ProductState(
//           selectedSize: product.availableSizes.first,
//           selectedQuantity: 1,
//         ),
//       );

//   void selectSize(ProductSize size) {
//     emit(state.copyWith(selectedSize: size));
//   }

//   void incrementQuantity() {
//     if (state.selectedQuantity < product.stockQuantity) {
//       emit(state.copyWith(selectedQuantity: state.selectedQuantity + 1));
//     }
//   }

//   void decrementQuantity() {
//     if (state.selectedQuantity > 1) {
//       emit(state.copyWith(selectedQuantity: state.selectedQuantity - 1));
//     }
//   }
// }
import 'package:shopping_app/Models/ProductItemModel.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final List<ProductItemModel> products;
  final String error;
  final ProductSize selectedSize;
  final int selectedQuantity;

  ProductState({
    this.products = const [],
    this.error = '',
    this.selectedSize = ProductSize.S,
    this.selectedQuantity = 1,
  });

  ProductState copyWith({
    List<ProductItemModel>? products,
    String? error,
    ProductSize? selectedSize,
    int? selectedQuantity,
  }) {
    return ProductState(
      products: products ?? this.products,
      error: error ?? this.error,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
    );
  }

  @override
  List<Object?> get props => [products, error, selectedSize, selectedQuantity];
}

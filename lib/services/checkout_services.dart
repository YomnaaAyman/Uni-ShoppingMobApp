import 'package:shopping_app/Models/PaymentModel.dart';
import 'package:shopping_app/services/firestorer_services.dart';
import 'package:shopping_app/utils/api_paths.dart';

abstract class CheckoutServices {
  Future<void> setCard(String userId, PaymentModel paymentCard);
  Future<List<PaymentModel>> fetchPaymentMethods(
    String userId, [
    bool chosen = false,
  ]);
  Future<PaymentModel> fetchSinglePaymentMethod(
    String userId,
    String paymentId,
  );
}

class CheckoutServicesImpl implements CheckoutServices {
  final firestoreServices = FirestoreServices.instance;

  @override
  Future<void> setCard(String userId, PaymentModel paymentCard) async =>
      await firestoreServices.setData(
        path: ApiPaths.paymentCard(userId, paymentCard.cvv),
        data: paymentCard.toMap(),
      );

  @override
  Future<List<PaymentModel>> fetchPaymentMethods(
    String userId, [
    bool chosen = false,
  ]) async {
    final paymentMethods = await firestoreServices.getCollection(
      path: ApiPaths.paymentCards(userId),
      builder: (data, documentId) => PaymentModel.fromMap(data),
      queryBuilder:
          chosen ? (query) => query.where('isChosen', isEqualTo: true) : null,
    );
    return paymentMethods;
  }

  @override
  Future<PaymentModel> fetchSinglePaymentMethod(
    String userId,
    String paymentId,
  ) async {
    final paymentMethod = await firestoreServices.getDocument(
      path: ApiPaths.paymentCard(userId, paymentId),
      builder: (data, documentId) => PaymentModel.fromMap(data),
    );
    return paymentMethod;
  }
}

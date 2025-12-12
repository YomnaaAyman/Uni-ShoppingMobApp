import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/Models/UserDataModel.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        UserModel userModel = UserModel(
          id: user.uid,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());

        emit(AuthSuccess(user: user));
      } else {
        emit(AuthFailure(error: "User creation failed"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(error: e.message ?? "Unknown error"));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    emit(AuthInitial());
  }

  User? get currentUser => _auth.currentUser;
}

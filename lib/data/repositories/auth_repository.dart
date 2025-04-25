
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ------------- SignUp with Email and password ------------- ///
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch(e){
      throw e;
    }
  }

  /// --------------- Login with email and password -------------- ///
  Future<User?> login(String email, String password) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch (e){
      throw e;
    }
  }

}
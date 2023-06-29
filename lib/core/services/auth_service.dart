import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStatusChange => _firebaseAuth.authStateChanges();

  Future signIn({
    required String email,
    required String password
}) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future createUser({
    required String email,
    required String password
  }) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async{
    await _firebaseAuth.signOut();
  }
}
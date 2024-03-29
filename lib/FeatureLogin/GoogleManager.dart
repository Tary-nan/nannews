/*
import 'package:rxdart/rxdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sprinkle/Manager.dart';

class LoginGoogleManager implements Manager {

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email','https://www.googleapis.com/auth/contacts.readonly']);

  final BehaviorSubject<GoogleSignInAccount> _google = BehaviorSubject<GoogleSignInAccount>();

  Stream<GoogleSignInAccount> get googleAccount => _google.stream;

  sigInGoogle() async {
    _googleSignIn.signIn().then((GoogleSignInAccount account) {
      _google.sink.add(account);
    });
  }
  signOutGoogle() async {
    _googleSignIn.signOut().then(_google.sink.add);
  }

  @override
  dispose() {
    _google.close();
  }
}

 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetrial/globalVariables.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;


Future<FirebaseUser> handleSignIn() async {
	final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
	final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

	final AuthCredential credential = GoogleAuthProvider.getCredential(
		accessToken: googleAuth.accessToken,
		idToken: googleAuth.idToken,
	);

	final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
	print("signed in " + user.displayName);
	return user;
}

Future<void> signOut() async{
	await FirebaseAuth.instance.signOut();

	loginUser = {
		'uid': '',
		'username': '',
		'photoUrl': '',
		'displayName': '',
		'email': ''
	};
	loginStatus = true;


	FirebaseAuth.instance.signOut();

}






//() {
//signOut();
//loginStatus = false;
//Navigator.of(context).pushNamed('/');
//}
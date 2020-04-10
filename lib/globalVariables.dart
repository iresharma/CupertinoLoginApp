
import 'package:http/src/response.dart';

class User {
	final String uid;
	final String photoUrl;
	final String displayName;
	final String email;

	User(this.uid, this.displayName, this.photoUrl, this.email);

	void set() {
		loginUser = {
			'uid': uid,
			'username': '',
			'photoUrl': photoUrl,
			'displayName': displayName,
			'email': email
		};
	}

}

class APIuser {
	final String photoUrl;
	final String displayName;
	final String email;
	final String username;

	APIuser(this.photoUrl, this.displayName, this.email, this.username);

	APIuser.fromJson(Map<String, dynamic> json)
		: displayName = json['name'],
			email = json['email'],
			photoUrl = json['photoUrl'],
			username = json['username'];



	void set() {
		loginUser = {
			'uid': '',
			'username': username,
			'photoUrl': photoUrl,
			'displayName': displayName,
			'email': email
		};
	}
}

bool loginStatus = false;
var loginUser = {
	'uid': '',
	'username': '',
	'photoUrl': '',
	'displayName': '',
	'email': ''
};

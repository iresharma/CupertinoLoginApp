
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

bool loginStatus = false;
var loginUser = {
	'uid': '',
	'username': '',
	'photoUrl': '',
	'displayName': '',
	'email': ''
};

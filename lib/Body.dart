import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'globalVariables.dart';

class loginform extends StatefulWidget {
	@override
	_loginformState createState() => _loginformState();
}

class _loginformState extends State<loginform> {
	final _formKey = GlobalKey<FormState>();

	final loginController = TextEditingController();
	final passwordController = TextEditingController();

	@override
	void initState() {
		super.initState();

	}

	@override
	void dispose() {
		// Clean up the controller when the widget is removed from the widget tree.
		// This also removes the _printLatestValue listener.
		passwordController.dispose();
		loginController.dispose();
		super.dispose();
	}



	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				children: <Widget>[
					Padding(
						padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
						child: Image.asset(
							"images/logo.jpg",
							width: 300,
							height: 200,
						),
					),
					Row(
						children: <Widget>[
							Padding(
								padding: EdgeInsets.fromLTRB(18.0, 20, 0, 0),
								child: Text(
									"Username",
									textAlign: TextAlign.left,
									style: TextStyle(
										color: Colors.black54,
									),
								),
							),
						],
					),
					Padding(
						padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
						child: CupertinoTextField(
							prefix: Padding(
								padding: EdgeInsets.all(0.8),
								child: Icon(
									CupertinoIcons.person
								),
							),
							controller: loginController,
							placeholder: "username",
							autofocus: true,
							clearButtonMode: OverlayVisibilityMode.editing,
						),
					),
					Row(
						children: <Widget>[
							Padding(
								padding: EdgeInsets.fromLTRB(18.0, 0, 0, 0),
								child: Text(
									"Password",
									textAlign: TextAlign.left,
									style: TextStyle(
										color: Colors.black54,
									),
								),
							),
						],
					),
					Padding(
						padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
						child: CupertinoTextField(
							prefix: Padding(
								padding: EdgeInsets.all(0.8),
								child: Icon(
									CupertinoIcons.padlock
								),
							),
							controller: passwordController,
							placeholder: "Password",
							obscureText: true,
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
						child:  Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								CupertinoButton(
									child: Text("Login"),
									onPressed: () {
										print('hello');
									},
									color: Color.fromRGBO(255, 203, 45, 1.0),
								),
								CupertinoButton(
									child: Text("Register"),
									onPressed: () {
										Navigator.of(context).pushNamed('/register');
									},
									color: Color.fromRGBO(14, 203, 45, 1.0),
								)
							],
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(0, 0.0, 18, 10.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: <Widget>[
								CupertinoButton(
									onPressed: () {
										print("hello");
									},
									child: Text(
										"Forgot password!?",
										style: TextStyle(
											fontSize: 15.0,
											fontWeight: FontWeight.w500,
										),
									),
								)
							],
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
						child: Center(
							child: Text(
								"Or",
								style: TextStyle(
									fontSize: 40,
									fontWeight: FontWeight.w200,
								),
							),
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
						child: CupertinoButton(
							child: Text("Use Google"),
							onPressed: () {
								handleSignIn().then((FirebaseUser user) {
									print(user);
									Navigator.of(context).pushNamed('/home');
								}). catchError((e) => print(e));
							},
							color: Colors.lightGreenAccent.shade50,
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
						child: CupertinoButton(
							child: Text("Use Facebook"),
							onPressed: () {
								print("Iresh");
							},
							color: Colors.lightGreenAccent.shade50,
						),
					)
				],
			),
		);
	}
}

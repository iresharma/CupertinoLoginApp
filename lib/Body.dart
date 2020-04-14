import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetrial/services/APICalls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'globalVariables.dart';
import 'dart:convert';

class loginform extends StatefulWidget {
	@override
	_loginformState createState() => _loginformState();
}

class _loginformState extends State<loginform> {
	final _formKey = GlobalKey<FormState>();

	final usernameController = TextEditingController();
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
		usernameController.dispose();
		super.dispose();
	}

	var incorrect = '';

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
							controller: usernameController,
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
										APIsignIn(usernameController.text, passwordController.text).then((user) {
											Map userMap = jsonDecode(user.body);
											var User = APIuser.fromJson(userMap);
											User.set();
											print(loginUser);
										});
//										print(loginUser);
									},
									color: Color.fromRGBO(103, 205, 125, 1.0),
								),
								CupertinoButton.filled(
									child: Text("Register"),
									onPressed: () {
										Navigator.of(context).pushNamed('/register');
									},
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
									User person = new User(user.uid, user.displayName, user.photoUrl, user.email);
									APIcheckGoogle(user.email).then( (user)  {
										if (user.body != "no") {
											print("works");
										}
										else {
											showCupertinoModalPopup(
												context: context,
												builder: (_) {
													return CupertinoPopupSurface(
														isSurfacePainted: true,
														child: Center(
															child: Column(
																mainAxisAlignment: MainAxisAlignment.start,
																children: <Widget>[
																	Padding(
																		padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
																		child: Image.asset(
																			"images/logo.png",
																			width: 300,
																			height: 200,
																		),
																	),
																	Text(
																		"Create your username",
																		style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
																	),
																	Padding(
																		padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
																		child: CupertinoTextField(
																			controller: usernameController,
																			prefix: Icon(CupertinoIcons.person),
																			clearButtonMode: OverlayVisibilityMode.editing,
																		),
																	),
																	Padding(
																		padding: EdgeInsets.fromLTRB(15, 50, 15, 15),
																		child: CupertinoButton.filled(
																			child: Text("Continue"),
																			onPressed: () {
																				APIcheckuser(usernameController.text).then((user) {
																					if(user.body == "no") {

																						loginUser['username'] = usernameController.text;
																						print(loginUser);
																						loginStatus = true;
																						APIdbput(loginUser).then((ret) => print(ret.body));
																						Navigator.of(context).pushNamed('/home');
																					}
																					else {
																						showCupertinoDialog(
																							context: context,
																							builder: (_) {
																								return CupertinoAlertDialog(
																									title: Column(
																										mainAxisAlignment: MainAxisAlignment.center,
																										children: <Widget>[
																											Text(
																											"Error",
																											style: TextStyle(
																												color: CupertinoColors.destructiveRed
																												),
																											),
																											Text("Username Taken")
																										],
																									),
																									actions: <Widget>[
																										CupertinoDialogAction(
																											child: Text('Close'),
																											onPressed: () {
																												loginUser['username'] = usernameController.text;
																												Navigator.of(context).pop();
																											}
																										)
																									],
																								);
																							},
																						);
																					}
																				},
																				);
																			}
																		),
																	)
																],
															),
														),
													);
										});
									}
								});
								person.set();
							}). catchError((e) => print(e));
							},
							color: Colors.lightGreenAccent.shade50,
						),
					),
				],
			),
		);
	}
}

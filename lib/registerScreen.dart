import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
	@override
	_RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

	final _formKeyReg = GlobalKey<FormState>();

	final scrollController = ScrollController();

	final fNameController = TextEditingController();
	final lNameController = TextEditingController();
	final emailController = TextEditingController();
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
		fNameController.dispose();
		lNameController.dispose();
		emailController.dispose();
		loginController.dispose();
		passwordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Register",
					style: TextStyle(
						fontWeight: FontWeight.w600
					),
				),
			),
			child: SingleChildScrollView(
				controller: scrollController,
				child: Form(
					key: _formKeyReg,
					child: Padding(
						padding: EdgeInsets.fromLTRB(15.0, 108.0, 15.0, 0),
						child: Column(
							children: <Widget>[
								Padding(
									padding: EdgeInsets.fromLTRB(3, 0, 0, 50),
									child: Text("Fill in to register",
										style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
									),
								),
								Padding(
									padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
									child: Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: <Widget>[
											Padding(
												padding: EdgeInsets.fromLTRB(3, 0, 0, 3),
												child: Container(
													child: Text("First name",
														textAlign: TextAlign.left,
														style: TextStyle(
															color: Colors.black54,
															fontSize: 14,
															fontWeight: FontWeight.w600
														),
													),
													width: 175.0,
												),
											),
											Padding(
												padding: EdgeInsets.fromLTRB(3, 0, 0, 3),
												child: Container(
													child: Text("Last name",
														textAlign: TextAlign.left,
														style: TextStyle(
															color: Colors.black54,
															fontSize: 14,
															fontWeight: FontWeight.w600
														),
													),
													width: 175.0,
												),
											)
										],
									),
								),
								Padding(
									padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
									child: Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: <Widget>[
											Padding(
												padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
												child: Container(
													child: CupertinoTextField(
														controller: fNameController,
														placeholder: "First Name",
													),
													width: 175.0,
												),
											),
											Padding(
												padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
												child: Container(
													child: CupertinoTextField(
														controller: lNameController,
														placeholder: "Last Name",
													),
													width: 175.0,
												)
											)
										],
									),
								),
								Padding(
									padding: EdgeInsets.fromLTRB(10, 0, 10, 16),
									child: Column(
										children: <Widget>[
											Row(
												children: <Widget>[ Text("Email",
													textAlign: TextAlign.left,
													style: TextStyle(
														color: Colors.black54,
														fontSize: 14,
														fontWeight: FontWeight.w600
													),
												),
												]
											),
											Padding(
												padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
												child: CupertinoTextField(
													prefix: Padding(
														padding: EdgeInsets.all(0.8),
														child: Icon(
															CupertinoIcons.mail
														),
													),
													controller: emailController,
													enableSuggestions: true,
												),
											),
											Padding(
												padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
												child: Column(
													children: <Widget>[
														Row(
															children: <Widget>[ Text("DOB",
																textAlign: TextAlign.left,
																style: TextStyle(
																	color: Colors.black54,
																	fontSize: 14,
																	fontWeight: FontWeight.w600
																),
															),
															]
														),
														Container(
															width: 300,
															child: Padding(
																padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
																child: CupertinoButton.filled(
																	onPressed: () {
																		showCupertinoDialog(
																			context: context,
																			builder: (context) => CupertinoAlertDialog(
																				title: Text("Pick DOB"),
																				actions: <Widget>[
																					Column(
																						mainAxisAlignment: MainAxisAlignment.center,
																						children: <Widget>[
																							SizedBox(
																								height: 300,
																								child: CupertinoDatePicker(
																									mode: CupertinoDatePickerMode.date,
																									onDateTimeChanged: (date) {
																										print(date);
																									},
																								),
																							),
																							CupertinoDialogAction(
																								child: Text('Close'),
																								onPressed: () => Navigator.pop(context)
																							)
																						],
																					)
																				],
																			));
																	},
																	child: Row(
																		mainAxisAlignment: MainAxisAlignment.center,
																		children: <Widget>[
																			Padding(
																				padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
																				child: Icon(CupertinoIcons.pencil),
																			),
																			Text("Pick DOB")
																		],
																	),
																),
															),
														),
													],
												),
											),
											Padding(
												padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
												child: Column(
													children: <Widget>[
														Row(
															children: <Widget>[
																Text("Gender",
																	textAlign: TextAlign.left,
																	style: TextStyle(
																		color: Colors.black54,
																		fontSize: 14,
																		fontWeight: FontWeight.w600
																	),
																),
															]
														),
														Container(
															width: 300,
															child: CupertinoButton.filled(
																child: Row(
																	mainAxisAlignment: MainAxisAlignment.center,
																	children: <Widget>[
																		Padding(
																			padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
																			child: Icon(CupertinoIcons.pencil),
																		),
																		Text("Pick Gender")
																	],
																),
																onPressed: () {
																	showCupertinoModalPopup(
																		context: context,
																		builder: (context) => CupertinoActionSheet(
																			title: Text("Select Gender"),
																			actions: <Widget>[
																				CupertinoActionSheetAction(
																					child: Text("Male"),
																					onPressed: () {
																						print("Male");
																					},
																				),
																				CupertinoActionSheetAction(
																					child: Text("Female"),
																					onPressed: () {
																						print("Male");
																					},
																				),
																				CupertinoActionSheetAction(
																					child: Text("Non-Binary"),
																					onPressed: () {
																						print("Male");
																					},
																				),
																				CupertinoActionSheetAction(
																					child: Text("Rather not Mention"),
																					onPressed: () {
																						print("Male");
																					},
																				)
																			],
																			cancelButton: CupertinoActionSheetAction(
																				child:Text("Cancel"),
																				onPressed: () {
																					print("Cancel");
																					Navigator.pop(context);
																				},
																			),
																		)
																	);
																}
															),
														),
													],
												),
											),
											Row(
												children: <Widget>[
													Padding(
														padding: EdgeInsets.fromLTRB(0.0, 10, 0, 0),
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
												padding: EdgeInsets.fromLTRB(0.0, 0, 0, 15.0),
												child: CupertinoTextField(
													prefix: Padding(
														padding: EdgeInsets.all(0.8),
														child: Icon(
															CupertinoIcons.person
														),
													),
													controller: loginController,
													placeholder: "username",
													clearButtonMode: OverlayVisibilityMode.editing,
												),
											),
											Row(
												children: <Widget>[
													Padding(
														padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
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
												padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
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
										],
									),
								),
								Container(
									width: 350.0,
									child: CupertinoButton(
										onPressed: () => Navigator.of(context).pushNamed('/screen'),
										child: Text("register"),
									),
								)
							],
						),
					),
				),
			),
		);
	}
}



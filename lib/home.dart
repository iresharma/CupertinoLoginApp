import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'globalVariables.dart';
import 'services/APICalls.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	Future<http.Response> body = test();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
		navigationBar: CupertinoNavigationBar(
			leading: Image.asset(
				"images/logo.jpg",
				width: 90,
				height: 90,
			),
			trailing: CupertinoButton(
				child: Padding(
					padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
					child: Icon(CupertinoIcons.settings,
						size: 30.0,
					),
				),
				onPressed: () => print('settings'),
			),
		),
		child: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						"Home Page",
						style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
					),
					CupertinoButton.filled(
						child: Text("Sign Out"),
						onPressed: () => signOut(),
					)
				],
			)
		),
	);
  }
}

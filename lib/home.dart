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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
		navigationBar: CupertinoNavigationBar(
			leading: Image.asset(
				"images/logo.jpg",
			),
			trailing: GestureDetector(
				child: Padding(
					padding: EdgeInsets.all(0),
					child: CircleAvatar(
						radius: 25,
						backgroundImage: NetworkImage(loginUser['photoUrl']),
					),
				),
				onTap: () => print("Face"),
				onLongPress: () => print("long face"),
			)
		),
		child: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						"Home Page",
						style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
					)
				],
			)
		),
	);
  }
}

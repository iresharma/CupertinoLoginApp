import 'package:flutter/cupertino.dart';
import 'services/auth.dart';
import 'globalVariables.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
		navigationBar: CupertinoNavigationBar(
			middle: Image.asset("images/logo.jpg"),
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
						onPressed: () {
	  						signOut();
	  						loginStatus = false;
	  						Navigator.of(context).pushNamed('/');
	  					}
					)
				],
			)
		),
	);
  }
}

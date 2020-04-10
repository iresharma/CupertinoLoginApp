import 'package:flutter/cupertino.dart';

import 'Body.dart';
import 'registerScreen.dart';
import 'home.dart';
import 'globalVariables.dart';

class RouteGenerator {
	static Route<dynamic> generateRoute(RouteSettings settings) {
		final args = settings.arguments;

		switch (settings.name) {
			case '/' :
				if(loginStatus) {
					return CupertinoPageRoute(
						builder: (_) => Home()
					)				;
				}
				else {
					return CupertinoPageRoute(
						builder: (_) => loginScreen()
					);
				}
				break;
			case '/register' :
				return CupertinoPageRoute(
					builder: (_) => RegisterScreen()
				);
			case '/home' :
				return CupertinoPageRoute(
					builder: (_) => Home()
				);
			default:
				return CupertinoPageRoute(
					builder: (context) {
						return CupertinoPageScaffold(
							navigationBar: CupertinoNavigationBar(
								middle: Text("Wrong Place"),
							),
							child: Center(
								child: Text(
									"Error 404",
									style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
								),
							),
						);
					}
				);
		}
	}
}

class loginScreen extends StatelessWidget {

	final _scrollController = ScrollController();


	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Login"),
			),
			child: SingleChildScrollView(
				controller: _scrollController,
				child: Padding(
					padding: EdgeInsets.fromLTRB(0.0, 88.0, 0.0, 0.0),
					child: loginform(),
				),
			)
		);
	}
}





// Navigator.of(context).pushNamed('/home', arguments: 'name');d
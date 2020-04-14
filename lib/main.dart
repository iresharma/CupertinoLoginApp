import 'package:flutter/cupertino.dart';
import 'routes.dart';



void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Color.fromRGBO(0, 210, 177, 1),
      ),
      title: "Trying things",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

}
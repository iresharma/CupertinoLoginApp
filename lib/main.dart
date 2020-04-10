import 'package:flutter/cupertino.dart';
import 'routes.dart';



void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Trying things",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

}
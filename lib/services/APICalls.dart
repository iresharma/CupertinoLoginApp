import 'package:http/http.dart' as http;

Future<http.Response> APIsignIn(user, password) {
	
	Future<http.Response> response = http.post("https://socio-flutter-app-api.herokuapp.com/api/v1/"+ user + "/" + password);
	print(response);
	return response;

}
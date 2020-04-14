import 'package:http/http.dart' as http;

Future<http.Response> APIsignIn(user, password) {
	
	Future<http.Response> response = http.post("https://socio-flutter-app-api.herokuapp.com/api/v1/"+ user + "/" + password);
	print(response);
	return response;

}

Future<http.Response> APIcheckGoogle(email) {

	Future<http.Response> response = http.get("https://socio-flutter-app-api.herokuapp.com/api/v1/google/"+email);
	print(response);
	return response;

}


Future<http.Response> APIdbput(Map<String, String> user) {

	Future<http.Response> response = http.put("https://socio-flutter-app-api.herokuapp.com/api/v1/db", body: user);
	return response;
}

Future<http.Response> APIcheckuser(String user) {
	
	Future<http.Response> reponse = http.get("https://socio-flutter-app-api.herokuapp.com/api/v1/google/username/" + user);
	return reponse;
}
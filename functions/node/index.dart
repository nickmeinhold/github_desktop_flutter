import 'package:firebase_functions_interop/firebase_functions_interop.dart';

void main() {
  functions['helloWorld'] = functions.https.onRequest(helloWorld);
}

void helloWorld(ExpressHttpRequest request) {
  request.response.writeln('Hello world');
  request.response.close();
}

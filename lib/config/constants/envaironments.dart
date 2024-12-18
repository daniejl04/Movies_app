
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Envaironment {
  static Future<void>  initEnvaironments() async{
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl = dotenv.env['API_URL'] ?? 'No se encontro url';
}



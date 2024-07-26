import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

/* Peticion HTTP usando DIO */
class GetYesNoAnswer{
  final _dio = Dio();
  Future<Message> getAnswer() async{
    final response = await _dio.get('https://yesno.wtf/api');
    /* Con dio se hace la peticion y en response.data se tiene un mapa */

    /* Ejemplo de mapa */
    /* Map<String,Dynamic> data = {
      'answer':'yes',
      'forced':'true',
      'image' : 'http\\imagen'
    }*/

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMesageEntity();
  }
}
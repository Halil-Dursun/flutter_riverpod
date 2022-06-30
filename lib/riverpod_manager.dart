import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpood_lesson/inc_counter.dart';
import 'package:riverpood_lesson/web_service.dart';

final merhabaMesaji = Provider((ref) => 'Merhaba Dunya mesajiii....');
final counterProvider = ChangeNotifierProvider((ref) => IncremenetCounter());
final httpClient = Provider((ref) => WebService());
final responseProvider = FutureProvider<String>((ref) async {
  final http = ref.watch<WebService>(httpClient);
  return http.fakeHttpData();
});

final getDataProvider = FutureProvider.family<ResponseModel,String>((ref,apiUrl)async{
  var client = ref.read(httpClient);
  ResponseModel resultData = await client.getData(apiUrl) as ResponseModel;
  return resultData;
});
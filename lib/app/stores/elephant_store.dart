import 'package:dio/dio.dart';
import 'package:elapphant/app/consts/consts.dart';
import 'package:elapphant/app/models/elephant.dart';
import 'package:mobx/mobx.dart';
part 'elephant_store.g.dart';

class ElephantStore = _ElephantStoreBase with _$ElephantStore;

abstract class _ElephantStoreBase with Store {
  @observable
  Elephant _elephant;

  @computed
  Elephant get elephant => _elephant;

  @action
  getNewElephant() {
    _elephant = null;
    loadElephant().then((elephant) {
      _elephant = elephant;
    });
  }

  Future<Elephant> loadElephant() async {
    try {
      Response response = await Dio().get(
        Consts.elephantURL,
      );

      var teste = (response.data as List)
          .map((e) => Elephant.fromJson(e))
          .toList()
          .first;

      return teste;
    } catch (error, stacktrace) {
      print("Erro ao carregar elefante" + stacktrace.toString());
      return null;
    }
  }
}

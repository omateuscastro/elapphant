import 'package:elapphant/app/models/elephant.dart';
import 'package:mobx/mobx.dart';
part 'elephant_store.g.dart';

class ElephantStore = _ElephantStoreBase with _$ElephantStore;

abstract class _ElephantStoreBase with Store {
  @observable
  Elephant _elephant;
}

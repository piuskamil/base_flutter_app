import 'package:baseflutterapp/logic/core/domain/base_presenter.dart';
import 'package:injectable/injectable.dart';

abstract class MapScreenView {}

@injectable
class MapScreenPresenter
    extends BasePresenter<MapScreenView> {


  MapScreenPresenter();

  void init() {}


}

import 'package:meta/meta.dart';

typedef ViewAction<View> = void Function(View v);
typedef AsyncViewAction<View> = Future Function(View v);

class BasePresenter<View> {
  View _view;

  void onViewReady(View view) {
    this._view = view;
  }

  @protected
  void execOnView(ViewAction<View> action) {
    if (this._view == null) throw Exception("View is not initialized yet");
    action(this._view);
  }

  @protected
  Future<T> asyncExecOnView<T>(AsyncViewAction<View> action) async{
    if (this._view == null) throw Exception("View is not initialized yet");
    return action(this._view);
  }
}

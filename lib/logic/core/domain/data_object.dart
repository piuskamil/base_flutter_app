import 'errors.dart';
import 'failure.dart';

class DataObject<M extends Failure, T> {

  final T data;
  final Failure failure;

  DataObject({
    this.failure,
    this.data,
  });

  factory DataObject.failure(Failure failure) {
    return DataObject(
      failure: failure,
    );
  }
  factory DataObject.data([T data]) {
    return DataObject(
      data: data,
    );
  }

  T getOrElse(T value) {
    if (this.data == null) {
      return value;
    }

    return this.data;
  }

  bool isFailure() {
    return failure != null;
  }

  T getOrCrash() {
    if (this.data == null) {
      throw UnexpectedValueError();
    }
    return this.data;
  }




}

abstract class DataState<T> {
  final T? data;
  final Exception? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({super.data});
}

class DataErr<T> extends DataState<T> {
  const DataErr({super.error});
}

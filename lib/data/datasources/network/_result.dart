import 'package:template/data/enum/_status.dart';

class Result<T> {
  Status status;
  T? data;
  String message;
  Exception? e;

  Result(this.status, this.data, this.e, this.message);

  static Result success<T>(T data) => Result(Status.SUCCESS, data, null, "");

  static Result<T> error<T>( String message, Exception e) =>
      Result(Status.ERROR, null, e, message);
}
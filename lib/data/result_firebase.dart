sealed class FireBaseResult<R> {}

class Succes<R> extends FireBaseResult<R> {
  Succes(this.data);
  R data;
}

class Erorr<R> extends FireBaseResult<R> {
  Erorr(this.erorr);
  String erorr;
}

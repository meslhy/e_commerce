class Failuer{
  String errorMessage;
  Failuer(this.errorMessage);
}

class NetworkFailuer extends Failuer{
  NetworkFailuer(super.errorMessage);

}
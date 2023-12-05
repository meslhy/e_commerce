abstract class BaseRequestStates {}

class BaseRequestInitialState extends BaseRequestStates {}

class BaseRequestLoadingState extends BaseRequestStates {}

class BaseRequestSuccessState<type> extends BaseRequestStates {
  type? data;
  BaseRequestSuccessState({this.data});
}

class BaseRequestErrorState extends BaseRequestStates {
  String message;
  BaseRequestErrorState(this.message);
}
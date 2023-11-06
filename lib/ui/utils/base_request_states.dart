abstract class BaseRequestStates {}

class BaseRequestInitialState extends BaseRequestStates {}

class BaseRequestLoadingState extends BaseRequestStates {}

class BaseRequestSuccessState extends BaseRequestStates {}

class BaseRequestErrorState extends BaseRequestStates {
  String message;
  BaseRequestErrorState(this.message);
}
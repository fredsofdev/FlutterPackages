part of mini_mapp_manager;

abstract class PadManager {
  List<Destination> getAllDestinations();
  void selectTargetDestination(Pad destination);
  void setCurrentPad(Pad current);
  void cancelRoute();
}

class SamplePadManager implements PadManager {
  @override
  void cancelRoute() {
    // TODO: implement cancelRoute
  }

  @override
  List<Destination> getAllDestinations() {
    // TODO: implement getAllDestinations
    throw UnimplementedError();
  }

  @override
  void selectTargetDestination(Pad destination) {
    // TODO: implement selectTargetDestination
  }

  @override
  void setCurrentPad(Pad current) {
    // TODO: implement setCurrentPad
  }
}

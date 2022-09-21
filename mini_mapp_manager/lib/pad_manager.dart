part of mini_mapp_manager;

abstract class PadManager {
  List<Pad> getAllDestinations();
  void selectTargetDestination(Pad destination);
  void setCurrentPad(Pad current);
  void cancelRoute();
}

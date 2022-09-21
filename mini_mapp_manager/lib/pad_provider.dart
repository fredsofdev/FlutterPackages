part of mini_mapp_manager;

abstract class PadProvider {
  List<Pad> getCurrentPads();
}

class FakePadProvider implements PadProvider {
  @override
  List<Pad> getCurrentPads() {
    return List.empty();
  }
}

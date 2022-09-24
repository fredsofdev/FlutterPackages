part of mini_mapp_manager;

abstract class PadManager {
  List<Destination> getAllDestinations();
  void selectTargetDestination(Destination destination);
  void setStartingPad(Pad start);
  void cancelRoute();
}

class SamplePadManager implements PadManager {
  final PadProvider padProvider;

  late List<Pad> allPads;
  List<Pad> route = <Pad>[];
  Pad currentPas = Pad.empty();
  Pad targetPad = Pad.empty();

  SamplePadManager(this.padProvider) {
    allPads = padProvider.getCurrentPads();
  }

  @override
  void cancelRoute() {
    route.clear();
    currentPas = Pad.empty();
    targetPad = Pad.empty();
  }

  @override
  List<Destination> getAllDestinations() {
    List<Destination> list = <Destination>[];
    for (var element in allPads) {
      list.addAll(element.getDestination());
    }
    return list;
  }

  @override
  void selectTargetDestination(Destination destination) {
    var targetPads = allPads.where((e) => e.dest.contains(destination.desc));
    if (targetPads.isEmpty) return;
    targetPad = targetPads.first;
  }

  @override
  void setStartingPad(Pad start) {
    currentPas = start;
    var rawQueue = getQueue(start);
    var reversQ = rawQueue.reversed.toList();
    var startIndex = reversQ.indexOf(targetPad);
    reversQ = reversQ.getRange(startIndex, reversQ.length - 1).toList();
    Pad currentPad = reversQ.first;
    var reverceRout = <Pad>[currentPad];
    while (currentPad != reversQ.last) {
      var allNaPad = currentPad.link.values
          .map((e) => reversQ.singleWhere((element) =>
              element.current == int.parse(e) &&
              !reverceRout.contains(element)))
          .toList();
      var indexList = allNaPad.map((e) => reversQ.indexOf(e)).toList();
      indexList.sort((a, b) => a.compareTo(b));
      var nextIndex = indexList.last;
      currentPad = reversQ[nextIndex];
      reverceRout.add(currentPad);
    }
    route = reverceRout.reversed.toList();
  }

  List<Pad> getQueue(Pad start) {
    List<Pad> totalPads = allPads;
    totalPads.removeWhere((element) => element == start);
    List<Pad> padQue = <Pad>[start];
    List<Pad> curList = <Pad>[start];
    List<Pad> storeList = <Pad>[];
    while (totalPads.isNotEmpty) {
      for (var pad in curList) {
        var tags = pad.link.values
            .toList()
            .map((e) => allPads
                .singleWhere((element) => element.current == int.parse(e)))
            .toList();
        for (var element in padQue) {
          tags.removeWhere((element2) => element2.current == element.current);
        }
        storeList.addAll(tags);
      }
      for (var element in storeList) {
        totalPads.removeWhere((element2) => element2 == element);
      }
      padQue.addAll(storeList);
      curList.clear();
      curList.addAll(storeList);
      storeList.clear();
    }
    return padQue;
  }
}

enum Orientation { unknown, correct, incorrect }

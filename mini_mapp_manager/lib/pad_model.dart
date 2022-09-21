part of mini_mapp_manager;

class Pad extends Equatable {
  final int current;
  final String front;
  final String back;
  final String left;
  final String right;

  const Pad(
      {required this.current,
      required this.front,
      required this.back,
      required this.left,
      required this.right});

  @override
  List<Object?> get props => [current, front, back, left, right];

  factory Pad.fromMap(Map<String, dynamic> data) {
    return Pad(
      current: data['current'],
      front: data['front'] ?? "",
      back: data['back'] ?? "",
      left: data['left'] ?? "",
      right: data['right'] ?? "",
    );
  }
}

class Destination extends Equatable {
  final String desc;
  final String imagePath;

  const Destination({required this.desc, required this.imagePath});

  factory Destination.fromDesc(String desc) {
    //TODO List all posible destinations
    List<Destination> list = <Destination>[];

    return list.where((element) => element.desc == desc).first;
  }

  @override
  List<Object?> get props => [desc, imagePath];
}

part of mini_mapp_manager;

class Pad extends Equatable {
  final int current;
  final Map<String, String> link;
  final List<Destination> dest;

  const Pad({required this.current, required this.link, required this.dest});

  @override
  List<Object?> get props => [current, link, dest];

  factory Pad.fromMap(Map<String, dynamic> data) {
    return Pad(
        current: data['current'],
        link: data['link'] ?? <String, String>{},
        dest: data['dest'] ?? <String>[]);
  }

  static const empty = Pad(
    current: 0,
    link: <String, String>{},
    dest: <Destination>[],
  );
}

class Destination extends Equatable {
  final String desc;
  final String imagePath;
  //TODO list all available destinations
  static const List<Destination> listDest = <Destination>[];

  const Destination({required this.desc, required this.imagePath});

  bool isExist(String desc) {
    return listDest.any((element) => element.desc == desc);
  }

  factory Destination.fromDesc(String desc) {
    return listDest.where((element) => element.desc == desc).first;
  }

  @override
  List<Object?> get props => [desc, imagePath];
}

part of mini_mapp_manager;

class Pad extends Equatable {
  final int current;
  final Map<String, String> link;
  final List<String> dest;

  const Pad({required this.current, required this.link, required this.dest});

  @override
  List<Object?> get props => [current, link, dest];

  List<Destination> getDestination() {
    return dest.map((e) => Destination.fromDesc(e)).toList();
  }

  factory Pad.fromMap(Map<String, dynamic> data) {
    return Pad(
        current: data['current'],
        link: data['link'] ?? <String, String>{},
        dest: data['dest'] ?? <String>[]);
  }

  factory Pad.empty() => const Pad(
        current: 0,
        link: <String, String>{},
        dest: <String>[],
      );
}

class Destination extends Equatable {
  final String desc;
  final String imagePath;
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

class Bridge extends Destination {
  final String end;
  static const List<Bridge> listBrid = <Bridge>[];
  const Bridge({required this.end, required desc, required imagePath})
      : super(desc: desc, imagePath: imagePath);

  @override
  bool isExist(String desc) {
    return listBrid.any((element) => element.desc == desc);
  }

  factory Bridge.fromDesc(String desc) {
    return listBrid.where((element) => element.desc == desc).first;
  }

  @override
  List<Object?> get props => [end, desc, imagePath];
}

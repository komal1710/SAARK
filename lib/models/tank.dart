class Tank {
  final String name;
  final String height;
  final String type;
  final String lastUpdate;
  final int volumePercent;
  final int volumeLitres;
  final String volumeWords;
  final DateTime date = DateTime.now().toLocal();

  Tank(
      {required this.name,
      required this.height,
      required this.type,
      required this.lastUpdate,
      required this.volumePercent,
      required this.volumeLitres,
      required this.volumeWords});

  factory Tank.fromJson(Map<String, dynamic> json) {
    return Tank(
      name: json['name'],
      height: json['height'],
      type: json['type'],
      lastUpdate: json['lastUpdate'],
      volumePercent: json['volumePercent'],
      volumeLitres: json['volumeLitres'],
      volumeWords: json['volumeWords'],
    );
  }

  factory Tank.fromJsonBasicJson(Map<String, dynamic> json) {
    if (json.containsKey('DMAC')) {
      return Tank(
        name: 'Tank ${json['DMAC']}',
        height: '5ft 11in',
        type: 'Overhead Tank',
        lastUpdate: '1 minute ago',
        volumePercent: int.parse(json['TLP']),
        volumeLitres: 26662,
        volumeWords: 'Almost Full',
      );
    }
    else {
      return Tank(
        name: '',
        height: '',
        type: '',
        lastUpdate: '',
        volumePercent: -1,
        volumeLitres: -1,
        volumeWords: '',
      );
    }
  }
}

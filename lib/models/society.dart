import 'package:saark/models/tank.dart';

class Society {
  final String name;
  final String location;
  final List<Tank> tanks;

  Society({required this.name, required this.location, required this.tanks});
}

List<Society> societies = [
  Society(
    name: 'Society A',
    location: 'Pune',
    tanks: [
      Tank(
          name: 'Bldg A Domestic',
          height: '3ft 11in',
          type: 'Overhead Tank',
          lastUpdate: '16 minutes ago',
          volumePercent: 92,
          volumeLitres: 24876,
          volumeWords: 'Almost Full'),
      Tank(
          name: 'Bldg A Drinking',
          height: '5ft 11in',
          type: 'Overhead Tank',
          lastUpdate: '26 minutes ago',
          volumePercent: 95,
          volumeLitres: 26662,
          volumeWords: 'Almost Full'),
    ]
  ),
  Society(
      name: 'Society B',
      location: 'Mumbai',
      tanks: [
        Tank(
            name: 'Bldg A Domestic',
            height: '3ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '16 minutes ago',
            volumePercent: 92,
            volumeLitres: 24876,
            volumeWords: 'Almost Full'),
        Tank(
            name: 'Bldg B Drinking',
            height: '5ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '35 minutes ago',
            volumePercent: 35,
            volumeLitres: 15232,
            volumeWords: 'Halfway Full'),
        Tank(
            name: 'Bldg B Domestic',
            height: '3ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '16 minutes ago',
            volumePercent: 92,
            volumeLitres: 24876,
            volumeWords: 'Almost Full'),
        Tank(
            name: 'Bldg B Drinking',
            height: '5ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '35 minutes ago',
            volumePercent: 15,
            volumeLitres: 6973,
            volumeWords: 'Almost Empty'),
      ]
  ),
  Society(
      name: 'Society C',
      location: 'Goa',
      tanks: [
        Tank(
            name: 'Bldg A Domestic',
            height: '3ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '16 minutes ago',
            volumePercent: 92,
            volumeLitres: 24876,
            volumeWords: 'Almost Full'),
        Tank(
            name: 'Bldg A Drinking',
            height: '5ft 11in',
            type: 'Overhead Tank',
            lastUpdate: '26 minutes ago',
            volumePercent: 95,
            volumeLitres: 26662,
            volumeWords: 'Almost Full'),
      ]
  ),
];

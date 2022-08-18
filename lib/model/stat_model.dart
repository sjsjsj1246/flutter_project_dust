enum ItemCode {
  PM10,
  PM25,
  NO2,
  O3,
  CO,
  SO2,
}

class StatModel {
  final double daegu;
  final double chungnam;
  final double incheon;
  final double daejeon;
  final double gyeongbuk;
  final double sejong;
  final double gwangju;
  final double jeonbuk;
  final double gangwon;
  final double ulsan;
  final double jeonnam;
  final double seoul;
  final double busan;
  final double jeju;
  final double chungbuk;
  final double gyeongnam;
  final double gyeonggi;
  final DateTime dataTime;
  final ItemCode itemCode;

  StatModel.fromJson({required Map<String, dynamic> json})
      : daegu = double.parse(
          json['daegu'] ?? '0',
        ),
        chungnam = double.parse(
          json['chungnam'] ?? '0',
        ),
        incheon = double.parse(
          json['incheon'] ?? '0',
        ),
        daejeon = double.parse(
          json['daejeon'] ?? '0',
        ),
        gyeongbuk = double.parse(
          json['gyeongbuk'] ?? '0',
        ),
        sejong = double.parse(
          json['sejong'] ?? '0',
        ),
        gwangju = double.parse(
          json['gwangju'] ?? '0',
        ),
        jeonbuk = double.parse(
          json['jeonbuk'] ?? '0',
        ),
        gangwon = double.parse(
          json['gangwon'] ?? '0',
        ),
        ulsan = double.parse(
          json['ulsan'] ?? '0',
        ),
        jeonnam = double.parse(
          json['jeonnam'] ?? '0',
        ),
        seoul = double.parse(
          json['seoul'] ?? '0',
        ),
        busan = double.parse(
          json['busan'] ?? '0',
        ),
        jeju = double.parse(
          json['jeju'] ?? '0',
        ),
        chungbuk = double.parse(
          json['chungbuk'] ?? '0',
        ),
        gyeongnam = double.parse(
          json['gyeongnam'] ?? '0',
        ),
        gyeonggi = double.parse(
          json['gyeonggi'] ?? '0',
        ),
        dataTime = DateTime.parse(json['dataTime']),
        itemCode = parseItemCode(json['itemCode']);

  static ItemCode parseItemCode(String raw) {
    if (raw == 'PM2.5') {
      return ItemCode.PM25;
    }

    return ItemCode.values.firstWhere((element) => element.name == raw);
  }
}

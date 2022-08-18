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
          json['daegu'],
        ),
        chungnam = double.parse(
          json['chungnam'],
        ),
        incheon = double.parse(
          json['incheon'],
        ),
        daejeon = double.parse(
          json['daejeon'],
        ),
        gyeongbuk = double.parse(
          json['gyeongbuk'],
        ),
        sejong = double.parse(
          json['sejong'],
        ),
        gwangju = double.parse(
          json['gwangju'],
        ),
        jeonbuk = double.parse(
          json['jeonbuk'],
        ),
        gangwon = double.parse(
          json['gangwon'],
        ),
        ulsan = double.parse(
          json['ulsan'],
        ),
        jeonnam = double.parse(
          json['jeonnam'],
        ),
        seoul = double.parse(
          json['seoul'],
        ),
        busan = double.parse(
          json['busan'],
        ),
        jeju = double.parse(
          json['jeju'],
        ),
        chungbuk = double.parse(
          json['chungbuk'],
        ),
        gyeongnam = double.parse(
          json['gyeongnam'],
        ),
        gyeonggi = double.parse(
          json['gyeonggi'],
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

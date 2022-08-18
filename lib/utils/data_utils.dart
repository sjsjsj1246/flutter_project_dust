import 'package:flutter_project_dust/const/status_level.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/model/status_model.dart';

class DataUtils {
  static String getTimeFromDateTime(
    DateTime dataTime,
  ) {
    return '${dataTime.year}년 ${dataTime.month}월 ${dataTime.day}일 ${getTimeFormat(dataTime.hour)}:${getTimeFormat(dataTime.minute)}';
  }

  static String getTimeFormat(int number) {
    return number.toString().padLeft(2, '0');
  }

  static String getUnitFromItemCode(ItemCode itemCode) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '㎍/㎥';
      case ItemCode.PM25:
        return '㎍/㎥';
      default:
        return 'ppm';
    }
  }

  static String itemCodeKrString(ItemCode itemCode) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';
      case ItemCode.NO2:
        return '이산화질소';
      case ItemCode.O3:
        return '오존';
      case ItemCode.CO:
        return '일산화탄소';
      case ItemCode.SO2:
        return '아황산가스';
      default:
        return '알수없음';
    }
  }

  static StatusModel getStatusFromItemCodeAndValue({
    required double value,
    required ItemCode itemCode,
  }) {
    return statusLevel.where((status) {
      switch (itemCode) {
        case ItemCode.PM10:
          return status.minFineDust < value;
        case ItemCode.PM25:
          return status.minUltraFineDust < value;
        case ItemCode.NO2:
          return status.minNO2 < value;
        case ItemCode.O3:
          return status.minO3 < value;
        case ItemCode.CO:
          return status.minCO < value;
        case ItemCode.SO2:
          return status.minSO2 < value;
        default:
          throw Exception("알수없는 아이템코드입니다.");
      }
    }).last;
  }
}

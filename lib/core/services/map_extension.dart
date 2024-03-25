// ignore_for_file: always_specify_types

/// Map extension
class MapUtils {
  MapUtils._();
  

  /// converts dynamic Map
  static Map<String, dynamic> convertDynamicMap(final Map<dynamic, dynamic> inputMap) {
    final Map<String, dynamic> resultMap = <String, dynamic>{};
    inputMap.forEach((final key, final value) {
      if (key != null) {
        resultMap[key.toString()] = value;
      }
    });
    return resultMap;
  }
}

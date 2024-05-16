import 'package:dio/dio.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:tennis_jamiss/const/server_url.dart';

class LocationService {
  final Dio _dio = Dio();

  Future<LatLng> fetchLocationData() async {
    try {
      final response =
          await _dio.get('${ServerUrl.serverUrl}/location' ''); // 백엔드 API 엔드포인트
      if (response.statusCode == 200) {
        return LatLng.fromJson(response.data);
      } else {
        throw Exception('Failed to load location data');
      }
    } catch (error) {
      throw Exception('Error fetching location data: $error');
    }
  }
}

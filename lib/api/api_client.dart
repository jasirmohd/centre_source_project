import 'package:get/get.dart';
import 'package:pix/model/image_response.dart';

class ApiClient extends GetConnect {
  ApiClient() {
    httpClient.baseUrl = 'https://pixabay.com/api/';
  }
  Future<ImageResponse> getMethod({
    required String searchText,
    required int pageNo,
  }) async {
    String endPoint =
        '?key=28342687-3f191f7fd29a255a51eeb9dfd&q=$searchText&image_type=photo&pretty=true&page=${pageNo.toString()}';
    var response = await get(endPoint);
    try {
      final result = ImageResponse.fromJson(response.body);
      return result;
    } catch (error) {
      error.printError();
      final result = ImageResponse(
        total: 0,
        totalHits: 0,
        hits: [],
      );
      return result;
    }
  }
}

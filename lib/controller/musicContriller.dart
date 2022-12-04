import 'package:get/get.dart';
import 'package:music/services/service.dart';
import '../modal/music.dart';

class MusicController extends GetxController {
  Service _service = Service();

  var isLoading = false.obs;
  List<Music> trackList = <Music>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> fetchTracks(name) async {
    isLoading(true);
    try {
      var tracks = await _service.getTracks(name);
      if (tracks != null) {
        trackList = tracks;
      }
    } finally {
      isLoading(false);
    }
  }
}

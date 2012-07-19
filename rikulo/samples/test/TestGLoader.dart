#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/service/gapis/gapis.dart');
#import('package:rikulo/util/util.dart');

class TestGLoader extends Activity {

  void onCreate_() {
    GLoader.loadIPLatLng((double lat, double lng) {
        log("lat: ${lat}, lng: ${lng}");
    });
    GLoader.load(GLoader.FEED, "1", {"callback": ()=>log("Feed loaded")});
  }
}

void main() {
  new TestGLoader().run();
}

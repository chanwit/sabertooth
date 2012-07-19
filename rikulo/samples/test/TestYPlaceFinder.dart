#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/service/yapis/yapis.dart');
#import('package:rikulo/util/util.dart');

class TestYPlaceFinder extends Activity {

  void onCreate_() {
    YPlaceFinder.loadGeoInfo({"location": "37.787082 -122.400929"},
      (Map resultSet) {
        if(resultSet === null)
          log("Fail to loadGeoInfo.");
        else {
          Map result = resultSet["Result"];
          log("woeid: ${result['woeid']}"); //12797156
          log("city: ${result['city']}"); //San Francisco
        }
      }, gflags:"R");
  }
}

void main() {
  new TestYPlaceFinder().run();
}

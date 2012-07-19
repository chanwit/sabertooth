#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/service/yapis/yapis.dart');
#import('package:rikulo/util/util.dart');

class TestYWeather extends Activity {

  void onCreate_() {
    YWeather loader = new YWeather("12797156", "c");
    loader.loadWeatherInfo((Map channel){
      log("channel: $channel");
      Map location = channel['yweather:location'];
      log("location: $location");
      Map units = channel['yweather:units'];
      log("units: $units");
      String degree = units['temperature'];
      log("degree: $degree");
      Map item = channel['item'];
      log("item: $item");
      Map condition = item['yweather:condition'];
      if (condition !== null) {
        log(location['city']);
        log(location['country']);
        log(condition['text']);
        log(condition['code']);
        log("${condition['temp']} $degree");
        log(condition['date']);
      }
    });
  }
}

void main() {
  new TestYWeather().run();
}

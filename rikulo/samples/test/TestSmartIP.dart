#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/service/service.dart');
#import('package:rikulo/util/util.dart');

class TestSmartIP extends Activity {

  void onCreate_() {
    SmartIP loader = new SmartIP();
    loader.loadIPGeoInfo((Map geoip) {
        log('''
          source: ${geoip['source']},
          host: ${geoip['host']},
          lang: ${geoip['lang']},
          countryName: ${geoip['countryName']},
          countryCode: ${geoip['countryCode']},
          city: ${geoip['city']},
          region: ${geoip['region']},
          latitude: ${geoip['latitude']},
          longitude: ${geoip['longitude']},
          timezone: ${geoip['timezone']}
        ''');
    });
  }
}

void main() {
  new TestSmartIP().run();
}

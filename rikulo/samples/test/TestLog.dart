//Sample Code: Test Log

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/util/util.dart');

class TestLog extends Activity {

  void onCreate_() {
    log("Started");
    log(null);
    int count = 0;
    Button btn = new Button("Click Me!");
    btn.on.click.add((event) {
      log("Clicked ${++count}");
    });
    mainView.addChild(btn);
  }
}

void main() {
  new TestLog().run();
}

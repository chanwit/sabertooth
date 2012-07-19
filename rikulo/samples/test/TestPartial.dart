//Sample Code: activity is just a part of whole HTML page

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');

class TestPartial extends Activity {

  void onCreate_() {
    TextView welcome = new TextView("Hello World!");
    welcome.profile.text = "anchor:  parent; location: center center";
    welcome.on.click.add((event) {
      TextView v = new TextView.html('<ul style="padding:10px"><li>Dialog Popup</li></ul>');
      v.classes.add("v-dialog");
      v.profile.location = "center center";
      addDialog(v);
    });
    mainView.addChild(welcome);
  }
}

void main() {
  new TestPartial().run();
}

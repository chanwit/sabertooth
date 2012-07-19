//Test Code: TestDialog

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/util/util.dart');

class TestDialog extends Activity {

  void onCreate_() {
    Button btn = new Button("Open a dialog");
    btn.profile.text = "anchor: parent; location: center left";
    btn.on.click.add((event) {
      View dlg = new TextView("Clicked me to close");
      dlg.style.cssText = "text-align: center; padding-top: 20px";
      dlg.profile.text = "location: center center;width:30%;height:20%";
      dlg.classes.add("v-dialog");
      dlg.on.click.add((e) {
        removeDialog();
      });
      addDialog(dlg);
    });
    mainView.addChild(btn);

    btn = new Button("Replace the main View");
    btn.profile.text = "anchor: parent; location: center right";
    btn.on.click.add((event) {
      mainView = new TextView.html("<h1>New Main View</h1><p>The main view has been replaced</p>");
    });
    mainView.addChild(btn);
  }
}

void main() {
  new TestDialog().run();
}

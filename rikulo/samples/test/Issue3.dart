#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');

class Issue3 extends Activity {
  View _left, _right;
  void onCreate_() {
    mainView.layout.type = "linear";
    mainView.layout.orient = "vertical";

    //hlayout
    View hlayout = new View();
    hlayout.layout.type = "linear";
    hlayout.layout.orient = "horizontal";
    hlayout.profile.width = "100%";
    hlayout.profile.height = "content";
    mainView.addChild(hlayout);

    //left text
    TextView left = new TextView("FIRST TEXT");
    hlayout.addChild(left);
    _left = left;

    //right text
    TextView right = new TextView("SECOND TEXT");
    right.hidden = true;
    hlayout.addChild(right);
    _right = right;

    _left.on.click.add((event) {_left.hidden = true; _right.hidden = false; mainView.requestLayout();});
    _right.on.click.add((event) {_left.hidden = false; _right.hidden = true; mainView.requestLayout();});

    mainView.addChild(new TextView.html('''
        <ul><li>Click FIRST TEXT and you shall see it disappears and SECOND TEXT shows up</li>
        <li>Click SECOND TEXT and you shall see the reversed response</li></ul>
        '''));
  }
}

main() {
  new Issue3().run();
}
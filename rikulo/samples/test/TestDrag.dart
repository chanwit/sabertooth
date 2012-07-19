//Sample Code: Test Log

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/html/html.dart');
#import('package:rikulo/util/util.dart');

class TestDrag extends Activity {

  void onCreate_() {
    _createBoxedDrag(mainView);
    _createSimpleDrag(mainView);
  }
  View _createSimpleDrag(View parent) {
    View view = _createDragView(parent, "Simple Drag");
    view.on.mount.add((event) {
      new DragGesture(view.node);
    });
    return view;
  }
  View _createBoxedDrag(View parent) {
    View box = new View();
    box.classes.add("drag");
    box.profile.text =
      "anchor: parent; location: center center; width: 70%; height: 70%";
    parent.addChild(box);

    View view = _createDragView(box, "Boxed Drag");
    view.on.mount.add((event) {
      final DOMQuery qbox = new DOMQuery(box),
        qview = new DOMQuery(view);
      new DragGesture(view.node,
        range: () => new Rectangle(0, 0,
          qbox.innerWidth - qview.outerWidth,
          qbox.innerHeight - qview.outerHeight));
    });
    return box;
  }
  TextView _createDragView(View parent, String label) {
    TextView view = new TextView(label);
    view.classes.add("drag");
    view.left = view.top = 20;
    parent.addChild(view);
    return view;
  }
}

void main() {
  new TestDrag().run();
}

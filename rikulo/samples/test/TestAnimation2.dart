//Sample Code: Test Animation 2

#import('dart:html');

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/html/html.dart');
#import('package:rikulo/util/util.dart');
#import('package:rikulo/event/event.dart');
#import('package:rikulo/effect/effect.dart');

View createCube(int size, String txt) {
  View v = new View();
  v.width = size;
  v.height = size;
  v.style.border = "2px solid #3D4C99";
  v.style.borderRadius = "10px";
  v.style.backgroundColor = "#5C73E5";
  v.style.userSelect = "none";
  v.style.zIndex = "10";

  TextView txtv = new TextView(txt);
  txtv.width = v.width;
  txtv.style.lineHeight = "${v.height}px";
  txtv.style.textAlign = "center";
  txtv.style.color = "#EEEEEE";
  txtv.style.fontFamily = "Arial";
  txtv.style.fontWeight = "bold";
  txtv.style.userSelect = "none";
  v.addChild(txtv);

  return v;
}

class TestAnimation2 extends Activity {

  View cube;

  void onCreate_() {
    View box = new Section();
    box.width = 500;
    box.height = 500;
    box.left = 48;
    box.top = 48;
    box.style.border = "2px dashed #CCCCCC";
    mainView.addChild(box);

    cube = createCube(100, "Drag Me");
    cube.left = 250;
    cube.top = 250;
    mainView.addChild(cube);

    Rectangle range = new Rectangle(50, 50, 446, 446);
    Element element = cube.node;
    final num deceleration = 0.0005;

    Motion motion;
    DragGesture dg = new DragGesture(element, range: () => range,
    start: (DragGestureState dstate) {
      if (motion != null)
        motion.stop();
      return element;
    }, end: (DragGestureState dstate) {
      final Offset vel = dstate.velocity;
      num speed = VectorUtil.norm(vel);
      if (speed == 0)
        return true;
      Offset unitv = vel / speed;
      Offset pos = new DOMQuery(element).offset;
      motion = new Motion(moving: (MotionState mstate) {
        int elapsed = mstate.elapsedTime;
        pos = range.snap(pos + (unitv * speed * elapsed));
        element.style.left = CSS.px(pos.left.toInt());
        element.style.top = CSS.px(pos.top.toInt());
        speed = Math.max(0, speed - deceleration * elapsed);
        return speed > 0;
      });
      return true;
    });

  }
}

void main() {
  new TestAnimation2().run();
}

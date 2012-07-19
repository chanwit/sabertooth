//Sample Code: Test Query

#import('dart:html');

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');
#import('package:rikulo/util/util.dart');
#import('package:rikulo/view/select/select.dart');

class TestQuery extends Activity {

  void onCreate_() {

    mainView.layout.type = "linear";
    mainView.layout.orient = "vertical";

    logMsg("The failed cases are shown below:");

    // legal
    assertIdentical("type#id");
    assertIdentical("type > type ~ type type");
    assertIdentical("#id .c1 + :p1");
    assertIdentical("#id, type, .cls");
    assertIdentical("#id type, .cls > #id");
    assertIdentical("* #id, #id *, *");
    assertIdentical("type:pcls(abc)");

    assertLegal("type.c1:p1#id:p2.c2");
    assertLegal("#id , type,   .cls   +   type");

    // illegal
    assertIllegal("#id#id");
    assertIllegal("#id > > #id");
    assertIllegal("#id> #id");
    assertIllegal("#id >#id");
    assertIllegal("> #id");
    assertIllegal(" > #id");
    assertIllegal("#id >");
    assertIllegal("#id > ");
    assertIllegal("*#id");
    assertIllegal("*.cls");
    assertIllegal("*:pcls");
    assertIllegal("type:pcls(");
    assertIllegal("type:pcls(abc");
    assertIllegal("type#");
    assertIllegal("type:");
    assertIllegal("type.");
    assertIllegal("type# type");
    assertIllegal("type: type");
    assertIllegal("type. type");
    assertIllegal("type# > type");
    assertIllegal("type: > type");
    assertIllegal("type. > type");
    assertIllegal("type+ type");
    assertIllegal("type +type");
    assertIllegal("+ type");
    assertIllegal("type +, #id");
    assertIllegal("type, + #id");
    assertIllegal("type,");
    assertIllegal(",type");
    assertIllegal("type#,");
    assertIllegal("type:,");
    assertIllegal("type.,");

  }

  void assertIdentical(String src) {
    assertLegal(src, "[${src}]");
  }

  void assertLegal(String src, [String result]) {
    try {
      List<Selector> selectors = Selectors.parse(src);
      if (result != null) {
        String r = selectors.toString();
        if (r != result)
          logMsg("* Unexpected parse result: ${r} (expecting ${result})");
      }
    } catch (SelectorParseException e) {
      logMsg("* Should be legal: ${src}");
    }
  }

  void assertIllegal(String src) {
    try {
      List<Selector> selectors = Selectors.parse(src);
      logMsg("* Should be illegal: ${src}");
    } catch (SelectorParseException e) {}
  }

  void logMsg(String msg) {
    mainView.addChild(new TextView(msg));
  }

}

void main() {
  new TestQuery().run();
}

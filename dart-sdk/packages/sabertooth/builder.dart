#library('sabertooth:builder');

#import('package:rikulo/view/view.dart');

TextView textView([String text]) => new TextView(text);

q(View view) => new Builder(view);

String TYPE = "type";

View hlayout(Map<String, String> profile, Map<String, String> layout) {
  View self = new View();
  self.layout.type = layout['type'];
  self.profile.width  = profile['width'];
  self.profile.height = profile['height'];
  return self;
}

class Builder {

  View _view;

  Builder(View view) {
    this._view = view;
  }

  Builder style([String backgroundColor]) {
    _view.style.backgroundColor = backgroundColor;
    return this;
  }

  Builder layout([String type, String orient]) {
    _view.layout.type   = type;
    _view.layout.orient = orient;
    return this;
  }

  Builder profile([String width, String height]) {
    _view.profile.width  = width;
    _view.profile.height = height;
    return this;
  }

  Builder operator << (List<View> views) {
    for(View v in views) {
      _view.addChild(v);
    }
  }

}
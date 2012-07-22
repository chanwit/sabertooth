/*
   SaberTooth for Rikulo
   (c) 2012 Chanwit Kaewkasi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

#library('sabertooth:builder');

#import('package:rikulo/view/view.dart');

q(View v) {
  new Builder(v);
}

Builder hlayout([Map<String, Dynamic> profile, Map<String, Dynamic> layout]) {
  View self = new View();
  self.layout.type  = layout['type'];
  self.layout.align = layout['align'];
  self.profile.width  = profile['width'];
  self.profile.height = profile['height'];
  return new Builder(self);
}

Builder view([String id, Map<String, Dynamic> style, Map<String, Dynamic> profile, Map<String, Dynamic> layout]) {
  View self = new View();
  if(id != null) {
    self.id = id;
  }
  if(style != null) {
    self.style.backgroundColor = style['backgroundColor'];
  }
  if(layout != null) {
      self.layout.type = layout['type'];
  }
  if(profile != null) {
    self.profile.width  = profile['width'];
    self.profile.height = profile['height'];
  }
  return new Builder(self);
}

Builder text(String value, [String id, Map<String, Dynamic> style, Map<String, Dynamic> profile]) {
  TextView self = new TextView(value);
  if(id != null) {
    self.id = id;
  }
  if(style != null) {
    self.style.border = style['border'];
  }
  if(profile != null) {
    self.profile.anchor     = profile['anchor'];
    self.profile.anchorView = profile['anchorView'];
    print("anchorView: ${profile['anchorView']}");
    self.profile.location   = profile['location'];
  }
  return new Builder(self);
}

class Color {
  static final String red    = "red";
  static final String blue   = "blue";
  static final String orange = "orange";
  static final String yellow = "yellow";
}

class Profile {
  static final String content = "content";
  static final String flex    = "flex";
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

  Builder profile([String width, String height, View anchorView]) {
    _view.profile.width  = width;
    _view.profile.height = height;
    _view.profile.anchorView = anchorView;
    return this;
  }

  Builder operator << (List<Builder> builders) {
    for(Builder b in builders) {
      _view.addChild(b._view);
    }
    return this;
  }

}
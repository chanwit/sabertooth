//Sample Code: Layout Demostration

#import('package:rikulo/app/app.dart');
#import('package:rikulo/view/view.dart');

#import('package:sabertooth/builder.dart');

class LinearLayoutDemo extends Activity {

  void onCreate_() {
    title = "Linear Layout Demo";

    q(mainView).style(backgroundColor: "#cca")
               .layout(type: "linear", orient: "vertical")
               .profile(width: Profile.flex, height: Profile.flex);

    q(mainView) << [
      hlayout(layout: {"type": "linear"}, profile:{"height": Profile.content, "width": Profile.flex}) << [
        view(style:{"backgroundColor": Color.blue},   profile:{"width": "flex",   "height": "50"}),
        view(style:{"backgroundColor": Color.orange}, profile:{"width": "flex 2", "height": "50"}),
        view(style:{"backgroundColor": Color.yellow}, profile:{"width": "flex 3", "height": "50"})
      ],
      hlayout(layout: {"type": "linear", "align": "end"}, profile:{"height": "flex", "width": "flex"}) << [
        view(style:{"backgroundColor": Color.yellow}, profile:{"width": "flex 3", "height": Profile.flex}),
        view(id: "viewFlex", style:{"backgroundColor": Color.orange}, profile:{"width": "flex 2", "height": "50%"}),
        view(style:{"backgroundColor": Color.blue},   profile:{"width": "flex 1", "height": "25"}),
        text("flex 2, 25%", id: "mytext", style:{"border": "1px solid #555"}, profile:{"location": "north center"})
      ]
    ];

    q(mainView.query("#mytext")).profile(anchorView: mainView.query("#viewFlex"));

  }
}

void main() {
  new LinearLayoutDemo().run();
}

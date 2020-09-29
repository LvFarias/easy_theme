import 'package:easy_theme/easy_theme.dart';
import 'package:example/tabs/chips.dart';
import 'package:example/tabs/inputs.dart';
import 'package:example/tabs/others.dart';
import 'package:example/tabs/sliders.dart';
import 'package:example/tabs/typography.dart';
import 'package:example/tabs/widgets.dart';
import 'package:flutter/material.dart';

final CustomTheme myCustomTheme = CustomTheme(primary: Colors.blue);
final ThemeData myTheme = myCustomTheme.getTheme();
final MyColors myColors = myCustomTheme.getColors();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Test',
      theme: myTheme,
      home: MyHomePage(),
    );
  }
}

class TabItem {
  final String text;
  final IconData icon;

  TabItem(this.text, this.icon);
}

class MyHomePage extends StatefulWidget {
  ThemeData get theme => myTheme;

  const MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // RepaintBoundary key
  GlobalKey _globalKey = new GlobalKey();

  final _tabsItem = [
    TabItem('Controls', Icons.check_box),
    TabItem('Buttons', Icons.touch_app),
    TabItem('Inputs', Icons.keyboard),
    TabItem('Slider', Icons.tune),
    TabItem('Chips', Icons.dns),
    TabItem('Others', Icons.people),
    TabItem('Text', Icons.text_fields),
    TabItem('Primary Text', Icons.text_fields),
    TabItem('Accent Text', Icons.text_fields),
    /*TabItem('Color scheme', Icons.color_lens),*/
  ];

  TabController tabBarController;

  bool showFAB = true;

  get bottomItems => [
        {'label': 'Map', 'icon': Icons.map},
        {'label': 'Description', 'icon': Icons.description},
        {'label': 'Transform', 'icon': Icons.transform},
      ]
          .map<Widget>((item) => IconButton(
                    icon: Icon(item['icon']),
                    onPressed: () {},
                  )
              /*BottomNavigationBarItem(
                icon: Icon(item['icon']),
                title: Text(item['label']),
              )*/
              )
          .toList();

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: _tabsItem.length, vsync: this);
    tabBarController.addListener(() {
      setState(() {
        showFAB = tabBarController.index == 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: AnimatedTheme(
        data: widget.theme,
        child: DefaultTabController(
          length: _tabsItem.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("App Preview"),
              bottom: _buildTabBar(),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {}),
                /*IconButton(
                      icon: Icon(Icons.create_new_folder),
                      onPressed: () => Scaffold.of(context).openDrawer()),*/
              ],
            ),
            floatingActionButton: tabBarController.index == 0
                ? FloatingActionButton(
                    child: Icon(
                      Icons.check,
                      /*color: widget.theme?.accentTextTheme?.button?.color,*/
                    ),
                    onPressed: () {})
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Text('Drawer'),
                ],
              ),
            ),
            body: TabBarView(controller: tabBarController, children: [
              WidgetPreview(theme: widget.theme),
              ButtonPreview(theme: widget.theme),
              InputsPreview(theme: widget.theme),
              SliderPreview(theme: widget.theme),
              ChipsPreview(theme: widget.theme),
              OthersPreview(theme: widget.theme),
              TypographyPreview(
                textTheme: widget.theme.textTheme,
                brightness: widget.theme.brightness,
              ),
              TypographyPreview(
                textTheme: widget.theme.primaryTextTheme,
                brightness: widget.theme.primaryColorBrightness,
              ),
              TypographyPreview(
                textTheme: widget.theme.accentTextTheme,
                brightness: widget.theme.accentColorBrightness,
              ),
            ]),
            bottomNavigationBar: BottomAppBar(
              child: Row(children: bottomItems),
              shape: CircularNotchedRectangle(),
            ),
          ),
        ),
      ),
    );
  }

  _buildTabBar() {
    return TabBar(
      isScrollable: true,
      controller: tabBarController,
      tabs:
          _tabsItem.map((t) => Tab(text: t.text, icon: Icon(t.icon))).toList(),
    );
  }
}

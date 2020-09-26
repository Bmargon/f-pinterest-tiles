import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/src/widget/menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {


@override
  Widget build(BuildContext context) {
     
    return ChangeNotifierProvider(
      
      create: (context) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _MenuLocation(),
          ],
        ),    // body: PinterestMenu()
   ),
    );
  }
}

class _MenuLocation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 50,
      child: Container(
        width: width,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            backgroundColor: Colors.black,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: () {print('hola');}),
              PinterestButton(icon: Icons.search, onPressed: () {print('hola');}),
              PinterestButton(icon: Icons.arrow_back, onPressed: () {print('hola');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {print('hola');})
            ],
          )
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener( () {
      if (controller.offset > scrollAnterior && controller.offset > 150) {    
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        print('mostrar arriba');
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        print('mostrar bajo');
      }
      scrollAnterior = controller.offset;
    }); 
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestItem extends StatelessWidget {

  final int index;

  PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.blue,
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ));
  }
}


class _MenuModel with ChangeNotifier {
  
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar (bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }

}
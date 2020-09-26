import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton( {@required this.onPressed, @required this.icon } );
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor; // Orange
  final Color inactiveColor; // Bluegrey
  final List<PinterestButton> items;
  
  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.orange,
    this.inactiveColor = Colors.blueGrey,
    this.items
    });

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 150),
          opacity: (mostrar) ? 1 : 0,
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
              Provider.of<_MenuModel>(context).activeColor = this.activeColor;
              Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
              return _PinterestMenuBackground(
                child: _MenuItems(items),
              );
            } ,
          ),
        )
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  _PinterestMenuBackground({@required this.child});


  @override

  Widget build(BuildContext context) {
  Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
        color:  backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton( i, menuItems[i]) )
    );
  }
}
 class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton( this.index, this.item );

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color: (itemSeleccionado == index) ? Colors.orange : Colors.blueGrey,
        ),
      ),
    );
  }
}

/// Provieder
class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.orange;
  Color inactiveColor =  Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
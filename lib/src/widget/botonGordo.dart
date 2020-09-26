import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPressed;

  const BotonGordo({

    this.icon = FontAwesomeIcons.plus, 
    this.texto = '', 
    this.color1 = Colors.amber, 
    this.color2 = Colors.red, 
    this.onPressed})
    ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Stack(
        children: <Widget>[
          _botonGordoBkg(
            color1: this.color1,
            color2: this.color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140, width: 40,),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.arrowAltCircleRight, color: Colors.white,),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _botonGordoBkg extends StatelessWidget {

  final Color color1;
  final Color color2;
  final IconData icon;

  const _botonGordoBkg({
    @required this.color1, 
    @required this.color2, 
    @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: <Widget>[
          Positioned(
            right: -20,
            top: -20,
            child: FaIcon(this.icon, size: 150, color: Colors.white.withOpacity(0.2),)
          )
        ],),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( color: Colors.black38.withOpacity(0.2), offset: Offset(4, 6), blurRadius:  10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2,
          ])
      ),
    );
  }
}
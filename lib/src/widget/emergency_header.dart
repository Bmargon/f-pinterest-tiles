import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHeader extends StatelessWidget {

  final IconData icon;
  final String   titulo;
  final String   subtitulo;
  final Color    color1;
  final Color    color2;

  const EmergencyHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2),)
          ),
          Column(children: <Widget>[
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitulo, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),),
            SizedBox(height: 20,),
            Text(this.titulo, style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),),
            FaIcon(this.icon, size: 80, color: Colors.white,)
          ],
        )
      ] 
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color    color1;
  final Color    color2;

  const _IconHeaderBackground({Key key, @required this.color1, @required this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1 ,
            this.color2,
          ]
        )
      ),
    );
  }
}
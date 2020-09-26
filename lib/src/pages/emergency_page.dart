import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest/src/widget/botonGordo.dart';
import 'package:pinterest/src/widget/emergency_header.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}



class EmergencyPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


  final items = <ItemBoton>[
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
];

  List<Widget> itemMap = items.map( (item) {
    return FadeInLeft(
      duration: Duration(milliseconds: 250),
      child: BotonGordo(
        icon: item.icon,
        texto: item.texto,
        color1: item.color1,
        color2: item.color2,
        onPressed: () => print('hola'),
      ),
    );
  }).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: itemMap
            ),
          ),
          _Encabezado(),
        ],
      )      
   );
  }
}

class _Encabezado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        EmergencyHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'Hola', 
          subtitulo: 'Que tal'),
        Positioned(
          child: RawMaterialButton(
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white),
            shape: CircleBorder(),
            onPressed:() {},),
          right: 0,
          top: 45,
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      color1: Colors.red,
      color2: Colors.pink,
      texto: 'Buenos dias',
      icon: FontAwesomeIcons.circle,
      onPressed: () {
        print('click');
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmergencyHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia',
      subtitulo: 'Has solicitado',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
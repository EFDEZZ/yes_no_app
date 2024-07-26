import 'package:flutter/material.dart';

const Color _cutomColor = Color(0xFF5C11D4);
const List<Color> _colorThemes = [  _cutomColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  ];

class AppTheme{
  final int selectedColor; /*  Numero de color que se pasa por parametro */

  AppTheme({
      this.selectedColor = 0
    }): assert(selectedColor>=0 && selectedColor<=_colorThemes.length-1, 'Colors must be between 0 and ${_colorThemes.length}');/* Se usa una asercion para asegurarse que el # de color pasado por parametro se encuentre en la lista de colores */

  ThemeData theme(){
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor], 
      /* brightness: Brightness.dark */ /* Modo oscuro */
    );
      
      
  }
}
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({
    Key? key, required this.label,
  }) : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)), super(key:key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor" : AppColors.levelButtonBorderFacil,
      "fontColor" : AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor" : AppColors.levelButtonBorderMedio,
      "fontColor" : AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor" : AppColors.levelButtonBorderDificil,
      "fontColor" : AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor" : AppColors.levelButtonBorderPerito,
      "fontColor" : AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[label]!['color']!;
  Color get fontColor => config[label]!['fontColor']!;
  Color get borderColor => config[label]!['borderColor']!;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(BorderSide(
            color: borderColor,
            ))
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(label, style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
          ),
        ),
        
      ),
    );
  }
}
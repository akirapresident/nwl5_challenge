import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  const AnswerWidget({Key? key, required
    this.title,
    this.isRight = false,
    this.isSelected = false,
    
    });
    Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _selectedColorCardRight,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: _selectedBorderCardRight))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
                title,
                style: _selectedTextStyleRight,
                ),
            ),
              Container(
                decoration: BoxDecoration(
                color: _selectedColorRight,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(color: _selectedBorderRight))
                ),
                height: 24,
                width: 24,
                child: isSelected?
                  Icon(_selectedIconRight,
                  size: 16, 
                  color: Colors.white,
                  )
                  : null,
              )  
          ],

        ),
        
      ),
    );
  }
}
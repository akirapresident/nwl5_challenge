import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widget/progres_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final double percent;
  final String completed;
  final VoidCallback onTap;
  
  const QuizCardWidget({Key? key,
  required this.title,
  required this.percent,
  required this.completed, 
  required this.onTap,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 13,
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 17,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ProgressIndicatorWidget(value: percent)),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

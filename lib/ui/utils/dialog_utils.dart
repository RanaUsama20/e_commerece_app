import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primaryColor,
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(message,style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String title = 'Title',
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,style: Theme.of(context).textTheme.titleMedium,)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,style: Theme.of(context).textTheme.titleMedium,)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primaryColor,
            content: Text(message,style: Theme.of(context).textTheme.titleMedium,),
            title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
            actions: actions,
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
          );
        });
  }
}

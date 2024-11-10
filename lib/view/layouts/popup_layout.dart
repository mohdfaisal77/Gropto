import 'package:flutter/material.dart';
import 'package:gropto/helper/app_colors.dart';
import 'package:gropto/helper/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PopUpLayout extends StatelessWidget {
  final WebViewController controller;
   const PopUpLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
backgroundColor: AppColors.white,
                title: const Text('Are you sure?',style: AppStyles.dialogBoxTitleTextStyle,),
                content: const Text('Do you really want to exit',style: AppStyles.wantToExitTextStyle),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.deep_orange,
                      surfaceTintColor: Color(0xffDB3022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),

                    child: Text('No',style: TextStyle(color: AppColors.white),),
                  ),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Color(0xffDB3022),
                        surfaceTintColor: Color(0xffDB3022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Yes',style: TextStyle(color: AppColors.deep_orange)))
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(

        body: WebViewWidget(
            controller:
            controller),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProgressDialog {
  static GlobalKey<State> keyLoader = GlobalKey<State>();
  static bool isDialogVisible = false;

  static Future<void> showLoadingDialog(BuildContext context,
      {String message = "Please wait..."}) async {
    var brightNess;
    isDialogVisible = true;
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              key: keyLoader,
              onWillPop: () async => false,
              child: Material(
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                    constraints: const BoxConstraints(maxWidth: 250,maxHeight: 200),
                    child: kIsWeb
                        ? Container(
                            //width: MediaQuery.of(context).size.width * .40,
                            color: Theme.of(context).cardColor,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    )),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: RichText(
                                        text: TextSpan(text: message),
                                      )),
                                )
                              ],
                            ))
                        : Card(
                            margin: EdgeInsets.all(10),
                            child: !kIsWeb && Platform.isIOS
                                ? Container(
                                    color:
                                        Theme.of(context).popupMenuTheme.color,
                                    padding: EdgeInsets.all(12),
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const CupertinoActivityIndicator(
                                              animating: true,
                                              radius: 20,
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              message,
                                            )
                                          ],
                                        ),
                                      ],
                                    ))
                                : Container(
                                    color:
                                        Theme.of(context).popupMenuTheme.color,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            )),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 110),
                                            child: Text(
                                              message,
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                  ))));
        });
  }

  static hideLoadingDialog(BuildContext context) {
    if (isDialogVisible) {
      if (context != null) {
        Navigator.of(context, rootNavigator: false).pop();
      } else {
        Navigator.of(keyLoader.currentContext!, rootNavigator: false).pop();
      } //close the dialoge
    }
    isDialogVisible = false;
    //Navigator.of(_keyLoader.currentContext, rootNavigator: false).pop(); //close the dialoge
  }
}

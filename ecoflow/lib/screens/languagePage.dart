import 'package:ecoflow/screens/loginPage.dart';
import 'package:ecoflow/utility/dialog_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Languagepage extends StatefulWidget {
  const Languagepage({super.key});

  @override
  State<Languagepage> createState() => _LanguagepageState();
}

class _LanguagepageState extends State<Languagepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  showLanguageDialog(context);
                },
                child: Text('change language'.tr),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () => Get.to(LoginPage()),
                child: Text("continue".tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

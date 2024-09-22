import 'package:flutter/material.dart';
import 'package:get/get.dart';

String _language = 'English';

void showLanguageDialog(BuildContext context) {
  
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Remove the colon
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Add a border radius for rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Ensures the dialog is only as big as its content
              children: <Widget>[
                Text(
                  'Select Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _buildLanguageItem(context, 'EN', 'english'.tr, 'en'),
                _buildLanguageItem(context, 'HI', 'hindi'.tr, 'hi'),
                _buildLanguageItem(context, 'BN', 'bengali'.tr, 'bn'),
                _buildLanguageItem(context, 'KN', 'kannada'.tr, 'kn'),
                _buildLanguageItem(context, 'MR', 'marathi'.tr, 'mr'),
                _buildLanguageItem(context, 'OD', 'odia'.tr, 'od'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem(
      BuildContext context, String flag, String name, String code) {
    return GestureDetector(
      onTap: () {
        _language = name;
        Get.updateLocale(Locale(code));
        Navigator.of(context).pop();
      },
      child: Column(
        children: [
          Row(
            children: [
              Text(flag, style: TextStyle(fontSize: 24)),
              SizedBox(width: 16),
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
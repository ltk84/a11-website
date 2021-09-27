import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';

class AuthenticationDialog extends StatelessWidget {
  const AuthenticationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Dialog(
        backgroundColor: Colors.transparent,
        //elevation: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
            tileMode: TileMode.repeated,
          ),
          child: Container(
            height: 405,
            width: 400,
            decoration: BoxDecoration(
              color: Color(0xFFC6BFBF).withOpacity(0.75),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitle(
                  mainAxisAlignment: MainAxisAlignment.start,
                  subtitle: 'Authentication',
                ),
                SizedBox(
                  height: 14,
                ),
                _buildInputField('Username'),
                SizedBox(
                  height: 14,
                ),
                _buildInputField('Password'),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFA09898),
                          onPrimary: Theme.of(context).backgroundColor,
                        ),
                        child: Text('Close'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2fbd50),
                          //onPrimary: Theme.of(context).backgroundColor,
                        ),
                        child: Text('Confirm'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            title,
          ),
        ),
        Container(
          height: 36,
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:complaint_management/constants.dart';
import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';


class Settings extends StatefulWidget {
  final PanelController controller;
  const Settings({super.key, required this.controller});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(28, 10, 28, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 18, color: color2, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  widget.controller.close();
                },
                icon: Icon(
                  Icons.close_rounded,
                  size: 28,
                  color: color2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                child: Text(
                  "I would like to recieve service updates on whatsapp",
                  style: TextStyle(
                      fontSize: 13, color: color2, fontWeight: FontWeight.w600),
                ),
              ),
              Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = !switchValue;
                    });
                  },
                  thumbColor: MaterialStateProperty.all<Color>(color1),
                  inactiveThumbColor: color1,
                  inactiveTrackColor: color3,
                  trackOutlineColor: MaterialStateProperty.all<Color>(Colors.white),
                  activeColor: color2,
                  )
              
            ],
          ),
        ],
      ),
    );
  }
}

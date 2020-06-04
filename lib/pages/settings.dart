import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _volume = 1;
  double _lightness = 1.0;
  bool _emergency = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(
          fontFamily: 'LibreBaskerville',
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg8.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Card(
              child: Row(
                children: <Widget>[
                  Icon(Icons.volume_up,size: 25,),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Unit Volume',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ),
                  Slider(
                    value: _volume,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (value){
                      setState(() {
                        _volume = value;
                        print('volume is $_volume');
                      });
                    },
                  ),
                  Text('$_volume'),
                ],
              ),
            ),
            Card(
              child: Row(
                children: <Widget>[
                  Icon(Icons.lightbulb_outline,size: 25,),
                  Text(
                      'Unit Lights',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      )
                  ),
                  Slider(
                    value: _lightness,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (value){
                      setState(() {
                        _lightness = value;
                        print('lightness is $_lightness');
                      });
                    },
                  ),
                  Text('$_lightness'),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,3,8,0),
                    child: SwitchListTile(
                      title: const Text('Emergency Mode',
                        style: TextStyle(
                        fontFamily: 'LibreBaskerville',
                      ),),
                      value: _emergency,
                      onChanged: (bool value) { setState(() { _emergency = value; }); },
                      secondary: const Icon(Icons.add_alert),
                    ),
                  ),
                  Visibility(
                    visible: _emergency,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Emergency Contact",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,8,25),
                            child: TextField(decoration: InputDecoration(labelText: 'Full name')),
                          ),
                          Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InternationalPhoneNumberInput(
                                        onInputChanged: (PhoneNumber number){
                                          print(number.phoneNumber);
                                        },
                                        isEnabled: true,
                                        autoValidate: true,
                                        formatInput: true,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 2, 0),
              child: FlatButton(
                color: Colors.blueGrey,
                onPressed: (){
                  showDialog(context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Sent successfully!',
                          style:
                          TextStyle(
                            fontSize: 16,
                            fontFamily: 'LibreBaskerville',
                          ),),
                      );
                    },
                  );
                },
                child: Text(
                  'Update',
                  style:
                  TextStyle(
                    color:Colors.white,
                    fontSize: 16,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

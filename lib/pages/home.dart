import 'package:flutter/material.dart';
import 'discovery.dart';
import 'stats.dart';
import 'settings.dart';

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, '0-10'),
      Company(2, '11-25'),
      Company(3, '26-39'),
      Company(4, '40-69'),
      Company(5, 'Above 69'),
    ];
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
    List<Company> _companies = Company.getCompanies();
    List<DropdownMenuItem<Company>> _dropdownMenuItems;
    Company _selectedCompany;

    bool _sel = false;
    bool _sel2 = false;
    void initState(){
      _dropdownMenuItems = buildDropdownMenuItems(_companies);
      _selectedCompany = _dropdownMenuItems[0].value;
      super.initState();
    }
    onChangeDropdownItem(Company selectedCompany) {
      setState(() {
        _selectedCompany = selectedCompany;
      });
    }

    List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
      List<DropdownMenuItem<Company>> items = List();
      for (Company company in companies) {
        items.add(
          DropdownMenuItem(
            value: company,
            child: Text(company.name),
          ),
        );
      }
      return items;
    }

    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Smart Sleep Home Page',
          style: TextStyle(
            fontFamily: 'LibreBaskerville',
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg8.png'),
            fit: BoxFit.cover,
         ),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(5,80,5,40),
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person_outline,size: 25,),
                    Text(
                      'User Name: Terak',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle,size: 25,),
                    Text(
                      'Password: *****',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.accessibility_new,size: 25,),
                    Text(
                      'Age',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            DropdownButton(
                              value: _selectedCompany,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text('Selected: ${_selectedCompany.name}',
                      style:
                      TextStyle(
                      fontSize: 16,
                      fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Heart disease',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                    Checkbox(
                      onChanged: (bool resp){
                        setState(() {
                          _sel = resp;
                        });
                      },
                      value: _sel,
                    ),
                    Text(
                      'Sleeping disease',
                      style:
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                    Checkbox(
                      onChanged: (bool resp){
                        setState(() {
                          _sel2 = resp;
                        });
                      },
                      value: _sel2,
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
                    'Send',
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { male, female }

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  String _name = "";

  bool buttonBool = false;
  bool visibility = false;

  int _counter = 0;
  Gender _gender = Gender.male;
  String _genderString = "Male";
  String _selectedInterestString = "";

  List<String> _interestStringList = [];

  final List<String> _interests = ['Reading', 'Cooking', 'Traveling', 'Sports'];
  final Map<String, bool> _selectedInterests = {
    'Reading': false,
    'Cooking': false,
    'Traveling': false,
    'Sports': false,
  };

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text("Flutter Biodata Form"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Text('Gender',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                  ListTile(
                    title: const Text('Male'),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (value) async {
                        setState(() {
                          _gender = Gender.male;

                          if (_gender == Gender.male) {
                            _genderString = "Male";
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = Gender.female;

                          if (_gender == Gender.female) {
                            _genderString = "Female";
                          }
                        });
                      },
                    ),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text('Interest',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              Column(
                children: _interests
                    .map((interest) => CheckboxListTile(
                          title: Text(interest),
                          value: _selectedInterests[interest],
                          onChanged: (value) {
                            setState(() {
                              _selectedInterests[interest] = value == true;

                              if (_selectedInterests[interest] == true) {
                                _selectedInterestString = interest;

                                _interestStringList
                                    .add(_selectedInterestString);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Name: $_name');
                    print('Gender: $_genderString');
                    print('Interest: ' + _interestStringList.join(', '));

                    setState(() {
                      buttonBool = !buttonBool;
                    });
                    
                  },
                  child: Text('Submit'),
                ),
              ),
              
              Visibility(
                  visible: buttonBool,
                  child: Column(
                    children: [
                      Text("Name: " + _name),
                      Text("Gender: " + _genderString),
                      Text("Interest: " + _interestStringList.join(', '))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  
}

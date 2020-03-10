import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';


void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Asterix',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oxanium',
            letterSpacing: 3.0,
            color: Colors.black,
          ),),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.lightGreen[200],



      body: Center(


        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: <Widget>[


            new SizedBox(
              width: 300.0,
              height: 75.0,
              child: RaisedButton.icon(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.trashCan,
                  size: 35.0,
                  color: Colors.green[100],
                ),
                label: Text('Garbage',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    )),
                color: Colors.teal,
              ),
            ),

            new SizedBox (
              width: 300.0,
              height: 75.0,
              child: RaisedButton.icon(
                onPressed: () {},

                icon: Icon(
                  MdiIcons.barley,
                  size: 35.0,
                  color: Colors.yellow[600],
                ),
                label: Text('Farmer',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    )),
                color: Colors.teal,
              ),
            ),

            new SizedBox (
              width: 300.0,
              height: 75.0,
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Shepherd()),
                  );
                },

                icon: Icon(
                  MdiIcons.cow,
                  size: 35.0,
                  color: Colors.deepOrangeAccent[100],
                ),
                label: Text('Shepherd',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    )),
                color: Colors.teal,
              ),
            ),

            new SizedBox (
              width: 300.0,
              height: 75.0,
              child: RaisedButton.icon(
                onPressed: () {},

                icon: Icon(
                  MdiIcons.account,
                  size: 35.0,
                  color: Colors.white60,
                ),
                label: Text('New User',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,)),
                color: Colors.teal,
              ),
            ),
          ],

        ),
      ),
    );
  }
}

class Shepherd extends StatefulWidget {
  @override
  _ShepherdState createState() => _ShepherdState();
}

class _ShepherdState extends State<Shepherd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Asterix',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oxanium',
            letterSpacing: 3.0,
            color: Colors.black,
          ),),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.lightGreen[200],


      body:Column(


        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          Container(

            width: 250.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 12,
              validator: (value){
                if (value.isEmpty){
                  return 'Please your name aadhar card number';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Aadhar No.",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal[900],width: 1.0),
                ),
              ),
            ),
          ),

          Divider(
            height:30.0,

          ),

          Container(
            width: 250.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 10,
              validator: (value){
                if (value.isEmpty){
                  return 'Please your number';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Phone No.",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal[900],width: 1.0),
                ),
              ),
            ),
          ),

          Divider(
            height:50.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 0.0),
            child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("New User",
                style: TextStyle(
                  fontSize: 10.0,
                ),),

            ),
          ),
        ],

      ),

      floatingActionButton: FloatingActionButton(onPressed:
          (){},
        child: Icon(Icons.arrow_right),
        backgroundColor: Colors.teal,
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}



class _LoginData {
  String name = '';
  String phno = '';
  String dob = '';
}



class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override

  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title:Text('Asterix',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oxanium',
            letterSpacing: 3.0,
            color: Colors.black,
          ),),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.lightGreen[200],

      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(
            key: this._formKey,

            child: new ListView(
              children: <Widget>[

                new TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder:(OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                    )),
                    icon: const Icon(Icons.person,
                    color: Colors.black,),
                    hintText: 'Enter your first and last name',
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),

                Divider(
                  height:50.0,
                ),

                new Row(children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            focusedBorder:(OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                            )),
                            icon: const Icon(Icons.calendar_today,
                            color: Colors.black,),
                            hintText: 'Enter your date of birth',
                            labelText: 'Dob',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          controller: _controller,
                          keyboardType: TextInputType.datetime,
                        )),
                    new IconButton(
                      icon: new Icon(Icons.expand_more,
                      color: Colors.black,),
                      tooltip: 'Choose date',
                      color: Colors.black,
                      onPressed: (() {
                        _chooseDate(context, _controller.text);
                      }),
                    )
                  ]),

                Divider(
                  height:50.0,
                ),

                new TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder:(OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                    )),
                    icon: const Icon(Icons.phone,
                    color: Colors.black,),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                ),

                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    color: Colors.teal,
                    child: new Text(
                      'Register',
                      style: new TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: () => null,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )


              ],
            ),
          )
      ),
    );

  }

}



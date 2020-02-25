
import 'package:flutter/material.dart';
import 'AllInstances.dart';
import 'package:lazawaal/Lazawaal/Login.dart';
class LazawaalCommonFunctions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Commonfunctions();
  }

}
class Commonfunctions extends State<LazawaalCommonFunctions> {
  Widget textFields(String validation, onChange, label, hint,
      {tType: TextInputType.text, obscuretext: true, controller, submit}) {
    return TextFormField(
      obscureText: obscuretext,
      validator: (value) => value.isEmpty ? Text(validation) : validation="",
      onChanged: onChange,
      onFieldSubmitted: submit,
      controller: controller,
      keyboardType: tType,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }

  Widget buttons(text, press) {
    return RaisedButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      shape:  RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey)
      ),
      color: Colors.grey ,
      elevation: 60.0,
    );
  }

  Widget dropDownButton(regions, String currentdropdownItem) {
    var region = regions;
    var current = currentdropdownItem;

    return DropdownButton<String>(
      items: region.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (newValue) {
        current = newValue;
      },
      value: current,
    );
  }

  Widget logoImageAdd(height, margin) {
    AssetImage assetImage = new AssetImage("images/lazawaalLogo.png");
    Image image = new Image(
      image: assetImage,
      width: margin,
      height: height,
    );
    return Container(
      child: image,
    );
  }

   DatePicker (BuildContext context) {
    bool server1Selected;
    DateTime selectedDate = DateTime.now();

    Future _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1800, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
       {



    selectedDate = picked;



      }
      else {

      }
    }
//    Text("${selectedDate.toLocal()}".split(' ')[0]);
  return Column(
    children: <Widget>[

      Text("${selectedDate.toLocal()}".split(' ')[0]),
      RaisedButton(
        onPressed: () {
          _selectDate(context);
          print(selectedDate);

        },
        child: Text('Select Date'),

      ),
    ],


  );
  }

  Widget myDrawer(BuildContext context) {
    return Drawer(
      elevation: 6.0,
      child: ListView(
        children: <Widget>[

          ListTile(
              title: Row(
                children: <Widget>[Icon(Icons.home), Text('Home')],
              )),
          Divider(
            color: Colors.black,
          ),
          ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute());
              },
              title: Row(
                children: <Widget>[Icon(Icons.shopping_cart), Text('Orders')],
              )),
          Divider(
            color: Colors.black,
          ),
          ListTile(
              onTap: () async {
                Navigator.pushReplacement(context, MaterialPageRoute());
              },
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_circle),
                  Text('Logout'),
                ],
              )),
        ],
      ),
    );
  }

  PreferredSizeWidget myAppBar(BuildContext context) {

    return AppBar(
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 110.0, top: 11.0),
          child: Text(
            "HASCOL",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
        ),
        GestureDetector(
          child: Icon(Icons.shopping_cart),
          onTap: () {
            Navigator.push(context, MaterialPageRoute());
          },
        )
      ],
      backgroundColor: Colors.deepOrange,
      title: SizedBox(
        child: cFunc.logoImageAdd(160.0, 160.0),
      ),
    );
  }

  dialogBox(titleText, contextText , BuildContext context) {
    return showDialog(
        context:  context,
        builder: (BuildContext context) {
          return AlertDialog(
                title: Text(titleText),
                content: Text(contextText),
                actions: [
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )


            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


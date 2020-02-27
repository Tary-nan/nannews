import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  int number=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color.fromRGBO(133, 137, 240, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Entrez votre numero de Téléphone",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Confirmez le pays et entrez votre numero de telephone",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Code pays & Phone number",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CountryCodePicker(

                  onChanged: print,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'CI',
                  favorite: ['+226', 'BF'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,

                ))
              ],
            ),
            SizedBox(
              height:50
            ),
            Container(
              margin: EdgeInsets.only(left:50,right:50),
              decoration:BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5)
              ),
              height:50,
              
              child:Center(child: Text("Use SMS",style: TextStyle(color: Colors.white,fontSize: 20),))
            )
          ],
        ),
      ),
    );
  }
}

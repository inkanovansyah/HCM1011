import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class FormGoal extends StatefulWidget {
  const FormGoal({super.key});

  @override
  State<FormGoal> createState() => _formGoal();
}

class _formGoal extends State<FormGoal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                  'Item/Keterangan',
                  textAlign: TextAlign.start,
                  style: openSensBoldDark.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Item/Keterangan',
                  fillColor: Colors.grey[200],
                  filled: true, // Apply the fill color
                  prefixIcon: Icon(Icons.description),
                  border: InputBorder.none, // Removes the border
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Makes the label stick to the top edge
                ),
                maxLines: 5, // Makes the TextField expand vertically
                keyboardType: TextInputType
                    .multiline, // Enables multi-line input from the keyboard
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                  'Bobot',
                  textAlign: TextAlign.center,
                  style: openSensBoldDark.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bobot',
                  fillColor: Colors.grey[200],
                  filled: true, // Apply the fill color
                  prefixIcon: Icon(Icons.description),
                  border: InputBorder.none, // Removes the border
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Target',
                          textAlign: TextAlign.left,
                          style: openSensBoldDark.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                            height:
                                8), // Adds some space between the label and the input field
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true, // Apply the fill color
                            prefixIcon: Icon(Icons.description),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          maxLines: 1, // Single line input
                          keyboardType:
                              TextInputType.text, // Default single-line input
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width:
                          20), // Adds a 20-pixel gap between the two sections
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Satuan',
                          textAlign: TextAlign.left,
                          style: openSensBoldDark.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                            height:
                                8), // Adds some space between the label and the input field
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true, // Apply the fill color
                            prefixIcon: Icon(Icons.description),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          maxLines: 1, // Single line input
                          keyboardType:
                              TextInputType.text, // Default single-line input
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.00),
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to handle form submission
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: darkdarkBlueColor,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text(
                    'Save Goals Setting',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

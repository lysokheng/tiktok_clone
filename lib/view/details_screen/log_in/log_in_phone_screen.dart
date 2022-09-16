import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInPhoneScreen extends StatefulWidget {
  LogInPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LogInPhoneScreen> createState() => _LogInPhoneScreenState();
}

class _LogInPhoneScreenState extends State<LogInPhoneScreen> {
  Color backgroundColor = Colors.grey.shade800;

  Color foregroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //phone number
                TextField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixText: 'KH +855  |  ',
                    prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    prefixIconColor: Colors.white,
                    prefixStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    alignLabelWithHint: true,
                  ),
                  onChanged: (val) {
                    setState(() {
                      backgroundColor = val.isNotEmpty
                          ? Colors.redAccent
                          : Colors.grey.shade800;
                      foregroundColor =
                      val.isNotEmpty ? Colors.white : Colors.grey;
                    });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                //button
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: backgroundColor,
                              foregroundColor: foregroundColor),
                          onPressed: () {},
                          child: const Text('Send code')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

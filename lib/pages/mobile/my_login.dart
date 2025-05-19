import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final List<String> language = [
    "English",
    "Bahasa",
    "中文",
    "日本語",
    "한국어",
  ];
  late String dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = language.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      scale: 20,
                      image: AssetImage("images/google.png"),
                      fit: BoxFit.contain,
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "Sign in",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20),
              Text(
                "with your Google account to continue to YouTube. This account will be available to other Google apps in the browser.",
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              SizedBox(height: 40),
              Container(
                child: TextField(
                  cursorColor: MyColor.googleBlue,
                  style: TextStyle(fontSize: 20, color: MyColor.white),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColor.buttonGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColor.textGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Email or phone",
                    hintStyle: TextStyle(fontSize: 20, color: MyColor.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Forgot email?",
                  style: TextStyle(fontSize: 20, color: MyColor.googleBlue)),
              SizedBox(height: 40),
              RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 17, height: 1.5),
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: MyColor.textGray,
                        ),
                        text:
                            "Not your computer? Use Guest mode to make YouTube work better for you.",
                      ),
                      TextSpan(
                        style: TextStyle(
                          color: MyColor.googleBlue,
                        ),
                        text: "Learn more about using Guest mode.",
                      )
                    ]),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Text("Create account",
                        style:
                            TextStyle(fontSize: 20, color: MyColor.googleBlue)),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage1()));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: MyColor.googleBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(color: MyColor.blue),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              DropdownButton(
                  value: dropdownValue,
                  style: TextStyle(color: MyColor.white),
                  dropdownColor: MyColor.primaryColor,
                  items: language
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          )))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyLoginPage1 extends StatefulWidget {
  MyLoginPage1({super.key});

  @override
  State<MyLoginPage1> createState() => _MyLoginPage1State();
}

class _MyLoginPage1State extends State<MyLoginPage1> {
  final List<String> language = [
    "English",
    "Bahasa",
    "中文",
    "日本語",
    "한국어",
  ];
  late String dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = language.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      scale: 20,
                      image: AssetImage("images/google.png"),
                      fit: BoxFit.contain,
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColor.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "activeuser497@gmail.com",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 70),
              Container(
                child: TextField(
                  cursorColor: MyColor.googleBlue,
                  style: TextStyle(fontSize: 20, color: MyColor.white),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColor.buttonGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColor.textGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(fontSize: 20, color: MyColor.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Checkbox(
                  value: false,
                  onChanged: null,
                  fillColor: WidgetStateProperty.all(MyColor.buttonGray),
                  checkColor: MyColor.white,
                  activeColor: MyColor.googleBlue),
              SizedBox(height: 40),
              RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 17, height: 1.5),
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: MyColor.textGray,
                        ),
                        text:
                            "Not your computer? Use Guest mode to make YouTube work better for you.",
                      ),
                      TextSpan(
                        style: TextStyle(
                          color: MyColor.googleBlue,
                        ),
                        text: "Learn more about using Guest mode.",
                      )
                    ]),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Text("Create account",
                        style:
                            TextStyle(fontSize: 20, color: MyColor.googleBlue)),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: MyColor.googleBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(color: MyColor.blue),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              DropdownButton(
                  value: dropdownValue,
                  style: TextStyle(color: MyColor.white),
                  dropdownColor: MyColor.primaryColor,
                  items: language
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          )))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

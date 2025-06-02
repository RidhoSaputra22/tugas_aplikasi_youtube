import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/main.dart';
import 'package:tugas_aplikasi_youtube/models/auth.dart';
import 'package:tugas_aplikasi_youtube/models/user.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class CreateAccountPage extends StatefulWidget {
  final Function(User user) onRegister;
  final User user;
  const CreateAccountPage({
    Key? key,
    required this.onRegister,
    required this.user,
  }) : super(key: key);
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  _onRegister(User user) {
    widget.user.nama = "${firstNameController.text} ${lastNameController.text}";
    widget.onRegister(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Google logo placeholder
              CircleAvatar(
                backgroundColor: MyColor.transparent,
                backgroundImage: AssetImage(
                  'images/google.png',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Create a Google Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Enter your name"),
              const SizedBox(height: 24),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: "First name",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: "Last name (optional)",
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4285F4),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    _onRegister(widget.user);
                  },
                  child: Text("Next"),
                ),
              ),
              Spacer(),
              Divider(color: Colors.grey[800]),
              Footter()
            ],
          ),
        ),
      ),
    );
  }
}

class BasicInformationPage extends StatefulWidget {
  final User user;
  final Function(User user) onRegister;
  const BasicInformationPage({
    Key? key,
    required this.user,
    required this.onRegister,
  }) : super(key: key);

  @override
  _BasicInformationPageState createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;
  String? selectedGender;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> days = List.generate(31, (i) => '${i + 1}');
  List<String> years = List.generate(100, (i) => '${DateTime.now().year - i}');
  List<String> genders = ['Male', 'Female', 'Rather not say', 'Custom'];

  _onRegister(User user) {
    user.tanggal_lahir = DateTime(int.parse(selectedYear!),
            months.indexOf(selectedMonth!) + 1, int.parse(selectedDay!))
        .toString();
    user.gender = selectedGender!;
    user.photo = "-";
    widget.onRegister(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Google Logo
              CircleAvatar(
                backgroundColor: MyColor.transparent,
                backgroundImage: AssetImage(
                  'images/google.png',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Basic information",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text("Enter your birthday and gender",
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 24),

              // Dropdowns
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      iconSize: 0,
                      value: selectedMonth,
                      dropdownColor: Colors.grey[900],
                      hint:
                          Text("Month", style: TextStyle(color: Colors.white)),
                      items: months
                          .map((m) => DropdownMenuItem(
                              value: m,
                              child: Text(
                                m,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList(),
                      onChanged: (val) => setState(() => selectedMonth = val),
                      decoration: _inputDecoration(),
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      iconSize: 0,
                      value: selectedDay,
                      dropdownColor: Colors.grey[900],
                      hint: Text("Day", style: TextStyle(color: Colors.white)),
                      items: days
                          .map((d) => DropdownMenuItem(
                              value: d,
                              child: Text(
                                d,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList(),
                      onChanged: (val) => setState(() => selectedDay = val),
                      decoration: _inputDecoration(),
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      iconSize: 0,
                      value: selectedYear,
                      dropdownColor: Colors.grey[900],
                      hint: Text("Year", style: TextStyle(color: Colors.white)),
                      items: years
                          .map((y) => DropdownMenuItem(
                                value: y,
                                child: Text(y,
                                    style: TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                      onChanged: (val) => setState(() => selectedYear = val),
                      decoration: _inputDecoration(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                dropdownColor: Colors.grey[900],
                hint: Text("Gender", style: TextStyle(color: Colors.grey[400])),
                items: genders
                    .map((g) => DropdownMenuItem(
                        value: g,
                        child: Text(g, style: TextStyle(color: Colors.white))))
                    .toList(),
                onChanged: (val) => setState(() => selectedGender = val),
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text("Why we ask for birthday and gender",
                    style: TextStyle(color: Color(0xFF8AB4F8))),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _onRegister(widget.user);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4285F4),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text("Next"),
                ),
              ),
              Spacer(),
              Divider(color: Colors.grey[800]),
              Footter()
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xFF1F1F1F),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}

class UseExistingEmailPage extends StatefulWidget {
  final User user;
  const UseExistingEmailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UseExistingEmailPage> createState() => _UseExistingEmailPageState();
}

class _UseExistingEmailPageState extends State<UseExistingEmailPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  _register(User user) {
    print(user.toJson());
    AuthService.register(user).then((value) {
      if (value) {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              isLogin: true,
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _register(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Google Logo
              CircleAvatar(
                backgroundColor: MyColor.transparent,
                backgroundImage: AssetImage(
                  'images/google.png',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Use your existing email",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter the email address you want to use for your Google Account",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email address",
                  filled: true,
                  fillColor: Color(0xFF1F1F1F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "You’ll need to confirm that this email belongs to you",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Go to Gmail instead
                },
                child: Text(
                  "Get a Gmail address instead",
                  style: TextStyle(color: Color(0xFF8AB4F8)),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: obscurePassword.value,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  fillColor: Color(0xFF1F1F1F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: ValueListenableBuilder<bool>(
                    valueListenable: obscurePassword,
                    builder: (context, value, _) {
                      return IconButton(
                        icon: Icon(
                          value ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => obscurePassword.value = !value,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    widget.user.email = emailController.text;
                    widget.user.password = passwordController.text;
                    widget.user.photo = "-";

                    _register(widget.user);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4285F4),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text("Next"),
                ),
              ),
              Spacer(),
              Divider(color: Colors.grey[800]),
              Footter(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Footter() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DropdownButton<String>(
        dropdownColor: Colors.grey[900],
        value: 'English (United States)',
        items: [
          DropdownMenuItem(
            value: 'English (United States)',
            child: Text('English (United States)',
                style: TextStyle(color: Colors.white)),
          ),
        ],
        onChanged: (val) {},
        iconEnabledColor: Colors.white,
        underline: SizedBox(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: () {}, child: Text("Help")),
          TextButton(onPressed: () {}, child: Text("Privacy")),
          TextButton(onPressed: () {}, child: Text("Terms")),
        ],
      ),
    ],
  );
}

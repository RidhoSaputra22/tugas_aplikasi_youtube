import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/main.dart';
import 'package:tugas_aplikasi_youtube/models/auth.dart';
import 'package:tugas_aplikasi_youtube/models/user.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class SignInPage extends StatefulWidget {
  final Function(User user) onSignIn;
  final Function(User user) onCreateUser;
  final User user;
  SignInPage({
    super.key,
    required this.onSignIn,
    required this.onCreateUser,
    required this.user,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
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
              // Google Logo
              CircleAvatar(
                backgroundColor: MyColor.transparent,
                backgroundImage: AssetImage(
                  'images/google.png',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                "with your Google Account to continue to YouTube. This account will be available to other Google apps in the browser.",
                style: TextStyle(color: Colors.grey[400]),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email or phone",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Color(0xFF1F1F1F),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot email?",
                  style: TextStyle(color: Color(0xFF8AB4F8)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Not your computer? Use Private Browsing windows to sign in. ",
                style: TextStyle(color: Colors.grey[400]),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Learn more about using Guest mode",
                  style: TextStyle(color: Color(0xFF8AB4F8)),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.onCreateUser(widget.user);
                    },
                    child: Text("Create account"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.user.email = emailController.text;
                      widget.onSignIn(
                        widget.user,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4285F4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text("Next"),
                  ),
                ],
              ),
              Spacer(),

              Column(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  // final Function(User user) onSignIn;
  final User user;

  WelcomePage({
    super.key,
    // required this.onSignIn,
    required this.user,
  });

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool showPassword = false;
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _login(widget.user);
    passwordController.text = widget.user.password;
  }

  Future<void> _login(User user) async {
    final value = await AuthService.login(user.email, user.password);
    if (!mounted) return;

    if (value != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(isLogin: true),
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
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
                "Welcome",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.account_circle_outlined, color: Colors.white),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    dropdownColor: Colors.grey[900],
                    value: widget.user.email,
                    items: [
                      DropdownMenuItem(
                        value: widget.user.email,
                        child: Text(widget.user.email,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                    onChanged: (value) {},
                    underline: SizedBox(),
                    iconEnabledColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Color(0xFF1F1F1F),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: showPassword,
                    onChanged: (val) =>
                        setState(() => showPassword = val ?? false),
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                  Text("Show password", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Try another way",
                  style: TextStyle(color: Color(0xFF8AB4F8)),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    widget.user.password = passwordController.text;
                    _login(widget.user);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4285F4),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text("Next"),
                ),
              ),
              Spacer(),

              Column(
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
                    children: [
                      TextButton(onPressed: () {}, child: Text("Help")),
                      TextButton(onPressed: () {}, child: Text("Privacy")),
                      TextButton(onPressed: () {}, child: Text("Terms")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

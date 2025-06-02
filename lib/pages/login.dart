import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/main.dart';
import 'package:tugas_aplikasi_youtube/models/auth.dart';
import 'package:tugas_aplikasi_youtube/models/user.dart';
import 'package:tugas_aplikasi_youtube/widget/my_login.dart';
import 'package:tugas_aplikasi_youtube/widget/my_regist.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User(
    email: "",
    password: "",
    uid: "",
    photo: "",
    tanggal_lahir: "",
    gender: "",
    nama: "",
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: SignInPage(
        user: user,
        onSignIn: (user) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginLayout(
                child: WelcomePage(
                  user: user,
                ),
              ),
            ),
          );
        },
        onCreateUser: (user) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginLayout(
                      child: CreateAccountPage(
                        user: user,
                        onRegister: (user) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginLayout(
                                      child: BasicInformationPage(
                                        user: user,
                                        onRegister: (user) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginLayout(
                                                      child:
                                                          UseExistingEmailPage(
                                                        user: user,
                                                      ),
                                                    )),
                                          );
                                        },
                                      ),
                                    )),
                          );
                        },
                      ),
                    )),
          );
        },
      ),
    );
  }
}

class LoginLayout extends StatelessWidget {
  final Widget child;
  const LoginLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return child;
      } else {
        return Container(
          color: const Color(0xFF1F1F1F),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 1.4,
              child: child,
            ),
          ),
        );
      }
    });
  }
}

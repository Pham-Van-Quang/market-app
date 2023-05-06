import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/home_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key, required String title});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  bool isShowedPassWord = false;
  bool isPhoneFocused = false;
  bool isLockFocused = false;
  String? userNameTextError;
  String? passWordTextError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 128, bottom: 78),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 184,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: userName,
                      onTap: () => setState(() {
                        isPhoneFocused = true;
                      }),
                      onSubmitted: (value) => setState(() {
                        isLockFocused = false;
                      }),
                      decoration: InputDecoration(
                          prefixIcon: SizedBox(
                            height: 22,
                            width: 22,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/phone.svg',
                                color: isPhoneFocused
                                    ? const Color(0xff404041)
                                    : null,
                              ),
                            ),
                          ),
                          hintText: 'Username',
                          hintStyle: const TextStyle(fontSize: 16),
                          errorText: userNameTextError,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xffCECECE), width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xffFF6B00), width: 1.0))),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: passWord,
                      onTap: () => setState(() {
                        isLockFocused = true;
                      }),
                      onSubmitted: (value) => setState(() {
                        isLockFocused = false;
                      }),
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                            height: 22,
                            width: 22,
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/icons/lock.svg',
                              color: isLockFocused
                                  ? const Color(0xff404041)
                                  : null,
                            ))),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontSize: 16),
                        errorText: passWordTextError,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xffFF6B00), width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xffCECECE), width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xffFF6B00), width: 1.0)),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isShowedPassWord = !isShowedPassWord;
                            });
                          },
                          child: SizedBox(
                            width: 22,
                            child: Center(
                              child: SvgPicture.asset(
                                isShowedPassWord
                                    ? 'assets/icons/visible.svg'
                                    : 'assets/icons/invisible.svg',
                                // ignore: deprecated_member_use
                                color: isShowedPassWord
                                    ? Colors
                                        .black // set màu đen nếu đang hiển thị mật khẩu
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      obscureText: !isShowedPassWord,
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (userName.text.length < 6) {
                          setState(() {
                            userNameTextError =
                                'Username must not be less than 6 characters';
                          });
                        } else {
                          setState(() {
                            userNameTextError = null;
                          });
                        }
                        if (passWord.text.isEmpty) {
                          setState(() {
                            passWordTextError = 'Password is invalid';
                          });
                        } else {
                          setState(() {
                            passWordTextError = null;
                            userNameTextError = null;
                          });
                        }
                        if (userName.text == "0374897797" &&
                            passWord.text == "123456") {
                          setState(() {
                            Navigator.pushNamed(context, "/home_page",
                                arguments: ScreenArgument(
                                    userName: userName.text,
                                    passWord: passWord.text));
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Center(
                                        child: Text(
                                      "Notification",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    )),
                                    content: const Text(
                                        "Username or Password is not correct.\n Please, try again!"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffFF6B00)),
                                        child: const Text("Agree"),
                                      )
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF6B00),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

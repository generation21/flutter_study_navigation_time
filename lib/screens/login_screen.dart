import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/singup_screen.dart';
import 'package:navigation_time/view_models/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeURL = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final String routeURL = "/login";

  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              formData["email"]!,
              formData["password"]!,
              context,
            );
        // context.goNamed(InterestsScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "English (US)",
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: Sizes.size12,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Sizes.size12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.threads,
                  color: Colors.white,
                  size: Sizes.size24,
                ),
              ),
              Gaps.v64,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Mobile number or email",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                ),
                onSaved: (value) {
                  formData["email"] = value ?? "";
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "이메일 혹은 전화번호를 입력해주세요.";
                  }
                  return null;
                },
              ),
              Gaps.v16,
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                ),
                onSaved: (value) {
                  formData["password"] = value ?? "";
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "비밀번호를 입력해주세요.";
                  }
                  return null;
                },
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _onSubmitTap();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C65E0),
                    borderRadius: BorderRadius.circular(Sizes.size12),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gaps.v16,
              Text(
                "Forgot password?",
                style: TextStyle(
                  color: Colors.grey.shade800,
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.grey.shade100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.go(SignUpScreen.routeURL);
                print(SignUpScreen.routeURL);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: const Text(
                  "Create new account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.meta),
                Gaps.h4,
                Text("Meta"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

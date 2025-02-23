import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/view_models/signup_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final String routeURL = "/signup";

  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    ref.read(signUpProvider.notifier).signUp(context);
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
                    ref.read(signUpForm.notifier).state = {
                      "email": formData["email"]!,
                      "password": formData["password"]!,
                    };
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
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.grey.shade100,
        height: 100,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.meta),
            Gaps.h4,
            Text("Meta"),
          ],
        ),
      ),
    );
  }
}

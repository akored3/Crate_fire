// ignore_for_file: use_build_context_synchronously

import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/dialog/show_error_dialog.dart';
import 'package:crate_fire/utilities/dialog/show_password_reset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//make this page responsive
class PasswordResetView extends StatefulWidget {
  const PasswordResetView({super.key});

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateForgotPassword) {
          if (state.hasSentEmail) {
            _controller.clear();
            await showPasswordResetSentDialog(
              context,
            );
          }
          if (state.exception != null) {
            await showErrDialog(
              context,
              'An error occured',
            );
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your email to reset your password',
                style: TextStyle(fontSize: screenSize.width * 0.04),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              SizedBox(
                width: screenSize.width * 0.8,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              GradientButton(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.08,
                gradient: const LinearGradient(
                    colors: [primaryColor1, primaryColor2]),
                label: 'Reset',
                onPressed: () {
                  final email = _controller.text;
                  context.read<AuthBloc>().add(
                        AuthEventForgotPassword(email: email),
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

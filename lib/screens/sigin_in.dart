import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warranty_watch/helper/extensions/context_extention.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/helper/size.dart';
import 'package:warranty_watch/helper/utils/form_validator.dart';
import 'package:warranty_watch/provider/all_provider.dart';
import 'package:warranty_watch/provider/states/auth_states.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:warranty_watch/routes/app_routes.dart';
import 'package:warranty_watch/widget/common/custom_alert.dart';
import 'package:warranty_watch/widget/common/custom_button.dart';
import 'package:warranty_watch/widget/common/scrollable_column.dart';
import 'package:warranty_watch/widget/custom_text_field.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    late final formKey = GlobalKey<FormState>();
    CustomTextButton buildConfirmButton(
        {required String email, required String password}) {
      return CustomTextButton(
          height: size.convert(context, 60),
          width: double.infinity,
          child: Center(
            child: Consumer(
              builder: (context, ref, child) {
                final authState = ref.watch(authProvider);
                if (authState is AUTHENTICATING) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return child!;
              },
              child: Center(
                child: Text(
                  'Sign In',
                  style: context.bodyText1.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ref.read(authProvider.notifier).loginUser(
                  email: emailController.text,
                  password: passwordController.text);
            }
          });
    }

    void onAuthStateAuthenticated(String? currentUserFullName) {
      emailController.clear();
      passwordController.clear();
    }

    void onAuthStateFailed(String reason) async {
      await showDialog<bool>(
        context: context,
        builder: (ctx) {
          return CustomDialog.alert(
            title: 'Sign In Failed',
            body: reason,
            buttonText: 'Ok',
          );
        },
      );
    }

    ref.listen<AuthState>(
      authProvider,
      (previous, authState) async => authState.maybeWhen(
        failed: onAuthStateFailed,
        authenticated: onAuthStateAuthenticated,
        orElse: () {},
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ScrollableColumn(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 100, child: Image.asset('assets/app_icon.png')),
                  Text(
                    'Welcome Back!',
                    style:
                        context.headline4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please, enter your account credentials',
                    style: context.bodyText1.copyWith(
                        fontWeight: FontWeight.normal, color: Constants.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _UserDetailsState(
                  emailController: emailController,
                  passwordController: passwordController),
              SizedBox(
                height: 30,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 550),
                switchOutCurve: Curves.easeInBack,
                child: buildConfirmButton(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextButton(
                color: Constants.whiteColor,
                borderRadius: 0.0,
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: context.bodyText1.copyWith(color: Constants.grey),
                ),
                onPressed: () {
                  AppRouter.pushNamedReplacement(Routes.watchRegisterScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserDetailsState extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const _UserDetailsState(
      {required this.emailController, required this.passwordController});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            controller: emailController,
            showErrorBorder: true,
            floatingText: 'Email',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.name,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.emailValidator),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
            controller: passwordController,
            showErrorBorder: true,
            floatingText: 'Password',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.visiblePassword,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.passwordValidator),
      ],
    );
  }
}

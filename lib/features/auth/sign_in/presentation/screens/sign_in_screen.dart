import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/core/validation/validators.dart';
import 'package:store_app/core/widgets/app_button.dart';
import 'package:store_app/core/widgets/form.dart';

class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final emailFocus = useFocusNode();
    final passwordFocus = useFocusNode();

    final isPasswordHidden = useState(true);

    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: 90.h,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 240.w,
                    height: 72.h,
                    child: Image.asset(
                      AppAssets.route,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.xlVertical,
                    child: Text(
                      context.tr.emailAddress,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                  CustomTextField(
                    validator: (value) =>
                        Validators.validateEmail(context, value),
                    focusNode: emailFocus,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        passwordFocus,
                      );
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: context.tr.enterEmailAddress,
                  ),
                  Padding(
                    padding: AppSpacing.xlVertical,
                    child: Text(
                      context.tr.password,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                  CustomTextField(
                    validator: (value) =>
                        Validators.validatePassword(context, value),
                    focusNode: passwordFocus,
                    controller: passwordController,
                    obscureText: isPasswordHidden.value,
                    textInputAction: TextInputAction.done,
                    hintText: context.tr.enterYourPassword,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordHidden.value = !isPasswordHidden.value;
                      },
                      icon: Icon(
                        isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        context.tr.forgotPassword,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.xxlVertical,
                    child: AppButton(
                      text: context.tr.login,
                      onPressed: () {
                        if (formKey.currentState!.validate()) return;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr.dontHaveAccount,
                        style: context.textTheme.headlineSmall,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          context.tr.createAccount,
                          style: context.textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/extensions/context_navigation.dart';
import 'package:store_app/core/navigation/app_routes.dart';
import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/core/utils/dialogs.dart';
import 'package:store_app/core/validation/validators.dart';
import 'package:store_app/core/widgets/app_button.dart';
import 'package:store_app/core/widgets/form.dart';

import 'package:store_app/features/auth/sign_in/data/model/sign_in_request.dart';
import 'package:store_app/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:store_app/features/auth/sign_in/presentation/cubit/sing_in_state.dart';

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

    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        switch (state) {
          case SignInInitial():
            break;

          case SignInLoading():
            break;

          case SignInSuccess():
            DialogUtils.showSnackBar(
              context,
              context.tr.success,
            );

            Navigator.pushReplacementNamed(
              context,
              AppRoutes.homeView,
            );

            break;

          case SignInFailure(failure: final failure):
            DialogUtils.showSnackBar(
              context,
              failure.message,
              backgroundColor: context.colorScheme.error,
            );

            break;
        }
      },
      builder: (context, state) {
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
                        controller: emailController,
                        focusNode: emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: context.tr.enterEmailAddress,
                        validator: (value) =>
                            Validators.validateEmail(context, value),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(
                            passwordFocus,
                          );
                        },
                      ),
                      Padding(
                        padding: AppSpacing.xlVertical,
                        child: Text(
                          context.tr.password,
                          style: context.textTheme.headlineSmall,
                        ),
                      ),
                      CustomTextField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        textInputAction: TextInputAction.done,
                        hintText: context.tr.enterYourPassword,
                        obscureText: isPasswordHidden.value,
                        validator: (value) =>
                            Validators.validatePassword(context, value),
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
                          onPressed: () {
                            context.pushNamed(AppRoutes.forgetPasswordView);
                          },
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
                          isLoading: state is SignInLoading,
                          onPressed: state is SignInLoading
                              ? null
                              : () {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }

                                  final request = SignInRequestModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );

                                  context.read<SignInCubit>().signIn(request);
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
                            onPressed: () {
                              context.pushNamed(AppRoutes.registerView);
                            },
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
      },
    );
  }
}

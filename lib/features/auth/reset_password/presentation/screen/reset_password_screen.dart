import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
import 'package:store_app/features/auth/reset_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:store_app/features/auth/reset_password/presentation/cubit/forgot_password_state.dart';

class ResetPasswordScreen extends HookWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();

    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ForgotPasswordInitial():
            break;

          case ForgotPasswordLoading():
            break;

          case ForgotPasswordSuccess(message: final message):
            DialogUtils.showSnackBar(
              context,
              message,
            );

            context.pushNamed(AppRoutes.verifyView,  arguments: emailController.text.trim(),
);
            break;

          case ForgotPasswordFailure(message: final message):
            DialogUtils.showSnackBar(
              context,
              message,
              backgroundColor: context.colorScheme.error,
            );
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(),
          body: Padding(
            padding: AppSpacing.lgAll,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.forgetPassword,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: AppSpacing.xlAll,
                    child: Text(
                      context.tr.forgotPassword,
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                  Text(
                    context.tr.forgotPasswordDontWorry,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSpacing.xxl,
                  ),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (value) =>
                        Validators.validateEmail(context, value),
                    hintText: context.tr.enterEmailAddress,
                  ),
                  SizedBox(
                    height: AppSpacing.xxl,
                  ),
                  AppButton(
                    text: context.tr.sendCode,
                    isLoading: state is ForgotPasswordLoading,
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      context.read<ForgotPasswordCubit>().forgotPassword(
                            emailController.text.trim(),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

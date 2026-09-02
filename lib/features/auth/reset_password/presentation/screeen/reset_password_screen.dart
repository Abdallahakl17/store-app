import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
 import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/core/utils/dialogs.dart';
import 'package:store_app/core/validation/validators.dart';
import 'package:store_app/core/widgets/app_button.dart';
import 'package:store_app/core/widgets/form.dart';

import 'package:store_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:store_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';

class ResetPasswordScreen extends HookWidget {
  const ResetPasswordScreen({
    required this.email,
    super.key,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final passwordController = useTextEditingController();

    final isPasswordHidden = useState(true);

    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ResetPasswordInitial():
            break;

          case ResetPasswordLoading():
            break;

          case ResetPasswordSuccess():
            DialogUtils.showSnackBar(
              context,
              context.tr.passwordResetSuccessfully,
            );

            // context.pushNamed(AppRoutes.homeView);
            break;

          case ResetPasswordFailure(message: final message):
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

          body: SingleChildScrollView(
            child: Padding(
              padding: AppSpacing.lgAll,

              child: Form(
                key: formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset(
                      AppAssets.resetPassword,
                      fit: BoxFit.contain,
                    ),

                    Padding(
                      padding: AppSpacing.xlAll,

                      child: Text(
                        context.tr.resetYourPassword,
                        style: context.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      context.tr.enterNewPassword,
                      style: context.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: AppSpacing.xxl,
                    ),

                    CustomTextField(
                      controller: passwordController,

                      keyboardType: TextInputType.visiblePassword,

                      textInputAction: TextInputAction.done,

                      validator: (value) =>
                          Validators.validatePassword(
                        context,
                        value,
                      ),

                      labelText: context.tr.newPassword,

                      obscureText: isPasswordHidden.value,

                      suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordHidden.value =
                              !isPasswordHidden.value;
                        },

                        icon: Icon(
                          isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: AppSpacing.xxl,
                    ),

                    AppButton(
                      text: context.tr.resetPassword,

                      isLoading: state is ResetPasswordLoading,

                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        context
                            .read<ResetPasswordCubit>()
                            .resetPassword(
                              email: email,
                              newPassword:
                                  passwordController.text.trim(),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
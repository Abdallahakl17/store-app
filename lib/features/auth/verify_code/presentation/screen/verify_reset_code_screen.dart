import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/core/utils/dialogs.dart';
import 'package:store_app/core/widgets/app_button.dart';

import 'package:store_app/features/auth/reset_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:store_app/features/auth/verify_code/presentation/cubit/verify_reset_code_cubit.dart';
import 'package:store_app/features/auth/verify_code/presentation/cubit/verify_reset_code_state.dart';

class VerifyResetCodeScreen extends HookWidget {
  const VerifyResetCodeScreen({
    required this.email,
    super.key,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final code = useState('');
   final seconds = useState(60);

final timer = useRef<Timer?>(null);

void startTimer() {
  timer.value?.cancel();

  timer.value = Timer.periodic(
    const Duration(seconds: 1),
    (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    },
  );
}

useEffect(() {
  startTimer();

  return () {
    timer.value?.cancel();
  };
}, []);

    return BlocConsumer<VerifyResetCodeCubit, VerifyResetCodeState>(
      listener: (context, state) {
        switch (state) {
          case VerifyResetCodeInitial():
            break;

          case VerifyResetCodeLoading():
            break;

          case VerifyResetCodeSuccess(message: final message):
            DialogUtils.showSnackBar(
              context,
              message,
            );

            // بعدين نروح لـ Reset Password
            break;

          case VerifyResetCodeFailure(message: final message):
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
            padding: AppSpacing.xlAll,
            child: Column(
              children: [
                Image.asset(
                  AppAssets.checkEmail,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: AppSpacing.xlAll,
                  child: Text(
                    context.tr.checkYourMail,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: AppSpacing.xlAll,
                  child: Text(
                    context.tr.checkYourMailDescription,
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                MaterialPinField(keyboardType: TextInputType.number,
                   length: 6,
                  obscureText: false,
                  onCompleted: (value) {
                    code.value = value;
                  },
                ),
                Padding(
                  padding: AppSpacing.xlAll,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr.didntReceiveCode,
                        style: context.textTheme.titleSmall,
                      ),
                      if (seconds.value > 0) ...[
                        const SizedBox(width: 4),
                        Text(
                          '00:${seconds.value.toString().padLeft(2, '0')}',
                          style: context.textTheme.titleSmall,
                        ),
                      ] else
                        TextButton(
                          onPressed: () {
                            seconds.value = 60;

                            startTimer();

                            context
                                .read<ForgotPasswordCubit>()
                                .forgotPassword(email);
                          },
                          child: Text(
                            context.tr.resendCode,
                          ),
                        ),
                    ],
                  ),
                ),
                AppButton(
                  text: context.tr.verifyCode,
                  isLoading: state is VerifyResetCodeLoading,
                  onPressed: () {
                    if (code.value.length != 6) {
                      return;
                    }

                    context
                        .read<VerifyResetCodeCubit>()
                        .verifyResetCode(code.value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

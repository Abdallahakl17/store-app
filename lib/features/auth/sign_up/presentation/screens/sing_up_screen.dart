import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/utils/dialogs.dart';
import 'package:store_app/core/validation/validators.dart';
import 'package:store_app/core/widgets/app_button.dart';
import 'package:store_app/core/widgets/form.dart';
import 'package:store_app/features/auth/sign_up/data/models/signup_request_model.dart';
import 'package:store_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:store_app/features/auth/sign_up/presentation/cubit/signup_state.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repasswordController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isPasswordHidden = useState(true);
    final isRePasswordHidden = useState(true);
    final nameFocus = useFocusNode();
    final emailFocus = useFocusNode();
    final passwordFocus = useFocusNode();
    final rePasswordFocus = useFocusNode();
    final phoneFocus = useFocusNode();
    return BlocConsumer<SignupCubit, SignupState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        context.tr.fullName,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      focusNode: nameFocus,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(phoneFocus);
                      },
                      validator: (value) =>
                          Validators.validateName(context, value),
                      hintText: context.tr.enterFullName,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        context.tr.mobileNumber,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      focusNode: phoneFocus,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          Validators.validatePhone(context, value),
                      controller: phoneController,
                      hintText: context.tr.enterMobileNumber,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        context.tr.emailAddress,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      focusNode: emailFocus,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(passwordFocus);
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          Validators.validateEmail(context, value),
                      controller: emailController,
                      hintText: context.tr.enterEmailAddress,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        context.tr.password,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    CustomTextField(
                      focusNode: passwordFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(rePasswordFocus);
                      },
                      validator: (value) =>
                          Validators.validatePassword(context, value),
                      controller: passwordController,
                      obscureText: isPasswordHidden.value,
                      hintText: context.tr.enterpassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            isPasswordHidden.value = !isPasswordHidden.value;
                          },
                          icon: Icon(isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        context.tr.rePassword,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    CustomTextField(
                      controller: repasswordController,
                      focusNode: rePasswordFocus,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) => Validators.validateConfirmPassword(
                        context,
                        value,
                        passwordController.text,
                      ),
                      obscureText: isRePasswordHidden.value,
                      hintText: context.tr.confirmYourPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          isRePasswordHidden.value = !isRePasswordHidden.value;
                        },
                        icon: Icon(
                          isRePasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                    ),
                    AppButton(
                      text: context.tr.signUp,
                      isLoading: state is SignupLoading,
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;

                        context.read<SignupCubit>().signUp(
                              SignupRequestModel(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text,
                                rePassword: repasswordController.text,
                                phone: phoneController.text.trim(),
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      switch (state) {
        case SignupInitial():
          break;

        case SignupLoading():
          break;

        case SignupSuccess():
          DialogUtils.showSnackBar(
            context,
            context.tr.success,
          );
          break;

        case SignupFailure(failure: final message):
          DialogUtils.showSnackBar(
            context,
            message.message,
            backgroundColor: context.colorScheme.error,
          );
          break;
      }
    });
  }
}

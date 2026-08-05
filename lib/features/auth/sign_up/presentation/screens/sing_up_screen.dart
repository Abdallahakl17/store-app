import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/extensions/context_config.dart';
import 'package:store_app/core/extensions/context_localization.dart';
import 'package:store_app/core/widgets/app_button.dart';
import 'package:store_app/core/widgets/form.dart';

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
    final phoneFocus = useFocusNode();
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                  controller: phoneController,
                  hintText: context.tr.enterMobileNumber,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Text(
                    context.tr.emailAddress,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                CustomTextField(
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
                  obscureText: isRePasswordHidden.value,
                  controller: repasswordController,
                  hintText: context.tr.confirmYourPassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        isRePasswordHidden.value = !isRePasswordHidden.value;
                      },
                      icon: Icon(isRePasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility)),
                ),
                SizedBox(
                  height: 56.h,
                ),
                AppButton(text: context.tr.signUp, onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

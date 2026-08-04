import 'package:flutter/material.dart';
import 'package:store_app/core/assets/app_assets.dart';
import 'package:store_app/core/theme/app_color_scheme.dart';
import 'package:store_app/core/theme/app_spacing.dart';
import 'package:store_app/core/validation/validators.dart';
import 'package:store_app/core/widgets/form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final labelStyle = theme.textTheme.titleMedium?.copyWith(
      color: colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: AppColorScheme.light.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.lgAll,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.xl),

                Center(
                  child: Image.asset(
                    AppAssets.route,
                    height: 90,
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Full Name
                Text('Full Name', style: labelStyle),
                const SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'enter your full name',
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => Validators.validateName(context, value),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Mobile Number
                Text('Mobile Number', style: labelStyle),
                const SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'enter your mobile no.',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      Validators.validatePhone(context, value),
                ),

                const SizedBox(height: AppSpacing.lg),

                // E-mail address
                Text('E-mail address', style: labelStyle),
                const SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      Validators.validateEmail(context, value),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Password
                Text('Password', style: labelStyle),
                const SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'enter your password',
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) =>
                      Validators.validatePassword(context, value),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Sign up button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _onSignUpPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.onPrimary, // أبيض
                      foregroundColor: colorScheme.primary, // نص كحلي
                    ),
                    child: const Text('Sign up'),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

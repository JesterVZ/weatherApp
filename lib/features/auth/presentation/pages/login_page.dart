import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/features/register/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => AppUI.appScaffold(
      AppColors.white,
      Padding(
        padding: AppUI.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTitle(), _buildForm()],
        ),
      ));

  Widget _buildTitle() => SizedBox(
        height: 66,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Вход',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Введите данные для входа',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.gray1),
            )
          ],
        ),
      );

  _buildForm() => Form(
          child: ListView(
        shrinkWrap: true,
        children: [
          _buildTextField(emailController, 'Email'),
          AppUI.contentVerticalSpacing,
          _buildTextField(passwordController, 'Пароль'),
          AppUI.contentVerticalSpacing,
          _buildButton(),
          AppUI.contentVerticalSpacing,
          _buildRegisterTextLink()
        ],
      ));

  _buildRegisterTextLink() => Align(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(
              text: "Регистрация",
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
              },
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.appColor))));

  _buildTextField(TextEditingController controller,
          [String? label, bool obscureText = false]) =>
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
        ),
      );
  _buildButton() =>
      ElevatedButton(onPressed: () {}, child: const Text("Войти"));
}

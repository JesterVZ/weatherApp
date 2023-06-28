import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          'Регистрация',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Введите данные для резистрации',
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
          _buildButton()
        ],
      ));

  _buildTextField(TextEditingController controller,
      [String? label, bool obscureText = false]) =>
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
        ),
      );
  _buildButton() => ElevatedButton(onPressed: (){}, child: const Text("Зарегестрироваться"));
}

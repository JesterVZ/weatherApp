import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/injection_container.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/core/presentation/widgets/indicator.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/content/presentation/pages/content_page.dart';
import 'package:weather_app/features/register/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final bloc = locator<AuthBloc>();

  bool loading = false;
  String? errorText;

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                loading = true;
              },
              login: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContentPage()),
                      (route) => false);
                });
              },
              error: (failure) {
                loading = false;
                errorText = "Неправильный логин или пароль";
              },
            );
            return AppUI.appScaffold(
                backgroundColor: AppColors.white,
                Padding(
                  padding: AppUI.contentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (errorText != null) _buildErrorHeader(),
                      _buildTitle(),
                      _buildForm()
                    ],
                  ),
                ));
          },
        ),
      );

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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
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
  _buildButton() => ElevatedButton(
      onPressed: !loading
          ? () {
              bloc.add(Login(emailController.text, passwordController.text));
            }
          : null,
      child: loading ? const ButtonProgressIndicator() : const Text("Войти"));
  _buildErrorHeader() => Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: AppUI.borderRadius1,
        ),
        child: Center(
          child: Text(
            errorText ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.white),
          ),
        ),
      );
}

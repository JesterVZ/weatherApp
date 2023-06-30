import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/injection_container.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/core/presentation/widgets/indicator.dart';
import 'package:weather_app/features/register/presentation/bloc/registration_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final bloc = locator<RegistrationBloc>();

  bool loading = false;
  String? errorText;

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            state.when(
                initial: () {},
                loading: () {
                  loading = true;
                },
                register: () {
                  loading = false;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pop(context);
                  });
                  
                },
                error: (failure) {
                  errorText = "Неправильный логин или пароль";
                });

            return AppUI.appScaffold(
                 backgroundColor: AppColors.white,
                Padding(
                  padding: AppUI.contentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(errorText != null) _buildErrorHeader(),
                      _buildTitle(), _buildForm()],
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
          _buildTextField(passwordController, 'Пароль', true),
          AppUI.contentVerticalSpacing,
          _buildTextField(repeatPasswordController, 'Повторите вароль', true),
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
  _buildButton() => ElevatedButton(
      onPressed: !loading
          ? () {
              bloc.add(Register(emailController.text, passwordController.text));
            }
          : null,
      child: loading
          ? const ButtonProgressIndicator()
          : const Text("Зарегестрироваться"));
  _buildErrorHeader() => Container(
    height: 40,
    decoration: BoxDecoration(
      color: AppColors.red,
      borderRadius: AppUI.borderRadius1,
    ),
    child: Center(child: Text(errorText ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),), ),
  );
}

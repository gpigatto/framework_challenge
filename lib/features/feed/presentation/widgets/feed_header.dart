import 'package:flutter/material.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';
import 'package:framework_challenge/features/login/presentation/pages/login.dart';
import 'package:framework_challenge/features/login/presentation/widgets/logout_dialog.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedHeader extends StatefulWidget {
  const FeedHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedHeader> createState() => _FeedHeaderState();
}

class _FeedHeaderState extends State<FeedHeader> {
  @override
  void initState() {
    context.read<GetLoggedBloc>().add(GetLoggedLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text('Aqui você encontra as melhores frutas'),
        _avatar(true),
      ],
    );
  }

  _text(text) {
    const _size = 24.0;
    const _weight = FontWeight.w800;

    return Flexible(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: _size,
          fontWeight: _weight,
        ),
      ),
    );
  }

  _avatar(logged) {
    const _logOutIcon = Icons.logout;
    const _logInicon = Icons.login;

    const _borderColor = Colors.green;
    const _iconColor = Colors.green;

    return BlocBuilder<GetLoggedBloc, GetLoggedState>(
      builder: (context, state) {
        if (state is GetLoggedLoaded) {
          if (state.logged) {
            return Button(
              borderColor: _borderColor,
              icon: _logOutIcon,
              iconColor: _iconColor,
              function: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return LogoutDialog();
                  },
                );
              },
            );
          } else {
            return Button(
              borderColor: _borderColor,
              icon: _logInicon,
              iconColor: _iconColor,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
            );
          }
        }

        return const SizedBox();
      },
    );
  }
}

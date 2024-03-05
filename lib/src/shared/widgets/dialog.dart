// Contain Dialog reuse in app
import 'package:bloc_starter/src/bloc/theme/theme_cubit.dart';
import 'package:bloc_starter/src/shared/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/locale/locale_cubit.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var localeCubit = BlocProvider.of<LocaleCubit>(context);

    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text("Locale"),
        content: Container(
          constraints: const BoxConstraints(maxHeight: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: supportLanguages
                .map((locale) => ListTile(
                      title: Text("${locale.languageCode}-${locale.countryCode}"),
                      onTap: () async {
                        localeCubit.changeLocale(context, locale);
                        context.pop();
                      },
                    ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context);

    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text("Select Theme"),
        content: Container(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: supportsTheme.entries
                  .map((theme) => ListTile(
                        title: Text(theme.value),
                        onTap: () async {
                          themeCubit.setTheme(theme.key);
                          context.pop();
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}

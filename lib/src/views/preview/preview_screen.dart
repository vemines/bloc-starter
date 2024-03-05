import '../../../gen/assets.gen.dart';
import '../../../gen/l10n.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/dimens.dart';
import '../../shared/extensions/extensions.dart';
import '../../shared/widgets/common.dart';
import '../../shared/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../shared/theme/theme_extension.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview")),
      body: ListView(
        children: [
          Center(
            child: FilledButton(
              onPressed: () => context.go(Routes.developingRoute),
              child: const Text("Go to developing screen"),
            ),
          ),
          Center(
            child: FilledButton(
              onPressed: () => context.go(Routes.posts),
              child: const Text("Go to post screen"),
            ),
          ),
          const _TextStylePreview(),
          const _ImagePreview(),
          const _ThemePreview(),
          const _LocalePreview(),
        ].separateCenter(16, true),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // If use in android must use comments widget
        const Text("PNG"),
        Image.asset(Assets.png.avataaars.path.prefixAssets(), width: 100),
        // Assets.png.avataaars.image(),
        const Text("JPG"),
        Image.asset(Assets.jpg.sample.path.prefixAssets(), width: 300),
        // Assets.jpg.sample.image(),
        const Text("SVG"),
        SvgPicture.asset(Assets.svg.fileDoc.path.prefixAssets(), width: 100),
        // Assets.svg.fileDoc.svg(),
      ].separateCenter(8),
    );
  }
}

class _TextStylePreview extends StatelessWidget {
  const _TextStylePreview();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("displayLarge", style: textTheme.displayLarge),
        Text("displayMedium", style: textTheme.displayMedium),
        Text("displaySmall", style: textTheme.displaySmall),
        Text("headlineLarge", style: textTheme.headlineLarge),
        Text("headlineMedium", style: textTheme.headlineMedium),
        Text("headlineSmall", style: textTheme.headlineSmall),
        Text("titleLarge", style: textTheme.titleLarge),
        Text("titleMedium", style: textTheme.titleMedium),
        Text("titleSmall", style: textTheme.titleSmall),
        Text("bodyLarge", style: textTheme.bodyLarge),
        Text("bodyMedium", style: textTheme.bodyMedium),
        Text("bodySmall", style: textTheme.bodySmall),
        Text("labelLarge", style: textTheme.labelLarge),
        Text("labelMedium", style: textTheme.labelMedium),
        Text("labelSmall", style: textTheme.labelSmall),
      ].separateAll(8),
    );
  }
}

class _ThemePreview extends StatelessWidget {
  const _ThemePreview();

  Widget _colorWidget(String title, Color color) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          gapN(),
          Container(height: 80, width: 80, color: color),
        ],
      );

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var colorThemeExt = (Theme.of(context).extension<CustomColors>() ?? darkExt).colorTheme;
    return Wrap(
      spacing: Dimensions.normal,
      runSpacing: Dimensions.normal,
      alignment: WrapAlignment.center,
      children: [
        _colorWidget("Primary", colorTheme.primary),
        _colorWidget("Success", colorThemeExt.success),
        _colorWidget("Info", colorThemeExt.info),
        _colorWidget("Warning", colorThemeExt.warning),
        divider4B(),
        FilledButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => const ThemeDialog(),
            );
          },
          child: const Text(
            "Change theme",
          ),
        )
      ],
    );
  }
}

class _LocalePreview extends StatelessWidget {
  const _LocalePreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: FilledButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => const LanguageDialog(),
              );
            },
            child: const Text("Open Language Dialog"),
          ),
        ),
        Text(S.current.hello),
        Text(S.current.param("VeMines")),
      ].separateAll(),
    );
  }
}

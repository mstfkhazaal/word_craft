// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_colors.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_colors;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_durations.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_durations;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_fonts.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_fonts;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_opacity.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_opacity;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_radius.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_radius;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_shadows.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_shadows;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_size.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_size;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_spacing.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_spacing;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_typography.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_typography;
import 'package:widgetbook_catalog/widgetbook/use_cases/foundations/app_z_index.dart'
    as _widgetbook_catalog_widgetbook_use_cases_foundations_app_z_index;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/atoms/buttons/app_button.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/atoms/logos/app_brand_logo.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_logos_app_brand_logo;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/atoms/text/app_text.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_text_app_text;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/molecules/logos/app_logo.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/templates/app_auth_pages.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages;
import 'package:widgetbook_catalog/widgetbook/use_cases/widgets/templates/app_welcome_page_template.dart'
    as _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_welcome_page_template;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'theme',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AppColors',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'material color scheme',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_colors
                    .materialColorScheme,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'semantic colors',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_colors
                    .semanticColors,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AppRadius',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'radius tokens',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_radius
                    .radiusTokens,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AppSize',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'size tokens',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_size
                    .sizeTokens,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AppSpacing',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'layout preview',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_spacing
                    .spacingLayoutPreview,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'spacing scale',
            builder:
                _widgetbook_catalog_widgetbook_use_cases_foundations_app_spacing
                    .spacingScale,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgetbook',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'use_cases',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'foundations',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppDurationsPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'duration tokens',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_durations
                            .durationTokens,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppFontPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'arabic weights',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_fonts
                            .arabicWeights,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'font families',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_fonts
                            .fontFamilies,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'inter weights',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_fonts
                            .interWeights,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppOpacityPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'opacity tokens',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_opacity
                            .opacityTokens,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppShadowsPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'shadow tokens',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_shadows
                            .shadowTokens,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppTypographyPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'ibm plex sans arabic rtl',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_typography
                            .ibmPlexSansArabicRtl,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'inter ltr',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_typography
                            .interLtr,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppZIndexPreview',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'z-index tokens',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_foundations_app_z_index
                            .zIndexTokens,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'atoms',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'buttons',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppButton',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'all sizes',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .allSizes,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'disabled',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .disabled,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'matrix',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .matrix,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'outline',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .outline,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'primary',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .primary,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'secondary',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_buttons_app_button
                            .secondary,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'logos',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppBrandLogo',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'colors',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_logos_app_brand_logo
                            .logoColors,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'default',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_logos_app_brand_logo
                            .defaultLogo,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'sizes',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_logos_app_brand_logo
                            .logoSizes,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'text',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppText',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'arabic rtl',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_text_app_text
                            .arabicRtl,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'form text',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_text_app_text
                            .formText,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'overflow',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_text_app_text
                            .overflow,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'variants',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_atoms_text_app_text
                            .variants,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'molecules',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'logos',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppLogo',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'compact',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .compact,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'horizontal',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .horizontal,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'label',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .label,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'mark',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .mark,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'matrix',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .matrix,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'on primary',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .onPrimary,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'rtl',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .rtl,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'sizes',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .sizes,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'theme debug',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .themeDebug,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'vertical',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_molecules_logos_app_logo
                            .vertical,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'templates',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'auth',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppAuthPageTemplate',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'forgot password',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .forgotPassword,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'login',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .login,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'matrix',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .authMatrix,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'register',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .register,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'reset password',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .resetPassword,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'verify code',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_auth_pages
                            .verifyCode,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'welcome',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppWelcomePageTemplate',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'desktop',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_welcome_page_template
                            .desktopWelcomePage,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'matrix',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_welcome_page_template
                            .welcomePageMatrix,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'mobile',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_welcome_page_template
                            .mobileWelcomePage,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'tablet',
                    builder:
                        _widgetbook_catalog_widgetbook_use_cases_widgets_templates_app_welcome_page_template
                            .tabletWelcomePage,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];

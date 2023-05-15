# Base Project for Flutter

1. [Setup](#setup)
2. [After Setup](#after-setup)
3. [Theming](#theming)
4. [Localization](#localization)
5. [Extensions - No documentation atm](#setup)
6. [Token reading / writing - No documentation atm](#setup)
7. [HTTP API Service (Dio) - No documentation atm](#setup)
8. [Local Notification Service - No documentation atm](#setup)
9. [Components - No documentation atm](#setup)

## Setup

1. Create a Flutter project
2. Clone this project somewhere `git clone https://github.com/kapoOrgani/baseproject.git`
3. Copy the **baseproject clone** files and folders and paste into the Flutter project folder that **you created** earlier
4. Change the title of the **MaterialApp** in main.dart file and **pubspec.yaml** file
5. Run `flutter pub get`
6. Change the **compileSdkVersion to 33** and **minSdkVersion to atleast 21** in /android/app/build.gradle

## After Setup
There are no pages in Home Screen which will cause an error. To solve that issue you have to create at least 2 pages in views/home/pages folder (if you don't have the pages folder, you can create one or you can create something else).
After creating the pages, you have to initialize them in **home_provider** -> navPages list.

In **SplashScreen**, it will go to the **SplashProvider** and get the datas if anything needed at the first start (for example: is user logged in before? if user has logged in then navigate to HomeScreen). 
You can change the logo image's path and the text etc. in **SplashScreen**.

## Theming

1. [Color Scheme](#color-scheme)
2. [Text Theme](#text-theme)
3. [Style Extension](#style-extension)
4. [App Theme](#app-theme)

### Color Scheme

#### Creating / Editing Colors
The colors stored in **lib/theme/color/color_schemes.dart** file. 

You can get the colors via back-end (you have to enable getColors function) but you have to be careful with the names.

If you are not getting the colors via back-end, then you can change the **_colors** Map's key and value (to use them you have to generate getter that indicates the color).

For example:
- in _colors:
```
"blue": "0000FF",
```
- the getter:
```
Color get blue => HexColor.fromHex(_colors['blue']!);
```

#### Using Colors

You can use any color, wherever you want with this one line of code: 
`ColorSchemes.instance.colorName`

### Text Theme

The text theme linked to MaterialApp via AppTheme but if you want to use specific font style you can use **context**.

For example:
`context.textTheme.bodyText1`

#### Font Family

You can change the font family by changing the **_fontStyle**'s fontFamily property. You can use GoogleFonts if you want to.

#### Font Styles
Font styles includes text color, size, weight, style (normal, italic etc.), letterSpacing etc. To change font styles, you have to change a specific style.

For example:
```
headline1: _fontStyle.copyWith(
  color: _colorScheme.black,
  fontSize: 84,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.normal,
  letterSpacing: -1.5,
),
```

### Style Extension

In style extension, we have the theme, textTheme, paddings, border radiuses, radiuses and withColor extension (you can use it with fontStyles for example: `context.textTheme.bodyText1!.withColor(ColorSchemes.instance.colorName)`).

To use any style you need a context and you can use it by typing for example: `context.normalPadding` or `context.smallBorderRadius` or `context.textTheme.bodyText1` etc.

### App Theme

App theme is the base of the theming. We link the AppTheme to MaterialApp's theme property `theme: AppTheme.instance.theme`.

You can control the style (ThemeData) of the app in app_theme.dart file. You can change the styles of, for example: AppBar, BottomNavigationBar, ScaffoldBackgroundColor, Button, Input etc.

## Localization

Localization uses flutter_localization and intl package. In **main.dart** these 2 lines links the localization to the app: 
```
localizationsDelegates: AppLocalizations.localizationsDelegates,
supportedLocales: AppLocalizations.supportedLocales,
```
You have to move the l10n.yaml file in your project. If you do not move the l10n.yaml file in your project it will not work.

You can change your settings in l10n.yaml file. 

You can create a localization by making an .arb file in l10n folder.
- The name of the file should start with app_ (for example: app_en.arb)
- Do not use , to end the line at the end of the page, it will crash the app

You can use the localization by importing the package by manually in your .dart file 
`import 'package:flutter_gen/gen_l10n/app_localizations.dart';` 
and writing this one line of code
`AppLocalizations.of(context)!.yourVariable`.

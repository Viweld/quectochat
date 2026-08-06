import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/presentation/home_screen/widgets/home_drawer/home_drawer.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

void main() {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> pumpDrawer(
    WidgetTester tester, {
    String displayName = 'Иван Петров',
    bool canInvite = true,
    VoidCallback? onLogoutTapped,
  }) async {
    await tester.pumpWidget(
      DynamicTheme(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeBuilder.getTheme(ThemeType.regular),
          home: Scaffold(
            key: scaffoldKey,
            drawer: HomeDrawer(
              displayName: displayName,
              canInvite: canInvite,
              isLogoutPending: false,
              onProfileTapped: () {},
              onAddUserTapped: () {},
              onLogoutTapped: onLogoutTapped ?? () {},
            ),
            body: const SizedBox.shrink(),
          ),
        ),
      ),
    );

    scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();
  }

  testWidgets('shows initials, full name and menu items', (WidgetTester tester) async {
    await pumpDrawer(tester);

    expect(find.text('ИВ'), findsOneWidget);
    expect(find.text('Иван Петров'), findsOneWidget);
    expect(find.text('Профиль'), findsOneWidget);
    expect(find.text('Добавить пользователя'), findsOneWidget);
    expect(find.text('Выйти'), findsOneWidget);
  });

  testWidgets('falls back to placeholder when profile is not loaded', (WidgetTester tester) async {
    await pumpDrawer(tester, displayName: '');

    expect(find.text('Без имени'), findsOneWidget);
    expect(find.byType(AppUserAvatar), findsNothing);
  });

  testWidgets('hides add user when canInvite is false', (WidgetTester tester) async {
    await pumpDrawer(tester, canInvite: false);

    expect(find.text('Добавить пользователя'), findsNothing);
  });

  testWidgets('logout button reports taps', (WidgetTester tester) async {
    int logoutTaps = 0;
    await pumpDrawer(tester, onLogoutTapped: () => logoutTaps += 1);

    await tester.tap(find.text('Выйти'));
    await tester.pump();

    expect(logoutTaps, 1);
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_calc/main.dart';

void main() {
  testWidgets("Calculator Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyCalc());
    expect(find.byKey(const Key("Result")), findsOneWidget);
    expect(find.byKey(const Key("DisplayOne")), findsOneWidget);
    expect(find.byKey(const Key("DisplayTwo")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    await tester.enterText(find.byKey(const Key("DisplayOne")), "20");
    await tester.enterText(find.byKey(const Key("DisplayTwo")), "10");

    await tester.tap(find.byIcon(CupertinoIcons.add));

    await tester.pump();

    expect(find.text("30"), findsOneWidget);
    
    await tester.tap(find.byIcon(CupertinoIcons.minus));

    await tester.pump();

    expect(find.text("10"), findsNWidgets(2));
    
    await tester.tap(find.byIcon(CupertinoIcons.multiply));

    await tester.pump();

    expect(find.text("200"), findsOneWidget);
    
    await tester.tap(find.byIcon(CupertinoIcons.divide));

    await tester.pump();

    expect(find.text("2.0"), findsOneWidget);
  });
}

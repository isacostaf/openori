import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:opennutritracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Policy Test', () {
    testWidgets('Should require policy confirmation before proceeding',
        (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();
      
      // Add a delay to see the initial screen
      await Future.delayed(const Duration(seconds: 2));

      // Find the "Start" button
      final startButton = find.text('START');
      expect(startButton, findsOneWidget, reason: 'The Start button should be visible');

      // Try to tap the start button without accepting policy
      await tester.tap(startButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the result of trying to proceed without accepting
      await Future.delayed(const Duration(seconds: 2));

      // Verify we are still on the first page
      expect(find.text('Welcome to'), findsOneWidget, 
          reason: 'We should stay on the first page because the policy was not accepted');

      // Find and tap the policy checkbox
      final policyCheckbox = find.byType(Checkbox).first;
      expect(startButton, findsOneWidget, reason: 'The policy button should be visible');

      await tester.tap(policyCheckbox);
      await tester.pumpAndSettle();
      
      // Add a delay to see the checkbox being checked
      await Future.delayed(const Duration(seconds: 2));

      // Now try to tap the start button again
      await tester.tap(startButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the transition to the next page
      await Future.delayed(const Duration(seconds: 2));

      // Verify we've moved to the next page (gender selection)
      expect(find.text('Gender'), findsOneWidget,
        reason: 'We should advance to the gender selection page after accepting the policy');
    });

    testWidgets('Test gender and birthday selection', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();
      
      // Add a delay to see the initial screen
      await Future.delayed(const Duration(seconds: 2));

      // Select male
      final maleOption = find.text('male');
      expect(maleOption, findsOneWidget, reason: 'Male option should be visible');
      
      await tester.tap(maleOption);
      await tester.pumpAndSettle();
      
      // Add a delay to see the selection
      await Future.delayed(const Duration(seconds: 2));
      
      // Tap the Birthday field to open the calendar
      final birthdayField = find.text('Birthday');
      expect(birthdayField, findsOneWidget, reason: 'Birthday field should be visible');
      
      await tester.tap(birthdayField);
      await tester.pumpAndSettle();
      
      // Add a delay to see the calendar dialog
      await Future.delayed(const Duration(seconds: 2));

      // Verify the date picker dialog is visible
      expect(find.text('Select date'), findsOneWidget, reason: 'Date picker dialog title should be visible');
      
      // Find and tap the edit icon to switch to text input
      final editIcon = find.byIcon(Icons.edit);
      expect(editIcon, findsOneWidget, reason: 'Edit icon should be visible in date picker dialog');
      
      await tester.tap(editIcon);
      await tester.pumpAndSettle();
      
      // Add a delay to see the text input field
      await Future.delayed(const Duration(seconds: 2));

      // Find the text input field and enter the date
      // Assuming the text field appears after tapping the edit icon, we try to find a TextField widget.
      // If there are multiple TextFields, this might need refinement.
      final dateInput = find.byType(TextField);
      expect(dateInput, findsOneWidget, reason: 'Date input text field should be visible');

      await tester.enterText(dateInput, '01/01/2001');
      await tester.pumpAndSettle();

      // Add a delay to see the entered text
      await Future.delayed(const Duration(seconds: 2));

      // Tap the OK button to confirm the date selection
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget, reason: 'OK button should be visible in date picker dialog');
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the dialog close
      await Future.delayed(const Duration(seconds: 2));

      // Tap the NEXT button to advance
      final nextButton = find.text('NEXT');
      expect(nextButton, findsOneWidget, reason: 'Next button should be visible');
      
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the transition
      await Future.delayed(const Duration(seconds: 2));
      
      // Verify we moved to the next page
      expect(find.text('Birthday'), findsNothing, reason: 'Should have moved past birthday page');
      expect(find.text('Gender'), findsNothing, reason: 'Should have moved past gender page');

    });
  });
} 
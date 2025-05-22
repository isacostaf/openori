import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:opennutritracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Start the app once before all tests
  app.main();

  group('Onboarding Policy Test', () {
    testWidgets('Should require policy confirmation, then select gender and birthday',
        (WidgetTester tester) async {
      // Wait for the app to settle after initial startup
      await tester.pumpAndSettle();
      
      // Add a delay to see the initial screen
      await Future.delayed(const Duration(seconds: 1));

      // Find the "Start" button
      final startButton = find.text('START');
      expect(startButton, findsOneWidget, reason: 'The Start button should be visible');
      
      // Try to tap the start button without accepting policy
      await tester.tap(startButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the result of trying to proceed without accepting
      await Future.delayed(const Duration(seconds: 1));

      // Verify we are still on the first page
      expect(find.text('Welcome to'), findsOneWidget, 
          reason: 'We should stay on the first page because the policy was not accepted');

      // Find and tap the policy checkbox
      final policyCheckbox = find.byType(Checkbox).first;
      expect(startButton, findsOneWidget, reason: 'The policy button should be visible');

      await tester.tap(policyCheckbox);
      await tester.pumpAndSettle();
      
      // Add a delay to see the checkbox being checked
      await Future.delayed(const Duration(seconds: 1));

      // Now try to tap the start button again
      await tester.tap(startButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the transition to the next page
      await Future.delayed(const Duration(seconds: 1));

      //////// GENDER SELECTION ////////

      // Ensure the UI is settled after navigating to gender selection
      await tester.pumpAndSettle();

      final maleOption = find.text('♂ male');
      expect(maleOption, findsOneWidget, reason: 'Male option should be visible');
      
      await tester.tap(maleOption);
      await tester.pumpAndSettle();
      
      // Add a delay to see the selection
      await Future.delayed(const Duration(seconds: 1));

      //////// BIRTHDAY SELECTION ////////

      // Tap the Birthday field to open the calendar
      final birthdayField = find.byIcon(Icons.calendar_month_outlined);
      expect(birthdayField, findsOneWidget, reason: 'Birthday field should be visible');
      
      await tester.tap(birthdayField);
      await tester.pumpAndSettle();
      
      // Add a delay to see the calendar dialog
      await Future.delayed(const Duration(seconds: 1));

      // Verify the date picker dialog is visible
      expect(find.text('Select date'), findsOneWidget, reason: 'Date picker dialog title should be visible');
      
      // Find and tap the edit icon to switch to text input
      final editIcon = find.byIcon(Icons.edit_outlined);
      expect(editIcon, findsOneWidget, reason: 'Edit icon should be visible in date picker dialog');
      
      await tester.tap(editIcon);
      await tester.pumpAndSettle();

      // Add a small delay to ensure the text field is ready after switching view
      await Future.delayed(const Duration(milliseconds: 300));

      
      // Add a delay to see the text input field
      await Future.delayed(const Duration(seconds: 1));

      // Find the text input field and enter the date
      // Assuming the text field appears after tapping the edit icon, we try to find a TextField widget.
      // If there are multiple TextFields, this might need refinement.
      final dateInput = find.byType(TextField).at(1);
      expect(dateInput, findsOneWidget, reason: 'Date input text field should be visible');

      // Ensure the keyboard is shown and enter the text
      await tester.enterText(dateInput, '12/31/1899');
      await tester.pumpAndSettle();

      // Add a small delay to ensure the text is processed before tapping OK
      await Future.delayed(const Duration(seconds: 1)); // Increased delay for visual confirmation

      // Tap the OK button to confirm the date selection
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget, reason: 'OK button should be visible in date picker dialog');
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the dialog close
      await Future.delayed(const Duration(seconds: 1));

      // Tap the NEXT button to advance
      final nextButton = find.text('NEXT');
      expect(nextButton, findsOneWidget, reason: 'Next button should be visible');
      
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      
      // Add a delay to see the transition
      await Future.delayed(const Duration(seconds: 1));
      
    ////////////// height ////////////
    final heightInput = find.byType(TextField).at(0);
      expect(heightInput, findsOneWidget, reason: 'Height input text field should be visible');

      // Ensure the keyboard is shown and enter the text
      await tester.enterText(heightInput, '60');
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));
    
    ////////////// weight //////////////
    final weightInput = find.byType(TextField).at(1);
      expect(weightInput, findsOneWidget, reason: 'Weight input text field should be visible');

      // Ensure the keyboard is shown and enter the text
      await tester.enterText(weightInput, '60');
      await tester.pumpAndSettle();

    ///// next
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

    ///// active sedentary field
      final sedentaryField = find.text('Sedentary');
      expect(sedentaryField, findsOneWidget, reason: 'sedentary field should be visible');

      await tester.tap(sedentaryField);
      await tester.pumpAndSettle();

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      ///// goal lose weight field
      final loseweightField = find.text('Lose Weight');
      expect(loseweightField, findsOneWidget, reason: 'Lose Weight field should be visible');

      await tester.tap(loseweightField);
      await tester.pumpAndSettle();

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

    });
  });
} 
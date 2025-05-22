import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:opennutritracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Policy Test', () {
    //nome do teste
    testWidgets('Should require policy confirmation before proceeding',
        (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      print('Looking for Start button...');
      final startButton = find.text('Start');
      expect(startButton, findsOneWidget, reason: 'The Start button is not visible');

      // Try to tap the start button without accepting policy
      // await espera a acao acabar p continuat
      // tester. testa algo
      // ta falado q eh p clicar no botao startbutton
      // o outro comando eh p esperar tbm
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Verify we are still on the first page
      expect(find.text('policy'), findsOneWidget, 
          reason: 'We went to the next page because even though the policy was not accepted');

      // Find and tap the policy checkbox
      // final = var q n muda
      // policyCheckbox = achar o checkbox
      // find.byType(Checkbox).first = achar o primeiro checkbox
      // expect: eh sempre oq esperamos q aconteca no teste
      //nesse caso: q satbutton tenha um widget
      // reason eh oq aparece se o teste falhar
      final policyCheckbox = find.byType(Checkbox).first;
      expect(startButton, findsOneWidget, reason: 'The policy button should be visible');

    
      await tester.tap(policyCheckbox);
      await tester.pumpAndSettle();

      // Now try to tap the start button again
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Verify we've moved to the next page (gender selection)
      expect(find.text('gender'), findsOneWidget,
        reason: 'We didn\'t go to the next page even though the policy was accepted');
    });
  });
} 
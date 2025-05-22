# Configuração e Execução de Testes de Integração

## 1. Estrutura de Arquivos
```
seu_projeto/
├── test/
│   └── integration_test/
│       └── onboarding_policy_test.dart    # Arquivo de teste
└── test_driver/
    └── integration_test.dart              # Driver do teste
```

## 2. Configuração Inicial

### 2.1 Criar arquivo de teste
Criar o arquivo `test/integration_test/onboarding_policy_test.dart`:
```dart
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

      // Find the "Start" button
      final startButton = find.text('Start');
      expect(startButton, findsOneWidget, reason: 'The Start button should be visible');

      // Try to tap the start button without accepting policy
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Verify we are still on the first page
      expect(find.text('policy'), findsOneWidget, 
          reason: 'We should stay on the first page because the policy was not accepted');

      // Find and tap the policy checkbox
      final policyCheckbox = find.byType(Checkbox).first;
      expect(startButton, findsOneWidget, reason: 'The policy button should be visible');

      await tester.tap(policyCheckbox);
      await tester.pumpAndSettle();

      // Now try to tap the start button again
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Verify we've moved to the next page (gender selection)
      expect(find.text('gender'), findsOneWidget,
        reason: 'We should advance to the gender selection page after accepting the policy');
    });
  });
}
```

### 2.2 Criar arquivo driver
Criar o arquivo `test_driver/integration_test.dart`:
```dart
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver();
```

### 2.3 Verificar dependências
No `pubspec.yaml`, garantir que temos:
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
```

## 3. Rodando os Testes

### 3.1 No Chrome

1. Instalar chromedriver (se ainda não tiver):
```bash
brew install chromedriver
```

2. Iniciar o chromedriver em uma janela separada:
```bash
chromedriver --port=4444
```

3. Em outra janela do terminal, rodar o teste:
```bash
flutter drive --driver=test_driver/integration_test.dart --target=test/integration_test/onboarding_policy_test.dart -d chrome
```

### 3.2 No iOS Simulator

1. Abrir o simulador:
```bash
open -a Simulator
```

2. Rodar o teste:
```bash
flutter drive --driver=test_driver/integration_test.dart --target=test/integration_test/onboarding_policy_test.dart -d "iPhone 16 Plus"
```

## 4. Solução de Problemas

### 4.1 Erro de WebDriver
- Verificar se o chromedriver está instalado: `which chromedriver`
- Garantir que o chromedriver está rodando na porta 4444
- Se necessário, matar processos na porta 4444: `lsof -i :4444` e `kill -9 <PID>`

### 4.2 Erro de Sentry
- Adicionar `--debug` ao comando de teste para evitar inicialização do Sentry:
```bash
flutter drive --driver=test_driver/integration_test.dart --target=test/integration_test/onboarding_policy_test.dart -d chrome --debug
```

### 4.3 Dispositivo não encontrado
- Verificar dispositivos disponíveis: `flutter devices`
- Garantir que o simulador está aberto antes de rodar o teste
- Verificar se o nome do dispositivo está correto

## 5. Dicas
- Use `flutter devices` para ver a lista de dispositivos disponíveis
- Para debug, adicione `--debug` ao comando de teste
- Mantenha o chromedriver rodando em uma janela separada do terminal
- Se o teste falhar, verifique os logs para identificar o problema 
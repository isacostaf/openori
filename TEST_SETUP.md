# Configuração e Execução de Testes de Integração

eu:
a3c16fc17be25f6c.pngAgrega las dependencias pub en la línea de comandos. Para facilitar la gestión del estado, agrega provider:


$ cd testing_app
$ flutter pub add provider
Resolving dependencies...
  collection 1.17.0 (1.17.1 available)
  js 0.6.5 (0.6.7 available)
  matcher 0.12.13 (0.12.14 available)
  meta 1.8.0 (1.9.0 available)
+ nested 1.0.0
  path 1.8.2 (1.8.3 available)
+ provider 6.0.5
  test_api 0.4.16 (0.4.18 available)
Changed 2 dependencies!
Para realizar pruebas automáticas del código de Flutter en dispositivos y emuladores, agrega integration_test:


$ flutter pub add --dev --sdk=flutter integration_test
Resolving dependencies...
+ archive 3.3.2 (3.3.6 available)
  collection 1.17.0 (1.17.1 available)
+ crypto 3.0.2
+ file 6.1.4
+ flutter_driver 0.0.0 from sdk flutter
+ fuchsia_remote_debug_protocol 0.0.0 from sdk flutter
+ integration_test 0.0.0 from sdk flutter
  js 0.6.5 (0.6.7 available)
  matcher 0.12.13 (0.12.14 available)
  meta 1.8.0 (1.9.0 available)
  path 1.8.2 (1.8.3 available)
+ platform 3.1.0
+ process 4.2.4
+ sync_http 0.3.1
  test_api 0.4.16 (0.4.18 available)
+ typed_data 1.3.1
+ vm_service 9.4.0 (11.0.1 available)
+ webdriver 3.0.1 (3.0.2 available)
Changed 12 dependencies!
Para obtener una API avanzada para probar aplicaciones de Flutter que se ejecutan en emuladores y dispositivos reales, agrega flutter_driver:


$ flutter pub add --dev --sdk=flutter flutter_driver
Resolving dependencies...
  archive 3.3.2 (3.3.6 available)
  collection 1.17.0 (1.17.1 available)
  js 0.6.5 (0.6.7 available)
  matcher 0.12.13 (0.12.14 available)
  meta 1.8.0 (1.9.0 available)
  path 1.8.2 (1.8.3 available)
  test_api 0.4.16 (0.4.18 available)
  vm_service 9.4.0 (11.0.1 available)
  webdriver 3.0.1 (3.0.2 available)
Got dependencies!
Para obtener herramientas de pruebas generales, agrega test:


$ flutter pub add --dev test
Resolving dependencies...
+ _fe_analyzer_shared 52.0.0
+ analyzer 5.4.0
  archive 3.3.2 (3.3.6 available)
+ args 2.3.2
  collection 1.17.0 (1.17.1 available)
+ convert 3.1.1
+ coverage 1.6.3
+ frontend_server_client 3.2.0
+ glob 2.1.1
+ http_multi_server 3.2.1
+ http_parser 4.0.2
+ io 1.0.4
  js 0.6.5 (0.6.7 available)
+ logging 1.1.1
  matcher 0.12.13 (0.12.14 available)
  meta 1.8.0 (1.9.0 available)
+ mime 1.0.4
+ node_preamble 2.0.1
+ package_config 2.1.0
  path 1.8.2 (1.8.3 available)
+ pool 1.5.1
+ pub_semver 2.1.3
+ shelf 1.4.0
+ shelf_packages_handler 3.0.1
+ shelf_static 1.1.1
+ shelf_web_socket 1.0.3
+ source_map_stack_trace 2.1.1
+ source_maps 0.10.11
+ test 1.22.0 (1.23.0 available)
  test_api 0.4.16 (0.4.18 available)
+ test_core 0.4.20 (0.4.23 available)
  vm_service 9.4.0 (11.0.1 available)
+ watcher 1.0.2
+ web_socket_channel 2.3.0
  webdriver 3.0.1 (3.0.2 available)
+ webkit_inspection_protocol 1.2.0
+ yaml 3.1.1
Changed 28 dependencies!
Para controlar la navegación de la app, agrega go_router:


$ flutter pub add go_router
Resolving dependencies...
  archive 3.3.2 (3.3.6 available)
  collection 1.17.0 (1.17.1 available)
+ flutter_web_plugins 0.0.0 from sdk flutter
+ go_router 6.0.4
  js 0.6.5 (0.6.7 available)
  matcher 0.12.13 (0.12.14 available)
  meta 1.8.0 (1.9.0 available)
  path 1.8.2 (1.8.3 available)
  test 1.22.0 (1.23.0 available)
  test_api 0.4.16 (0.4.18 available)
  test_core 0.4.20 (0.4.23 available)
  vm_service 9.4.0 (11.0.1 available)
  webdriver 3.0.1 (3.0.2 available)
Changed 2 dependencies!
Se deberían haber agregado las siguientes dependencias al archivo pubspec.yaml:

En dependencies:


dependencies:
  provider: ^6.0.5
  go_router: ^6.0.4
En dev_dependencies:


dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_driver:
    sdk: flutter
  test: ^1.22.0
a3c16fc17be25f6c.pngAbre el proyecto en el editor de código que prefieras y ejecuta la app. De manera opcional, puedes ejecutarla en la línea de comandos como se indica a continuación.


$ flutter run

2.⁠ ⁠Get Dependencies

flutter pub get

3.⁠ ⁠Run Build Runner to generate Files

flutter pub run build_runner build

4.⁠ ⁠Run App

flutter run lib/main.dart

Running the Application
The application can be run on multiple platforms. Here are the commands for each:

Web (Chrome)
flutter run -d chrome










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
import 'package:integration_test/integration_test.dart';
import 'package:intergrationtest/constants-keys/const_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intergrationtest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("group_auth", () {
    testWidgets("registerScreen", (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(find.byKey(ConstKey.Name), "Hamed");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(find.byKey(ConstKey.Email), "Hamed@gmail.com");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(find.byKey(ConstKey.Password), "Hamed@@##dc?");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(find.byKey(ConstKey.Phone), "0595295933");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      ///احفاء الكيبورد
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.press(find.byKey(ConstKey.SignUp));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
    });
  });
}

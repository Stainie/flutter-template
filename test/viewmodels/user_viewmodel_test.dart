import 'package:flutter_template/ui/views/user/user_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

main() {
  group("UserViewModelTest -", () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group("CanAuthenticate -", () {
      test("When authenticating username should be tester", () {
        // Setup - Arrange
        getAndRegisterAuthServiceMock();
        getAndRegisterNavServiceMock();
        var model = UserViewModel();
        // Action - Act
        model.setUsername("tester");
        // Result - Assert
        expect(model.username, "tester");
      });
    });
  });
}

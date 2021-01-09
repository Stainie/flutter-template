import 'package:flutter_template/ui/views/user/user_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

main() {
  tearDown(() => unregisterServices());
  group("UserViewModelTest -", () {
    group("CanAuthenticate -", () {
      test("When authenticating username should be stanko", () {
        getAndRegisterAuthServiceMock();
        getAndRegisterNavServiceMock();
        var model = UserViewModel();
        model.setUsername("stanko");
        expect(model.username, "stanko");
      });
    });
  });
}

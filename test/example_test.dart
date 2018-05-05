import 'harness/app.dart';
import 'package:scout_site/model/scout.dart';

Future main() async {
  TestApplication app = new TestApplication();

  setUpAll(() async {
    await app.start();

    var scouts = [
      new Scout()
      ..scout_name = "Kieran"
      ..rank = "Tiger",
      new Scout()
      ..scout_name = "Joey"
      ..rank = "Tiger",
      new Scout()
      ..scout_name = "Skyler"
      ..rank = "Tiger",
    ];

    await Future.forEach(scouts, (scout) {
      var query = new Query<Scout>()
          ..values = scout;
      return query.insert();
    });
  });

  tearDownAll(() async {
    await app.stop();
  });

//  group("Success flow", () {
//    test("Can hit example endpoint", () async {
//      var request = app.client.request("/example");
//
//      var response = await request.get();
//      expect(response, hasResponse(200, {
//        "key": "value"
//      }));
//    });
//  });

  test("/scouts returns a list of scouts", () async {
    expectResponse(await app.client.request("/scouts").get(),
        200,
    body: allOf([
      hasLength(greaterThan(0)),
      isNotEmpty,
      isNotNull
    ]));
  });

  test("/scouts returns a single scout filtered by name", () async {
    var request = app.client.request("/scouts?name=KiErAn");
    expectResponse(await request.get(),
        200,
        body: [{
          "scout_id" : greaterThanOrEqualTo(1),
          "scout_name" : equalsIgnoringCase("kieran"),
          "rank" : equalsIgnoringCase("tiger"),

        }]);
  });
}

import '../scout_site.dart';
import '../model/scout.dart';

class ScoutController extends HTTPController {

  @httpGet
  /// Gets all scouts in the database...
  /// -Optional `name` parameter to specify a single scout...
  Future<Response> getAllScouts({@HTTPQuery("name") String name}) async {
    var scoutQuery = new Query<Scout>();
    if (name != null) {
      scoutQuery.where.scout_name = whereEqualTo(name, caseSensitive: false);
    }
    var dbScouts = await scoutQuery.fetch();
    return new Response.ok(dbScouts);
  }

//  @httpGet
//  /// Gets all scouts by rank in the database...
//  Future<Response> getAllScoutsByRank(
//      @HTTPPath("rank")
//      @HTTPQuery("rank") String rank) async {
//    if (rank == null) {
//      return new Response.notFound();
//    }
//    var scoutQuery = new Query<Scout>()
//        .where.rank = whereEqualTo(rank, caseSensitive: false);
//    var dbScouts = await scoutQuery.fetch();
//    return new Response.ok(dbScouts);
//  }
}
//  @httpGet
//  Future<Response> getScoutAtIndex(@HTTPPath("index") int index) async {
//    if (index < 0 || index >= scouts.length) {
//      return new Response.notFound();
//    }
//
//    return new Response.ok(scouts[index]);
//  }

//  @httpGet
//  Future<Response> getScoutByName(
//      @HTTPPath("scout") String scout,
//      {@HTTPPath("name") String name}) async {
//    var scoutQuery = new Query<Scout>()
//    ..where.scout_name = whereContainsString(name, caseSensitive: false);
//
//    var scout = await scoutQuery.fetchOne();
//
//    if (name.isEmpty) { // || name.trim() == "") {
//      return new Response.notFound();
//    }
//    return new Response.ok(scout);
//  }


//class RankController extends HTTPController {
//
//  @httpGet
//  /// Gets all scouts by rank in the database...
//  Future<Response> getAllScoutsByRank(
//      @HTTPQuery("rank") String rank) async {
//    if (rank == null) {
//      return new Response.notFound();
//    }
//    var scoutQuery = new Query<Scout>()
//        .where.rank = whereEqualTo(rank, caseSensitive: false);
//    var dbScouts = await scoutQuery.fetch();
//    return new Response.ok(dbScouts);
//  }
//}
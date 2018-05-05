import '../scout_site.dart';
import '../model/scout.dart';

class RankController extends HTTPController {

//  @httpGet
//  /// Gets all scouts by rank in the database...
//  Future<Response> getAllScoutsByRank(
//      @HTTPQuery("rank") String scoutRank) async {
////    if (scoutRank == null) {
////      return new Response.notFound();
////    }
//    var scoutQuery = new Query<Scout>()
//        .where.rank = whereEqualTo(scoutRank, caseSensitive: false);
//    var dbScouts = await scoutQuery.fetch();
//    return new Response.ok(dbScouts);
//  }

  Future<Response> getByRank({@HTTPQuery("rank") String name}) async {
    var scoutQuery = new Query<Scout>();
    if (name != null) {
      scoutQuery.where.rank = whereEqualTo(name, caseSensitive: false);
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
import '../scout_site.dart';

class Scout extends ManagedObject<scouts> implements scouts {}

class scouts {
  @managedPrimaryKey
  int scout_id;

  String scout_name;
  String rank;
}
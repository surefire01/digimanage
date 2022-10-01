
abstract class Notify{
  abstract bool read;
  abstract String userUid;
  abstract String docId;
  Map toJson();
  String isOfType();
  void clear();
}
// we will create our question model here
// create a simple class
class Counts {
  // define how a question will look like
  // every question will have an Id.
  final String id;
  // every question will have a title, it's the question itself.
  final String title;
  final String complete;
  // every question will have options.

  // options will be like - {'1':true, '2':false} = something like these

  // create a constructor
  Counts({
    required this.id,
    required this.title,
    required this.complete,
  });
  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
        id: json["id"],
        title: json["title"],
        complete: json["complete"],

        //  Address.fromJson(json["address"]),
      );

  // override the toString method to print the questions on console
  @override
  String toString() {
    return 'Counts(id: $id, title: $title,complete: $complete )';
  }
}

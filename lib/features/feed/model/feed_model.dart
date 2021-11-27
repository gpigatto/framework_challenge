class FeedModelList {
/*
{
  "id": 0,
  "name": "Maçã",
  "value": 2.54,
  "imagePath": "resources/images/apple.png",
  "curiosity": ""
} 
*/

  int? id;
  String? name;
  double? value;
  String? imagePath;
  String? curiosity;

  FeedModelList({
    this.id,
    this.name,
    this.value,
    this.imagePath,
    this.curiosity,
  });
  FeedModelList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    value = json['value']?.toDouble();
    imagePath = json['imagePath']?.toString();
    curiosity = json['curiosity']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['imagePath'] = imagePath;
    data['curiosity'] = curiosity;
    return data;
  }
}

class FeedModel {
/*
{
  "list": [
    {
      "id": 0,
      "name": "Maçã",
      "value": 2.54,
      "imagePath": "resources/images/apple.png",
      "curiosity": ""
    }
  ]
} 
*/

  List<FeedModelList?>? list;

  FeedModel({
    this.list,
  });
  FeedModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      final v = json['list'];
      final arr0 = <FeedModelList>[];
      v.forEach((v) {
        arr0.add(FeedModelList.fromJson(v));
      });
      list = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (list != null) {
      final v = list;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['list'] = arr0;
    }
    return data;
  }
}

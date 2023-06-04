class ImageClass {
  int? id;
  String? image;
  int? studentId;
  String? imageUrl;

  ImageClass({this.id, this.image, this.studentId, this.imageUrl});

  ImageClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    studentId = json['student_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['student_id'] = this.studentId;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Photo{
  String? albumid;
  String? id;
  String? title;
  String? url;
  String? thumbnailUrl;

Photo({
  this.albumid,
  this.id,
  this.title,
  this.url,
  this.thumbnailUrl,
});

Photo.fromJson(Map<String, dynamic > json){
    albumid = json['albumId'].toString();
    id = json ['id'].toString();
    title = json ['title'];
    url = json ['url'];
    thumbnailUrl = json ['thumbnailUrl'];
}
}
class Tweet {
  final String userId;
  final String handle;
  final String id;
  final String lang;
  final String content;
  final String created;
  final bool forward;

  Tweet(
      {this.id,
      this.userId,
      this.handle,
      this.lang,
      this.content,
      this.created,
      this.forward});

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id_str'],
      userId: json['user']['id_str'],
      handle: json['user']['screen_name'],
      lang: json['lang'],
      content: json['full_text'],
      created: json['created_at'],
      forward: false,
    );
  }

  @override
  String toString() {
    return 'Tweet de @${this.handle}, ${this.content} }';
  }
}

class User {
  final String UserId;
  final String displayName; //firebaseに登録したUser情報に紐づいているユーザー名
  final String inAppUserName; //このアプリの中で編集できるユーザー名(最初はdisplayNameと同じ）
  final String photoUrl;
  final String email;
  final String bio;

//<editor-fold desc="Data Methods">

  const User({
    required this.UserId,
    required this.displayName,
    required this.inAppUserName,
    required this.photoUrl,
    required this.email,
    required this.bio,
  });

//プロフ@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is User &&
              runtimeType == other.runtimeType &&
              UserId == other.UserId &&
              displayName == other.displayName &&
              inAppUserName == other.inAppUserName &&
              photoUrl == other.photoUrl &&
              email == other.email &&
              bio == other.bio
          );


  @override
  int get hashCode =>
      UserId.hashCode ^
      displayName.hashCode ^
      inAppUserName.hashCode ^
      photoUrl.hashCode ^
      email.hashCode ^
      bio.hashCode;


  @override
  String toString() {
    return 'User{' +
        ' UserId: $UserId,' +
        ' displayName: $displayName,' +
        ' inAppUserName: $inAppUserName,' +
        ' photoUrl: $photoUrl,' +
        ' email: $email,' +
        ' bio: $bio,' +
        '}';
  }


  User copyWith({
    String? UserId,
    String? displayName,
    String? inAppUserName,
    String? photoUrl,
    String? email,
    String? bio,
  }) {
    return User(
      UserId: UserId ?? this.UserId,
      displayName: displayName ?? this.displayName,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      bio: bio ?? this.bio,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'UserId': this.UserId,
      'displayName': this.displayName,
      'inAppUserName': this.inAppUserName,
      'photoUrl': this.photoUrl,
      'email': this.email,
      'bio': this.bio,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      UserId: map['UserId'] as String,
      displayName: map['displayName'] as String,
      inAppUserName: map['inAppUserName'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
    );
  }


  //</editor-fold>

}
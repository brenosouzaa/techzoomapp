import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comments_user" field.
  DocumentReference? _commentsUser;
  DocumentReference? get commentsUser => _commentsUser;
  bool hasCommentsUser() => _commentsUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "post_tipe" field.
  DocumentReference? _postTipe;
  DocumentReference? get postTipe => _postTipe;
  bool hasPostTipe() => _postTipe != null;

  // "commentnumber" field.
  int? _commentnumber;
  int get commentnumber => _commentnumber ?? 0;
  bool hasCommentnumber() => _commentnumber != null;

  // "respondercomments" field.
  String? _respondercomments;
  String get respondercomments => _respondercomments ?? '';
  bool hasRespondercomments() => _respondercomments != null;

  // "post_liked_by" field.
  List<DocumentReference>? _postLikedBy;
  List<DocumentReference> get postLikedBy => _postLikedBy ?? const [];
  bool hasPostLikedBy() => _postLikedBy != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _commentsUser = snapshotData['comments_user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _commentText = snapshotData['comment_text'] as String?;
    _postTipe = snapshotData['post_tipe'] as DocumentReference?;
    _commentnumber = castToType<int>(snapshotData['commentnumber']);
    _respondercomments = snapshotData['respondercomments'] as String?;
    _postLikedBy = getDataList(snapshotData['post_liked_by']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentsUser,
  DateTime? createdTime,
  String? commentText,
  DocumentReference? postTipe,
  int? commentnumber,
  String? respondercomments,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comments_user': commentsUser,
      'created_time': createdTime,
      'comment_text': commentText,
      'post_tipe': postTipe,
      'commentnumber': commentnumber,
      'respondercomments': respondercomments,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentsUser == e2?.commentsUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.commentText == e2?.commentText &&
        e1?.postTipe == e2?.postTipe &&
        e1?.commentnumber == e2?.commentnumber &&
        e1?.respondercomments == e2?.respondercomments &&
        listEquality.equals(e1?.postLikedBy, e2?.postLikedBy) &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentsUser,
        e?.createdTime,
        e?.commentText,
        e?.postTipe,
        e?.commentnumber,
        e?.respondercomments,
        e?.postLikedBy,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}

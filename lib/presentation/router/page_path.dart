/// 画面ID
enum PageId {
  list,
  edit,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.list => '/list',
        PageId.edit => '/edit/:id',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.list => 'list',
        PageId.edit => 'edit',
      };
}

/// 画面ID
enum PageId {
  list,
  edit,
}

/// 設計上の画面パス
extension PagePath on PageId {
  String get path {
    switch (this) {
      case PageId.list:
        return '/list';
      case PageId.edit:
        return '/edit/:id';
    }
  }
}

/// 設計上の画面名
extension PageName on PageId {
  String get routeName {
    switch (this) {
      case PageId.list:
        return 'list';
      case PageId.edit:
        return 'edit';
    }
  }
}

/// 組み込み画像
enum BrandImage {
  statusTodo('status-todo.png'),
  statusDoing('status-doing.png'),
  statusDone('status-done.png');

  const BrandImage(this.name);

  final String name;
  String get path => 'assets/images/$name';
}

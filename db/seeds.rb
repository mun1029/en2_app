# 第一階層
language = Category.create(name: '言語')

# 第二階層
language_1 = language.children.create(name: 'Ruby')

# 第三階層
language_1.children.create([
                             { name: '環境構築' },
                             { name: '配列・ハッシュ' },
                             { name: '変数定義' },
                             { name: '条件分岐・繰り返し' },
                             { name: 'クラス・インスタンス' },
                             { name: 'メソッド' },
                             { name: 'フレームワーク' },
                             { name: 'ライブラリ' },
                             { name: 'アルゴリズム' },
                             { name: 'その他' }
                           ])

# 第二階層
language_2 = language.children.create(name: 'HTML・CSS')

# 第三階層
language_2.children.create([
                             { name: '環境構築' },
                             { name: '変数定義' },
                             { name: 'オプション' },
                             { name: 'タグ' },
                             { name: 'セレクタ・プロパティ' },
                             { name: 'フレームワーク' },
                             { name: 'その他' }
                           ])

# 第二階層
language_3 = language.children.create(name: 'python')

# 第三階層
language_3.children.create([
                             { name: '環境構築' },
                             { name: 'リスト・辞書' },
                             { name: '変数定義' },
                             { name: '条件分岐・繰り返し' },
                             { name: 'クラス・インスタンス' },
                             { name: 'メソッド' },
                             { name: 'フレームワーク' },
                             { name: 'ライブラリ' },
                             { name: 'アルゴリズム' },
                             { name: 'その他' }
                           ])

# 第二階層
language_4 = language.children.create(name: 'Java')

# 第三階層
language_4.children.create([
                             { name: '環境構築' },
                             { name: '配列・map' },
                             { name: '変数定義' },
                             { name: '条件分岐・繰り返し' },
                             { name: 'クラス・インスタンス' },
                             { name: 'メソッド' },
                             { name: 'フレームワーク' },
                             { name: 'ライブラリ' },
                             { name: 'アルゴリズム' },
                             { name: 'その他' }
                           ])

# 第二階層
language_5 = language.children.create(name: 'JavaScript')

# 第三階層
language_5.children.create([
                             { name: '配列・ハッシュ' },
                             { name: '変数定義' },
                             { name: '条件分岐・繰り返し' },
                             { name: 'クラス・インスタンス' },
                             { name: '関数・メソッド' },
                             { name: 'オブジェクト' },
                             { name: 'フレームワーク' },
                             { name: 'ライブラリ' },
                             { name: 'その他' }
                           ])

# 第一階層
fw = Category.create(name: 'フレームワーク')

# 第二階層
fw_1 = fw.children.create(name: 'ruby on rails')

# 第三階層
fw_1.children.create([
                       { name: '環境構築' },
                       { name: 'MVC' },
                       { name: 'ルーティング' },
                       { name: 'アクション' },
                       { name: 'ヘルパーメソッド' },
                       { name: 'ライブラリ' },
                       { name: '単体テスト' },
                       { name: '結合テスト' },
                       { name: 'Docker導入' },
                       { name: 'コマンド' },
                       { name: 'その他' }
                     ])

# 第二階層
fw_2 = fw.children.create(name: 'BootStrap')

# 第三階層
fw_2.children.create([
                       { name: '環境構築' },
                       { name: 'ボタン' },
                       { name: 'テーブル' },
                       { name: 'フォーム' },
                       { name: 'グリッド' },
                       { name: 'その他' }
                     ])

# 第二階層
fw_3 = fw.children.create(name: 'Django')

# 第三階層
fw_3.children.create([
                       { name: '環境構築' },
                       { name: 'MVC' },
                       { name: 'ライブラリ' },
                       { name: 'テストコード' },
                       { name: 'Docker導入' },
                       { name: 'コマンド' },
                       { name: 'その他' }
                     ])

# 第二階層
fw_4 = fw.children.create(name: 'Spring')

# 第三階層
fw_4.children.create([
                       { name: '環境構築' },
                       { name: 'MVC' },
                       { name: 'アクション' },
                       { name: 'ライブラリ' },
                       { name: 'テストコード' },
                       { name: 'Docker導入' },
                       { name: 'コマンド' },
                       { name: 'その他' }
                     ])

# 第一階層
edita = Category.create(name: 'テキストエディタ')

# 第二階層
edita_1 = edita.children.create(name: 'VScode')

# 第三階層
edita_1.children.create([
                          { name: '環境構築' },
                          { name: '拡張機能' },
                          { name: 'ショートカットキー' },
                          { name: 'その他' }
                        ])

# 第二階層
edita_2 = edita.children.create(name: 'Atom')

# 第三階層
edita_2.children.create([
                          { name: '環境構築' },
                          { name: '拡張機能' },
                          { name: 'ショートカットキー' },
                          { name: 'その他' }
                        ])

# 第二階層
edita_3 = edita.children.create(name: 'メモ帳')

# 第三階層
edita_3.children.create([
                          { name: 'ショートカットキー' },
                          { name: 'その他' }
                        ])

# 第一階層
deploy = Category.create(name: 'デプロイ')

# 第二階層
deploy_1 = deploy.children.create(name: 'Heroku')

# 第三階層
deploy_1.children.create([
                           { name: '環境構築' },
                           { name: 'コマンド' },
                           { name: 'その他' }
                         ])

# 第二階層
deploy_2 = deploy.children.create(name: 'AWS')

# 第三階層
deploy_2.children.create([
                           { name: '環境構築' },
                           { name: 'コマンド' },
                           { name: 'その他' }
                         ])

# 第一階層
scm = Category.create(name: 'ソースコード管理')

# 第二階層
scm_1 = scm.children.create(name: 'Git')

# 第三階層
scm_1.children.create([
                        { name: '環境構築' },
                        { name: 'リポジトリ' },
                        { name: 'コマンド' },
                        { name: 'プルリクエスト' },
                        { name: 'マージ' },
                        { name: 'その他' }
                      ])

# 第一階層
db = Category.create(name: 'データベース')

# 第二階層
db_1 = db.children.create(name: 'MySQL')

# 第三階層
db_1.children.create([
                       { name: '環境構築' },
                       { name: 'コマンド' },
                       { name: 'クエリ' },
                       { name: 'その他' }
                     ])

# 第一階層
it_word = Category.create(name: 'IT用語')

# 第二階層
it_word_1 = it_word.children.create(name: 'その他')

# 第三階層
it_word_1.children.create([
                            { name: 'その他' }
                          ])

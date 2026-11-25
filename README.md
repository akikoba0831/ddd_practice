# ddd_practice

LaravelとNext.jsでDDDを学習するための初期リポジトリです。
ドメインのモデルやレイヤー構成は、題材に合わせてこれから設計します。

## 構成

- `backend/`: Laravel 13、PHP 8.4、SQLite
- `frontend/`: Next.js 16、React 19、TypeScript、App Router、Tailwind CSS
- `docker/`: 開発用Dockerfileと起動スクリプト
- `compose.yaml`: 開発用Docker Compose構成

## 起動

DockerとDocker Composeが利用できれば、ホスト側のPHP・Composer・Node.jsは不要です。

```sh
git clone https://github.com/akikoba0831/ddd_practice.git
cd ddd_practice
docker compose up --build -d
docker compose logs -f
```

初回はイメージのビルドと依存パッケージのダウンロードに時間がかかります。
起動時にComposer/npmの依存関係をロックファイルからインストールします。
Laravelの`.env`作成・APP_KEY生成・SQLite作成・マイグレーションも自動実行します。
既存のAPP_KEYやDBは再起動時にも維持されます。

- Next.js: <http://localhost:3000>
- Laravel: <http://localhost:8000>
- Laravelヘルスチェック: <http://localhost:8000/up>

両アプリはそれぞれ公式テンプレートの初期画面を表示します。
API通信・認証・DDDのレイヤーはまだ実装していません。
コンテナ間でLaravelに接続する場合のホスト名は`backend:8000`です。
ブラウザから接続する場合は`localhost:8000`を使い、必要なAPIとCORSを設計してください。

## 開発コマンド

```sh
# Laravel
docker compose exec backend php artisan test
docker compose exec backend php artisan migrate
docker compose exec backend composer require <package>

# Next.js
docker compose exec frontend npm run lint
docker compose exec frontend npm run build
docker compose exec frontend npm install <package>

# 停止
docker compose down
```

ソースコードはバインドマウントされ、変更が反映されます。
`vendor`・`node_modules`・`.next`は名前付きボリュームに保存されます。
SQLiteは`backend/database/database.sqlite`に保存され、Git管理から除外されています。
Laravelの`.env`もGit管理から除外されています。

このCompose構成はローカル開発用です。LaravelのBlade/Viteの編集を行う場合は、
別途Viteの実行環境を追加してください。画面開発は`frontend/`で行う想定です。

## 参考

## 初期構築時の検証

- Docker Compose設定の検証と両イメージのビルド: 成功
- Laravelの初期テスト: 2件成功（ホスト環境で実行）
- Next.jsのLint・本番ビルド: 成功（ホスト環境で実行）
- コンテナの実行確認: 未完了。検証環境で新規コンテナの起動が待機状態となったため。

## 参考資料

- [Laravel公式ドキュメント](https://laravel.com/docs/13.x/installation)
- [Next.js公式ドキュメント](https://nextjs.org/docs/app/getting-started/installation)

# open-webui-container

[Open WebUI](https://github.com/open-webui/open-webui)をDockerイメージ化するためのDockerfileを置く場所。

## 構成図

現状では以下のようにクラウド上でホスティングしている (CloudBuildとArtifactRegistryはCloudRunのコンソールから自動作成)。

```mermaid
graph LR
    A[本リポジトリ] -->|ビルド＆デプロイ| B[CloudBuild]
    B ->|プッシュ| C[ArtifactRegistry]
    C -->|デプロイ| D[CloudRun]
    D <-->|永続化ファイルを保存| E[CloudStorage]
    F[ユーザー] -->|Webアクセス| D
```

### 手順

1. GitHubリポジトリにDockerfileを配置
1. CloudStorageでバケットを作成
1. IAMでCloudRunに付与するサービスアカウントを作成
    1. 「Storage オブジェクト管理者」ロールを付与
1. CloudRunでサービスを作成
   1. CloudStorageバケットをボリューム化し `/usr/local/lib/python3.11/site-packages/open_webui/data` にマウント

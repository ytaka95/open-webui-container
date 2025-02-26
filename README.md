# open-webui-container

[Open WebUI](https://github.com/open-webui/open-webui)をDockerイメージ化するためのDockerfileを置く場所。

## 構成図

現状では以下のようにクラウド上でホスティングしている。

```marmaid
graph LR
    A[本リポジトリ] -->|ビルド＆デプロイ| B[CloudRun]
    C[ユーザー] -->|Webアクセス| B
    B <-->|永続化ファイルを保存| D[CloudStorage]
```

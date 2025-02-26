FROM python:3.11-slim

# 環境変数の設定
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# 作業ディレクトリの作成
WORKDIR /app

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Open-WebUIのインストール
RUN pip install --upgrade pip && \
    pip install open-webui

# ポートの公開
EXPOSE 8080

# 起動コマンド
CMD ["open-webui", "serve"]

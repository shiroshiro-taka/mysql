FROM docker.io/mysql/mysql-server:8.0.24

# 1. OSレベルのタイムゾーンを日本に設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 2. 設定ファイルの配置と権限設定
COPY config/user.cnf /etc/my.cnf
RUN chown mysql:mysql /etc/my.cnf && chmod 644 /etc/my.cnf

# 3. 環境変数を使用して、起動スクリプト経由でタイムゾーンを指定
# mysql-serverイメージの起動スクリプトはこの変数を読み取ります
ENV MYSQLD_OPTS="--default-time-zone=+09:00"

# 念のため、実行ユーザーを明示
USER mysql

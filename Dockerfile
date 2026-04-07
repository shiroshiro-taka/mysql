FROM docker.io/mysql/mysql-server:8.0.24

# 1. OSレベルのタイムゾーンを日本に固定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 2. 設定ファイルをコピー（念のため残しますが、CMDで上書きします）
COPY config/user.cnf /etc/my.cnf
RUN chown mysql:mysql /etc/my.cnf && chmod 644 /etc/my.cnf

# 3. 起動時に直接システムタイムゾーンの使用を強制する
# mysql-serverイメージのデフォルトのエントリポイントを維持しつつ、引数を渡します
CMD ["mysqld", "--default-time-zone=+09:00"]

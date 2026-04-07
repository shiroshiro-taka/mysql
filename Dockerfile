# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
FROM mysql/mysql-server:8.0.24

# OSのタイムゾーンを日本に設定
ENV TZ=Asia/Tokyo

COPY config/user.cnf /etc/mysql/my.cnf

# 必要に応じて実行権限などを調整
RUN chmod 644 /etc/mysql/my.cnf
```

### 3. Spring Boot側：接続URLの再確認

Java側の `SPRING_DATASOURCE_URL`（Renderの環境変数）に、以下のパラメータが**確実に入っていること**を再度確認してください。

```text
jdbc:mysql://[ホスト]:3306/[DB名]?serverTimezone=Asia/Tokyo&useSSL=false

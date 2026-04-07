# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
# FROM mysql/mysql-server:8.0.24
FROM docker.io/mysql/mysql-server:8.0.24

# OSのタイムゾーンを日本に設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#　COPY config/user.cnf /etc/mysql/my.cnf
# 設定ファイルを「conf.d」ディレクトリにコピーする
# ファイル名は .cnf で終わる必要があります
# COPY config/user.cnf /etc/mysql/conf.d/user.cnf
COPY config/user.cnf /etc/my.cnf

# 必要に応じて実行権限などを調整
#　RUN chmod 644 /etc/mysql/my.cnf
# 権限を厳格に設定（MySQLは権限が緩い設定ファイルを無視します）
# RUN chmod 644 /etc/mysql/conf.d/user.cnf
# MySQLは所有者が適切でない場合も無視することがあるため、所有者変更も追加します
RUN chown mysql:mysql /etc/my.cnf && chmod 644 /etc/my.cnf

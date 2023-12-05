## Dockerコマンド
`bundle install`
```
$ docker-compose run --rm back bundle install
```

gemを追加・更新したら
```
$ docker-compose build
```

Dockerコンテナにインストールされているgemを確認
```
$ docker-compose run --rm  back bundle list
```
# Riot.jsの検証リポジトリ

## ブランチ

* master > Riot.jsのみ
* add-webpack-trial > tagファイルをWebpackでビルドする

## webpackでのビルドについて

webpackでのタグロードには以下のwebpack loaderを使っている。

https://github.com/esnunes/riotjs-loader

webpack-dev-serverの起動はMac環境では以下。

```
~/node_module/.bin/webpack-dev-server --inline --hot
```

webpackでビルドされたタグの読み込みを確認するのは `http://localhost:8080/index_webpack.html` を開く。
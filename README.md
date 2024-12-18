# docker-mirakc-konomitv
[mirakc](https://github.com/mirakc/mirakc) + [KonomiTV](https://github.com/tsukumijima/KonomiTV) の Docker コンテナ

## 前提条件

- Docker, Docker Compose の導入が必須
- ホスト上の pcscd は停止する
- チューナーのドライバが適切にインストールされていること

## インストール手順

```sh
curl -sf https://raw.githubusercontent.com/heisannn/docker-mirakc-konomitv/main/setup.sh | sh -s
cd docker-mirakc-konomitv

# mirakcの設定
vim mirakc/config.yml

# KonomiTVの設定
vim KonomiTV/docker-compose.yaml
vim KonomiTV/config.yaml

# devicesなどの設定を適宜変更する
vim docker-compose.yaml
```

## チャンネルスキャン ([uru2/scan_ch_mirakc_docker.sh](https://gist.github.com/uru2/7f738d864c2789b35c35e6bb7be9d0cb))

```sh
sudo apt install -y jq
cd mirakc
curl -sf https://gist.githubusercontent.com/uru2/7f738d864c2789b35c35e6bb7be9d0cb/raw/a113304cd4d30eacc154f88aa61704e5078521eb/scan_ch_mirakc_docker.sh | sh -s

# チャンネルスキャンが終わると、mirakc_channels.yml が生成されるのでその内容を config.yml に追記する
cat mirakc_channels.yml >> config.yml
```

## 起動

```sh
sudo docker compose up -d
```

## 停止

```sh
sudo docker compose down
```

## 更新

```sh
# mirakcを更新
sudo docker compose pull
# KonomiTVを更新
git submodule update
sudo docker compose build --pull
# 最新のイメージを元に起動
sudo docker compose up -d
```

## 設定

### mirakc

* ポート番号: 40772

### KonomiTV

* URL: https://192-168-1-20.local.konomi.tv:7000/ (詳細は[こちら](https://github.com/tsukumijima/KonomiTV?tab=readme-ov-file#httpsaa-bb-cc-ddlocalkonomitv7000-%E3%81%AE-url-%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6))

## 参考

- [masnagam](https://github.com/masnagam) - [mirakc/mirakc](https://github.com/mirakc/mirakc), [できるmirakc](https://mirakc.github.io/dekiru-mirakc/v3/)
- [tsukumijima](https://github.com/tsukumijima) - [tsukumijima/KonomiTV](https://github.com/tsukumijima/KonomiTV)
- [uru2](https://github.com/uru2) - [uru2/scan_ch_mirakc_docker.sh](https://gist.github.com/uru2/7f738d864c2789b35c35e6bb7be9d0cb)
- [l3tnun](https://github.com/l3tnun) - [l3tnun/docker-mirakurun-epgstation](https://github.com/l3tnun/docker-mirakurun-epgstation)

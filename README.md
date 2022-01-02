# docker-compose-wordpress

Docker Compose を使って WordPress、MySQL、phpMyAdmin のローカル環境の構築

---

## 内容

- [docker-compose-wordpress](#docker-compose-wordpress)
  - [内容](#内容)
  - [Docker Compose のインストール](#docker-compose-のインストール)
  - [使い方](#使い方)
  - [お手軽 Docker コマンド起動 Ruby スクリプト docker.rb](#お手軽-docker-コマンド起動-ruby-スクリプト-dockerrb)
  - [docker-compose-wordpress ディレクトリ内のファイルとディレクトリの説明](#docker-compose-wordpress-ディレクトリ内のファイルとディレクトリの説明)
  - [他の WordPress サイトを Docker 側の WordPress にコピーする方法](#他の-wordpress-サイトを-docker-側の-wordpress-にコピーする方法)
  - [Docker Hub Container Image](#docker-hub-container-image)
  - [動作環境](#動作環境)
    - [**macOS Big Sur バージョン 11.5.2**](#macos-big-sur-バージョン-1152)
    - [**macOS Monterey バージョン 12.1 (21C52)**](#macos-monterey-バージョン-121-21c52)
  - [ライセンス](#ライセンス)

---

## Docker Compose のインストール

2021/06/04(Fri) 16:12:34  
[Install Docker Compose | Docker Documentation](https://docs.docker.com/compose/install/)  
[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)  

Docker Compose を使用するには、Docker Desktop をインストールする必要があります。  

2021/03/28(Sun) 13:40:36  
[Docker Pricing & Subscriptions for Individuals & Teams](https://www.docker.com/pricing)  
[https://www.docker.com/pricing](https://www.docker.com/pricing)  

上記 ページに価格表が載っています。私的利用なら、Free 版で問題ありません。  

2021/06/04(Fri) 16:14:35  
[Docker Desktop for Mac and Windows | Docker](https://www.docker.com/products/docker-desktop)  
[https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)  

Docker Desktop をダウンロードしてインストールしてください。  

2021/03/28(Sun) 13:32:26  
[Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)  
[https://hub.docker.com/editions/community/docker-ce-desktop-mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)  

上記ページの Install it も参考になります。  

---

## 使い方

1. ターミナルで git コマンドを使って docker-compose-wordpress をダウンロードします。  

下記例ではホームディレクトリに docker という名前のディレクトリを作成し、その中に docker-compose-wordpress をダウンロードしています。  

```
$ mkdir docker
$ cd docker
$ git clone https://github.com/kyoshiaki/docker-compose-wordpress.git
```

2. カレントディレクトリを docker-compose-wordpress ディレクトリに移動し、docker-compose up -d  コマンドを実行して、コンテナを起動します。  

注意) docker，docker-compose コマンドをお手軽に実行できる Ruby スクリプト docker.rb を同梱しておきましたので、利用してください。  

3. ブラウザで http://localhost:8000 を開くと WordPress のインストール画面が表示されるので、言語を選択し、Continue ボタンをクリックしてください。その後、必要事項を入力して WordPress をインストールしてください。

4. WordPress の管理画面を開くには、ブラウザで http://localhost:8000/wp-admin/  を開いてください。  

5. phpMyAdmin は、ブラウザで http://localhost:8080 を開くと表示できます。ユーザー名、パスワードは、共に wordpress です。

---

## お手軽 Docker コマンド起動 Ruby スクリプト docker.rb  

カレントディレクトリ を docker-compose-wordpress ディレクトリに移動し、docker.rb を実行します。  

```
❯ ./docker.rb
docker
    0: container ls --all                        :List containers
    1: container --help                          :help
    2: image ls --all                            :List images
    3: image --help                              :help
    4: volume ls                                 :List volumes
    5: volume --help                             :help
    6: volume rm docker-compose-wordpress_db_data:Remove one or more volumes
docker-compose
    7: up -d                                     :Create and start containers
    8: restart                                   :Restart services
    9: start                                     :Start services
   10: stop                                      :Stop services
   11: down                                      :Stop and remove containers, networks, images, and volumes
   12: ps --all                                  :List containers
open
   13: http://localhost:8000                     :WordPress
   14: http://localhost:8000/wp-admin/           :WordPress admin
   15: http://localhost:8000/phpinfo.php         :WordPress: phpinfo.php
   16: http://localhost:8080                     :phpMyAdmin
   17: http://localhost:8080/phpinfo.php         :phpMyAdmin: phpinfo.php
   18: .                                         :Finder
code
   19: .                                         :Visual Studio Code
?
```

実行できるコマンドと引数一覧が表示されます。  
実行したいコマンドと引数の左横の番号を ? 文字の後に入力して Return キーを押すとコマンドを実行できます。  

```
?7 
```

例えば、7 を入力すれば、docker-compose up -d  コマンドが実行されます。  

WordPress のサイトをブラウザで開くには、13 を選択します。macOS では、open コマンドを使って、デフォルトブラウザで http://localhost:8000 を開きます。  

---

## docker-compose-wordpress ディレクトリ内のファイルとディレクトリの説明

```
docker-compose-wordpress

|--README.md
この文章が書かれた Markdown ファイル

|--LICENSE.txt
ライセンス文書ファイル

|--docker-compose.yml
Docker Compose 設定ファイル

|--docker.rb
お手軽 Docker コマンド起動 Ruby スクリプト

|--docker_up.sh
コマンド docker-compose up -d を実行するシェルスクリプト

|--ignore
Git の管理に含めないファイルを指定するためのファイル

|--rsync_wp.sh
さくらインターネットのサーバーから rsync コマンドを使って WordPress のファイル一式をダウンロードするスクリプト

|--uploads	
Docker 内の WordPress ディレクトリ /var/www/html/wp-content/uploads をマウントするディレクトリ

|--php
|  |--phpinfo.php
PHP の設定内容表示する PHP プログラム

|  |--uploads.ini
WordPress にアップロードできるファイルサイズの上限値を設定するファイル

他の WordPress サイトのデーターベースを Docker 側の WordPress に phpMyAdmin を使って復元し、他の WordPress の uploads ディレクトリをこのフォルダにコピーすると 他の WordPress サイト を Docker 上で再現できます。
```

---

## 他の WordPress サイトを Docker 側の WordPress にコピーする方法

2021/12/15(Wed) 17:21:08  
[KOYAMA Yoshiaki のブログ – WordPress 出張所 – プログラミングについての試行錯誤と日々の出来事をつらつら書き溜めていきます。](https://kyoshiaki.sakura.ne.jp/wp/)  
[https://kyoshiaki.sakura.ne.jp/wp/](https://kyoshiaki.sakura.ne.jp/wp/)  

詳細は、上記ブログに転載する予定です。

2021/03/11(Thr) 20:02:29  
[WordPress Backups | WordPress.org](https://wordpress.org/support/article/wordpress-backups/)  
[https://wordpress.org/support/article/wordpress-backups/](https://wordpress.org/support/article/wordpress-backups/)  
▼Simple Backup with phpMyAdmin  

2021/03/11(Thr) 20:02:29  
[Restoring Your Database From Backup | WordPress.org](https://wordpress.org/support/article/restoring-your-database-from-backup/)  
[https://wordpress.org/support/article/restoring-your-database-from-backup/](https://wordpress.org/support/article/restoring-your-database-from-backup/)  
▼Restoring Your Database From Backup  
	Using phpMyAdmin #  

---

## Docker Hub Container Image

各々のコンテナの設定は、下記 Docker Hub サイトを参照してください。  

2021/08/16(Mon) 20:48:26  
[Wordpress - Official Image | Docker Hub](https://hub.docker.com/_/wordpress)  
[https://hub.docker.com/_/wordpress](https://hub.docker.com/_/wordpress)  

2021/08/16(Mon) 20:47:34  
[Mysql - Official Image | Docker Hub](https://hub.docker.com/_/mysql)  
[https://hub.docker.com/_/mysql](https://hub.docker.com/_/mysql)  

2021/08/16(Mon) 20:49:13  
[Phpmyadmin - Official Image | Docker Hub](https://hub.docker.com/_/phpmyadmin)  
[https://hub.docker.com/_/phpmyadmin](https://hub.docker.com/_/phpmyadmin)  


---

## 動作環境  

### **macOS Big Sur バージョン 11.5.2**    

・docker desktop  
docker desktop Version 3.5.2 (66501)  
Engine: 20.10.7  
Compose: 1..29.2  
Credential Helper: 0.6.4  
kubernetes: v1.21.2  
Snyk: v1.563.0  

・iMac (Retina 5K, 27-inch, 2019)   
macOS Big Sur バージョン 11.5.2  
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin20)  
zsh 5.8 (x86_64-apple-darwin20.0)  

・Ruby  
macOS Big Sur バージョン 11.5.2  
ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin20]  
ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x86_64-darwin20]  


### **macOS Monterey バージョン 12.1 (21C52)**  
2022/01/02(Sun) 00:19:43  

・docker desktop  
docker desktop Version 4.3.2 (72729)  
Engine: 20.10.11  
Compose: 1..29.2  
Credential Helper: 0.6.4  
kubernetes: v1.22.4  
Snyk: v1.801.0  

・iMac (Retina 5K, 27-inch, 2019)   
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin21)  
zsh 5.8 (x86_64-apple-darwin21.0)  

・Ruby  
ruby 2.6.8p205 (2021-07-07 revision 67951) [universal.x86_64-darwin21]  
ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [x86_64-darwin21]  

2022/01/02(Sun) 00:12:58  
[Apache Log4j 2 CVE-2021-44228 - Docker Blog](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/)  
[https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/)  

---

## ライセンス

 [MIT ライセンス](LICENSE)  


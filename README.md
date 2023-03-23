# docker-compose-wordpress

Docker Compose を使って WordPress、MySQL、phpMyAdmi、WP-CLI のローカル環境の構築

---

## 内容

- [docker-compose-wordpress](#docker-compose-wordpress)
  - [内容](#内容)
  - [Docker Compose のインストール](#docker-compose-のインストール)
  - [使い方](#使い方)
  - [お手軽 Docker コマンド起動 Ruby スクリプト docker.rb](#お手軽-docker-コマンド起動-ruby-スクリプト-dockerrb)
  - [お手軽 Docker コマンド起動 Ruby スクリプト docker.rb の WP-CLI コマンド](#お手軽-docker-コマンド起動-ruby-スクリプト-dockerrb-の-wp-cli-コマンド)
  - [docker-compose-wordpress ディレクトリ内のファイルとディレクトリの説明](#docker-compose-wordpress-ディレクトリ内のファイルとディレクトリの説明)
  - [他の WordPress サイトを Docker 側の WordPress にコピーする方法](#他の-wordpress-サイトを-docker-側の-wordpress-にコピーする方法)
  - [Docker Hub Container Image](#docker-hub-container-image)
  - [動作環境](#動作環境)
    - [**macOS Ventura バージョン 13.2.1**](#macos-ventura-バージョン-1321)
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
docker-compose run --rm cli
   13: db search 'Hello world'                   :wp db search 'Hello world'
   14: --help                                    :wp --help : 'q' to quit
docker-compose run --rm cli
   15: <COMMAND>                                 :wp <COMMAND>
open
   16: http://localhost:8000                     :WordPress
   17: http://localhost:8000/wp-admin/           :WordPress admin
   18: http://localhost:8000/phpinfo.php         :WordPress: phpinfo.php
   19: http://localhost:8080                     :phpMyAdmin
   20: http://localhost:8080/phpinfo.php         :phpMyAdmin: phpinfo.php
   21: .                                         :Finder
code
   22: .                                         :Visual Studio Code
?
```

実行できるコマンドと引数一覧が表示されます。  
実行したいコマンドと引数の左横の番号を ? 文字の次の行に入力して Return キーを押すとコマンドを実行できます。  

```
?
7 
```

例えば、7 を入力すれば、docker-compose up -d  コマンドが実行されます。  

WordPress のサイトをブラウザで開くには、16 を選択します。macOS では、open コマンドを使って、デフォルトブラウザで http://localhost:8000 を開きます。  


## お手軽 Docker コマンド起動 Ruby スクリプト docker.rb の WP-CLI コマンド  

```
❯ ./docker.rb
docker
︙
docker-compose
    7: up -d                                     :Create and start containers
    8: restart                                   :Restart services
    9: start                                     :Start services
   10: stop                                      :Stop services
   11: down                                      :Stop and remove containers, networks, images, and volumes
   12: ps --all                                  :List containers
docker-compose run --rm cli
   13: db search 'Hello world'                   :wp db search 'Hello world'
   14: --help                                    :wp --help : 'q' to quit
docker-compose run --rm cli
   15: <COMMAND>                                 :wp <COMMAND>
open
︙
code
   22: .                                         :Visual Studio Code
?
```

13、14、15 の番号は、WP-CLI コンテナを削除し、再作成した後に起動します。

2023/03/21(Tue) 19:21:00  
[wordpress/Dockerfile at 809519cc86bee0d6c7f2743976a850267983e2c2 · docker-library/wordpress](https://github.com/docker-library/wordpress/blob/809519cc86bee0d6c7f2743976a850267983e2c2/cli/php8.2/alpine/Dockerfile)  
[https://github.com/docker-library/wordpress/blob/809519cc86bee0d6c7f2743976a850267983e2c2/cli/php8.2/alpine/Dockerfile](https://github.com/docker-library/wordpress/blob/809519cc86bee0d6c7f2743976a850267983e2c2/cli/php8.2/alpine/Dockerfile)  

```
ENTRYPOINT ["docker-entrypoint.sh"]
USER www-data
CMD ["wp", "shell"]
```

WP-CLI コンテナは、実行されると上記 Dockerfile の CMD ["wp", "shell"] より、wp コマンドをシェルモードで起動します。

CMD 命令の詳細は、下記ページを参考にしてください。  

2023/03/23(Thr) 18:46:44  
[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)  
[https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)  

[CMD🔗](https://docs.docker.com/engine/reference/builder/#cmd)  

The CMD instruction has three forms:  

・CMD ["executable","param1","param2"] (exec form, this is the preferred form)  
・CMD ["param1","param2"] (as default parameters to ENTRYPOINT)  
・CMD command param1 param2 (shell form)  
There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.  

The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.  

If CMD is used to provide default arguments for the ENTRYPOINT instruction, both the CMD and ENTRYPOINT instructions should be specified with the JSON array format.  

```
❯ ./docker.rb
docker
︙
docker-compose run --rm cli
   13: db search 'Hello world'                   :wp db search 'Hello world'
   14: --help                                    :wp --help : 'q' to quit
docker-compose run --rm cli
   15: <COMMAND>                                 :wp <COMMAND>
open
︙
code
   22: .                                         :Visual Studio Code
?
```

13番を選択するとコマンド docker-compose run --rm cli db search 'Hello world' を実行します。
コマンドの引数、db search 'Hello world' がシェルモードの wp に下記のように渡され実行されます。

```
?
13 
❯ docker-compose run --rm cli db search 'Hello world'

[+] Running 2/0
 ⠿ Container docker-compose-wordpress-db-1         Running                                                                                                                     0.0s
 ⠿ Container docker-compose-wordpress-wordpress-1  Running                                                                                                                     0.0s
wp_posts:post_title
1:Hello world!
```

上記結果より、データベースのテーブル wp_posts、カラム post_title に 'Hello world' の文字列が１箇所見つかりました。  

```
?
15
wp <COMMAND>
ex. 
  COMMAND:
    --info 
    --help 
    db search 'WordPress'
    search-replace 'https://example.com' 'https://example.net' --skip-columns=guid
    search-replace 'https://example.com' https://example.net' 
    search-replace 'Hello world' 'Welcome WordPress' 

COMMAND ?
search-replace 'Hello world' 'Welcome WordPress' 
❯ docker-compose run --rm cli search-replace 'Hello world' 'Welcome WordPress' 


[+] Running 2/0
 ⠿ Container docker-compose-wordpress-db-1         Running                                                                                                                     0.0s
 ⠿ Container docker-compose-wordpress-wordpress-1  Running                                                                                                                     0.0s
+------------------+-----------------------+--------------+------+
| Table            | Column                | Replacements | Type |
+------------------+-----------------------+--------------+------+
| wp_commentmeta   | meta_key              | 0            | SQL  |
| wp_commentmeta   | meta_value            | 0            | SQL  |
| wp_comments      | comment_author        | 0            | SQL  |
| wp_comments      | comment_author_email  | 0            | SQL  |
| wp_comments      | comment_author_url    | 0            | SQL  |
| wp_comments      | comment_author_IP     | 0            | SQL  |
| wp_comments      | comment_content       | 0            | SQL  |
| wp_comments      | comment_approved      | 0            | SQL  |
| wp_comments      | comment_agent         | 0            | SQL  |
| wp_comments      | comment_type          | 0            | SQL  |
| wp_links         | link_url              | 0            | SQL  |
| wp_links         | link_name             | 0            | SQL  |
| wp_links         | link_image            | 0            | SQL  |
| wp_links         | link_target           | 0            | SQL  |
| wp_links         | link_description      | 0            | SQL  |
| wp_links         | link_visible          | 0            | SQL  |
| wp_links         | link_rel              | 0            | SQL  |
| wp_links         | link_notes            | 0            | SQL  |
| wp_links         | link_rss              | 0            | SQL  |
| wp_options       | option_name           | 0            | SQL  |
| wp_options       | option_value          | 0            | PHP  |
| wp_options       | autoload              | 0            | SQL  |
| wp_postmeta      | meta_key              | 0            | SQL  |
| wp_postmeta      | meta_value            | 0            | SQL  |
| wp_posts         | post_content          | 0            | SQL  |
| wp_posts         | post_title            | 1            | SQL  |
| wp_posts         | post_excerpt          | 0            | SQL  |
| wp_posts         | post_status           | 0            | SQL  |
| wp_posts         | comment_status        | 0            | SQL  |
| wp_posts         | ping_status           | 0            | SQL  |
| wp_posts         | post_password         | 0            | SQL  |
| wp_posts         | post_name             | 0            | SQL  |
| wp_posts         | to_ping               | 0            | SQL  |
| wp_posts         | pinged                | 0            | SQL  |
| wp_posts         | post_content_filtered | 0            | SQL  |
| wp_posts         | guid                  | 0            | SQL  |
| wp_posts         | post_type             | 0            | SQL  |
| wp_posts         | post_mime_type        | 0            | SQL  |
| wp_term_taxonomy | taxonomy              | 0            | SQL  |
| wp_term_taxonomy | description           | 0            | SQL  |
| wp_termmeta      | meta_key              | 0            | SQL  |
| wp_termmeta      | meta_value            | 0            | SQL  |
| wp_terms         | name                  | 0            | SQL  |
| wp_terms         | slug                  | 0            | SQL  |
| wp_usermeta      | meta_key              | 0            | SQL  |
| wp_usermeta      | meta_value            | 0            | PHP  |
| wp_users         | user_login            | 0            | SQL  |
| wp_users         | user_nicename         | 0            | SQL  |
| wp_users         | user_email            | 0            | SQL  |
| wp_users         | user_url              | 0            | SQL  |
| wp_users         | user_activation_key   | 0            | SQL  |
| wp_users         | display_name          | 0            | SQL  |
+------------------+-----------------------+--------------+------+
Success: Made 1 replacement.
```

上記のように 15番を選択した場合、COMMAND ? の次の行に wp コマンドに渡す引数を入力して、実行することができます。  

コマンドの例、--info、db search 'WordPress'　などが表示されるので参考にしてください。  
上記例では、COMMAND ?の次の行に、文字列 "search-replace 'Hello world' 'Welcome WordPress'" を入力して、Return キーを押して実行しています。  

上記結果より、データベースのテーブル wp_posts、カラム post_title の 'Hello world' の文字列が１箇所 'Welcome WordPress' に変更されています。  

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

### **macOS Ventura バージョン 13.2.1**    

・docker desktop  
docker desktop Version 4.17.0 (99724)  
Engine: 20.10.23  
Compose: v2.15.1  
Credential Helper: v0.7.4  
kubernetes: v1.25.4  

・Mac mini (2023)     
macOS Ventura バージョン 13.2.1  
GNU bash, version 3.2.57(1)-release (arm64-apple-darwin22) 
zsh 5.8.1 (x86_64-apple-darwin22.0)

・Ruby  
macOS Ventura バージョン 13.2.1 
ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22] 
ruby 3.2.0 (2022-12-25 revision a528908271) [arm64-darwin22]

---

## ライセンス

 [MIT ライセンス](LICENSE)  


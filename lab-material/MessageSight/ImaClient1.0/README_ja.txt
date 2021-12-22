IBM® MessageSight™ JMS Client V1.0
2013 年 4 月

目次
1. 説明
2. IBM MessageSight JMS Client パッケージの内容
3. サンプル・アプリケーションの作業
4. JMS クライアントを Eclipse にインポートする
5. 制限および既知の問題


説明
====
この README ファイルでは、IBM MessageSight JMS Client の
内容、更新、修正、制限、および既知の問題について説明します。

IBM MessageSight について詳しくは、
この製品のインフォメーション・センター
(https://pic.dhe.ibm.com/infocenter/ism/v1r0m0/index.jsp)
を参照してください。


IBM MESSAGESIGHT JMS CLIENT の内容
==============================================
Java™ Messaging Service (JMS) の IBM MessageSight クライアント
実装は、ImaJmsClientV1.0.zip パッケージによって提供されます。この中には、
IBM MessageSight で使用する JMS 管理対象オブジェクトを作成
および構成するために使用されるクラスのドキュメンテーションも含まれています。
さらに、サンプルのソース・コンポーネントとサンプル本体も含まれています。

ディレクトリーとファイル:
    ImaClient/
        README.txt - このファイル
        version.txt - IBM MessageSight JMS Client の
             バージョン情報が含まれています

        jms/
            .classpath および .project - jms サブディレクトリーを
             Eclipse プロジェクトとしてインポートするための
             Eclipse プロジェクトの構成ファイル
            	
            doc/ - IBM MessageSight 用 JMS 管理対象オブジェクトの
                作成および構成に関するドキュメンテーションが含まれて
                います。

            java/
                samples/ - サンプル・アプリケーション (ソース・コンポーネント)
                    が含まれています。それらは、管理対象オブジェクトの作成方法、
                    IBM MessageSight を通じてメッセージを送受信する
                    方法、および高可用性構成対応のクライアント・アプリケーション
                    を作成する方法を示すデモです。

            lib/
                imaclientjms.jar - JMS インターフェースの
                    IBM MessageSight 実装
                jms.jar - JMS 1.1 インターフェース用 JAR ファイル
                jmssamples.jar - IBM MessageSight JMS Client で
                    提供されているサンプル・コード (ソース・コンポーネント)
                    のコンパイル済みクラス (サンプル本体)
                fscontext.jar および providerutil.jar - ファイル・システム
                    JNDI プロバイダーを実装する JAR ファイル
            license/ IBM MessageSight JMS Client の使用許諾契約ファイル


サンプル・アプリケーションの作業
================================
クライアントには、4 つのサンプル・アプリケーションが提供されています。
それらは以下のとおりです。
    JMSSampleAdmin
    JMSSample
    HATopicPublisher
    HADurableSubscriber

JMSSampleAdmin アプリケーションは、IBM MessageSight の
JMS 管理対象オブジェクトを作成、構成、および保管する方法を示します。
これは、入力ファイルから IBM MessageSight JMS 管理対象
オブジェクトの構成を読み取り、JNDI リポジトリーのデータを設定します。
このアプリケーションにより、LDAP またはファイル・システム JNDI
リポジトリーのいずれかのデータを設定できます。

JMSSample アプリケーションは、IBM MessageSight のトピックおよび
キューとの間でメッセージを送受信する方法を示します。これは、JMSSample、
JMSSampleSend、および JMSSampleReceive という 3 つのクラスによって実装
されています。JMSSample アプリケーションを利用することにより、
JNDI リポジトリーから管理対象オブジェクトを取得したり、必要な
管理対象オブジェクトを実行時に作成および構成したりすることができます。

HATopicPublisher および HADurableSubscriber は、JMS クライアント・
アプリケーションにおいて IBM MessageSight 高可用性
フィーチャーを活用する方法を示します。

クライアントに提供されているサンプル・アプリケーションを実行するには、
クラスパスの中に imaclientjms.jar、jms.jar、および jmssamples.jar の
3 つの JAR ファイルが必要です。これら 3 つのファイルはすべて ImaClient/jms/lib
の中に入っています。JMSSampleAdmin および JMSSsample の各アプリケーション
を実行する際にファイル・システム JNDI プロバイダーを使用するには、
クラスパスの中にさらに 2 つの JAR ファイル fscontext.jar および
providerutil.jar が必要です。それらの JAR ファイルは、いずれも
ImaClient/jms/lib の中にあります。

コンパイル済みサンプルの実行 (Linux):
=====================================
Linux では、CLASSPATH 環境変数を以下のように設定します
(ImaClient/jms から実行)。
    lib/imaclientjms.jar:lib/jms.jar:lib/jmssamples.jar

あるいは、ファイル・システム JNDI プロバイダーを使用する場合、
CLASSPATH は以下のように設定します。
    lib/imaclientjms.jar:lib/jms.jar:lib/jmssamples.jar:lib/fscontext.jar:lib/providerutil.jar

以下のサンプル・コマンド・ラインでは、各アプリケーションが実行され、
それぞれの使用方法についての説明が表示されます (ImaClient/jms から実行)。

    java -classpath $CLASSPATH com.ibm.ima.samples.jms.JMSSampleAdmin
    java -classpath $CLASSPATH com.ibm.ima.samples.jms.JMSSample
    java -classpath $CLASSPATH com.ibm.ima.samples.jms.HATopicPublisher
    java -classpath $CLASSPATH com.ibm.ima.samples.jms.HADurableSubscriber

コンパイル済みサンプルの実行 (Windows):
=======================================
Windows では、CLASSPATH 環境変数を以下のように設定します
(ImaClient/jms から実行)。
    lib\imaclientjms.jar;lib\jms.jar;lib\jmssamples.jar

あるいは、ファイル・システム JNDI プロバイダーを使用する場合、
CLASSPATH は以下のように設定します。
    lib\imaclientjms.jar;lib\jms.jar;lib\jmssamples.jar;lib\fscontext.jar;lib\providerutil.jar

以下のサンプル・コマンド・ラインでは、各アプリケーションが実行され、
それぞれの使用方法についての説明が表示されます (ImaClient/jms から実行)。

    java -classpath %CLASSPATH% com.ibm.ima.samples.jms.JMSSampleAdmin
    java -classpath %CLASSPATH% com.ibm.ima.samples.jms.JMSSample
    java -classpath %CLASSPATH% com.ibm.ima.samples.jms.HATopicPublisher
    java -classpath %CLASSPATH% com.ibm.ima.samples.jms.HADurableSubscriber

サンプル・アプリケーションをローカルにビルドする場合、クラスパス中に
必要なのは jms.jar と imaclientjms.jar のみです。


JMS クライアントを Eclipse にインポートする
===========================================
IBM MessageSight JMS Client を Eclipse にインポートするには、
以下のステップを実行します。
1. ImaJmsClientV1.0.zip の内容を unzip します。
2. Eclipse で「ファイル」→「一般」→「既存プロジェクトをワークスペースへ」
   を選択します。
3. zip ファイル解凍先の中の jms サブディレクトリーに移動し、それを選択します。
4. 「終了」ボタンをクリックします。

この作業を実行すると、サンプル・アプリケーションおよび自分で作成した
クライアント・アプリケーションを Eclipse からコンパイルおよび実行できる
ようになります。


制限および既知の問題
====================
1. IBM MessageSight JMS Client で実装されているのは、JSE JMS の
機能のみです。オプションのメソッドとインターフェースのうちアプリケーション・
サーバー (JEE) サポートに関連するものについては、実装されていません。

2. IBM MessageSight JMS 実装では、受信した順序に従って
メッセージが送達されます。メッセージ優先順位の設定値は、送達の順序に
影響しません。


商標
=======
1. IBM、IBM ロゴ、ibm.com および MessageSight は、世界の多くの国で登録された
International Business Machines Corporation の商標です。
他の会社名、製品名およびサービス名等はそれぞれ各社の商標です。
現時点での IBM の商標リストについては、
www.ibm.com/legal/copytrade.shtml をご覧ください。

2. Java およびすべての Java 関連の商標およびロゴは Oracle やその関連会社の米国およびその他の
国における商標または登録商標です。
	

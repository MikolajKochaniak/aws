# Install java ecommerce

* aws via web ✅
* vscode✅
* cli -> gitbash, terminal 
* vm & public ip
    * confirm access 
    * private key + user
* repository

## Assumption
 * IP: 35.159.84.129 ✅
 * username: ec2-user ✅
 * key passphrase: ``student1``

### SSH access

```bash
curl -O http://adsk.dydaktyka.jkan.pl/_static/id_student
```

```bash
chmod 600 id_student
```

```bash
ssh ec2-user@35.159.84.129 -i id_student
```

## install packages

* Package manager 
  * Debian -> ``apt`` 
  * Alpine -> ``apk`` 
  * Amazon linux -> ``dnf`` 
* search for packages
  * ``dnf search java``
* install
  * ``sudo dnf install cowsay tree mc``

## Repository
* URL: https://github.com/jkanclerz/computer-programming-4-2024.git

* install: ``sudo dnf install git``
* sync repository
  * ``git clone https://github.com/jkanclerz/computer-programming-4-2024.git -b main /my/dest/directory``


## JVM & Maven
* ``sudo dnf install java-17-amazon-corretto``

* install maven
  * download binary arch
  * ``wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz``
  * unarchive ``tar -zxf apache-maven-3.9.9-bin.tar.gz``
  * [OPTIONAL]: check $PATH -> ``echo $PATH``
  * link to path 
    * ``sudo ln -fs /home/ec2-user/apache-maven-3.9.9/bin/mvn /usr/local/bin/mvn``
  * verify installation
    * ``mvn -version`` 

## DIRS

## test & compile

* ``cd computer-programming-4-2024``
* ``mvn compile``
* ``mvn test``
* ``mvn package``
* Don't try at home! 
  * ``mvn -DskipTests package``

## start ecommerce
* assume ``target/CreditCard-1.0-SNAPSHOT.jar`` exists

* ``java -jar target/CreditCard-1.0-SNAPSHOT.jar``

* chrome open -> ``http://35.159.84.129:8080``

``sudo java -Dserver.port=80 -jar target/CreditCard-1.0-SNAPSHOT.jar``
* chrome open -> ``http://35.159.84.129``
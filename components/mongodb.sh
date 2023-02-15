curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo

yum install -y mongodb-org
systemctl enable mongod
systemctl start mongod

sed -e -i 's/127\.0\.0\.1/0\.0\.0\.0/gi' /etc/mongod.conf
systemctl restart mongod
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
# -o added to below command to overwrite if unzip already exists. And hence this script can be run as many times as we need and will not fail
unzip -o mongodb.zip
cd mongodb-main
mongo < catalogue.js
mongo < users.js
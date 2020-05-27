sudo docker build -t phase4-scsb-mysql .
sudo docker run --name phase4-scsb-mysql -e MYSQL_ROOT_PASSWORD=root -v /data/mysql-data-7:/var/lib/mysql -p 3306:3306 -d phase4-scsb-mysql
sudo docker logs -f phase4-scsb-mysql
sudo docker inspect phase4-scsb-mysql | grep IPAddress
sudo docker exec -it phase4-scsb-mysql /bin/bash


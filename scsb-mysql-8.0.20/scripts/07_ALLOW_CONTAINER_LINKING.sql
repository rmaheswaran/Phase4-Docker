use mysql;
CREATE USER 'recap'@'%' IDENTIFIED BY 'recap';
GRANT ALL ON *.* TO 'recap'@'%' WITH GRANT OPTION;
#GRANT ALL ON *.* to 'recap'@'%' IDENTIFIED BY 'recap';
#GRANT ALL ON sonar.* TO 'sonar'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

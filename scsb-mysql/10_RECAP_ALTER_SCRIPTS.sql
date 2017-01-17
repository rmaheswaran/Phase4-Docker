USE `recap` ;

ALTER TABLE `USER_T`
ADD COLUMN `USER_EMAILID` VARCHAR(60) NULL AFTER `USER_DESCRIPTION`,
DROP INDEX `FK_USER_T_1_IDX` ,
ADD INDEX `FK_USER_T_1_IDX` (`USER_INSTITUTION` ASC, `LOGIN_ID` ASC),
ADD UNIQUE INDEX `USER_EMAILID_UNIQUE` (`USER_EMAILID` ASC);

ALTER TABLE MATCHING_MATCHPOINTS_T MODIFY COLUMN CRITERIA_VALUE VARCHAR(500);

ALTER TABLE  `ROLE_PERMISSION_T` DROP FOREIGN KEY `FK_ROLE_PERMISSION_T_1`;

ALTER TABLE `USER_ROLE_T` DROP FOREIGN KEY `FK_USER_ROLE_T_2`;

ALTER TABLE `ROLES_T` MODIFY `ROLE_ID` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `ROLE_PERMISSION_T` ADD CONSTRAINT `FK_ROLE_PERMISSION_T_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES_T` (`ROLE_ID`);

ALTER TABLE `USER_ROLE_T` ADD CONSTRAINT `FK_USER_ROLE_T_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES_T` (`ROLE_ID`);

ALTER TABLE  `USER_ROLE_T` DROP FOREIGN KEY `FK_USER_ROLE_T_1`;

ALTER TABLE `USER_T` MODIFY `USER_ID` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `USER_ROLE_T` ADD CONSTRAINT `FK_USER_ROLE_T_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER_T` (`USER_ID`);

ALTER TABLE `ROLE_PERMISSION_T` DROP FOREIGN KEY `FK_ROLE_PERMISSION_T_2`;

ALTER TABLE `PERMISSIONS_T` MODIFY `PERMISSION_ID` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE `ROLE_PERMISSION_T` ADD CONSTRAINT `FK_ROLE_PERMISSION_T_2` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSIONS_T` (`PERMISSION_ID`);


SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL';

DELETE FROM `request_type_t` WHERE `REQUEST_TYPE_CODE`='HOLD';

UPDATE `request_type_t` SET `REQUEST_TYPE_ID`='1' WHERE `REQUEST_TYPE_CODE`='RETRIEVAL';

UPDATE `request_type_t` SET `REQUEST_TYPE_ID`='2' WHERE `REQUEST_TYPE_CODE`='RECALL';

UPDATE `request_type_t` SET `REQUEST_TYPE_ID`='3' WHERE `REQUEST_TYPE_CODE`='EDD';

UPDATE `request_type_t` SET `REQUEST_TYPE_ID`='4' WHERE `REQUEST_TYPE_CODE`='BORROW DIRECT';

ALTER TABLE `request_type_t` AUTO_INCREMENT = 5 ;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;


ALTER TABLE `recap`.`request_item_t`
DROP COLUMN `REQUEST_POSITION`,
DROP INDEX `REQUEST_POSITION_ITEM_ID_PATRON_IDUNIQUE` ;

ALTER TABLE `BIBLIOGRAPHIC_T` ADD COLUMN `CATALOGING_STATUS` VARCHAR(20);
ALTER TABLE `ITEM_T` ADD COLUMN `CATALOGING_STATUS` VARCHAR(20);

ALTER TABLE `CUSTOMER_CODE_T` DROP INDEX `CUSTOMER_CODE_UNIQUE`;
ALTER TABLE `CUSTOMER_CODE_T` ADD CONSTRAINT CUSTOMER_CODE_UNIQUE UNIQUE (`CUSTOMER_CODE`,`OWNING_INST_ID`);
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'AC' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'AD' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'AR' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'AV' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'BC' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'BL' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'BR' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'BS' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'BT' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'BU' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'BZ' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CA' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CF' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CH' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'CI' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'CJ' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CM' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CP' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'CR' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'CS' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'CU' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'CV' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'EA' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'EN' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'EV' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'GC' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'GE' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'GS' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'HR' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'HS' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'HX' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'JC' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'JD' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'LD' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'LE' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'ML' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'MP' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'MR' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'MZ' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'OH' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'RH' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'RS' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2', `DELIVERY_RESTRICTIONS`='AC,AD,AR,AV,BC,BL,BR,BS,BT,BU,BZ,CA,CF,CH,CI,CJ,CM,CP,CR,CS,CU,CV,EA,EN,EV,GC,GE,GS,HR,HS,HX,JC,JD,LD,LE,ML,MP,MR,MZ,OH,RH,RS,SW,UA,UT,CD,CL,CX,JL,JM' WHERE `CUSTOMER_CODE` = 'SW' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'UA' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `OWNING_INST_ID`='2' WHERE `CUSTOMER_CODE` = 'UT' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NA' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NC**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'ND**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NE**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NF**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NG**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS,EDD,GO,IL,RR' WHERE `CUSTOMER_CODE` = 'NH' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NI**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NJ**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NK**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS,EDD,GO,IL,RR' WHERE `CUSTOMER_CODE` = 'NL' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NM**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NT**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS,EDD,GO,IL,RR' WHERE `CUSTOMER_CODE` = 'NW' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NY' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'NZ**' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'GN' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'ID' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS' WHERE `CUSTOMER_CODE` = 'JN' AND `OWNING_INST_ID`='3';
UPDATE `CUSTOMER_CODE_T` SET `DELIVERY_RESTRICTIONS`='NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS,EDD,GO,IL,RR' WHERE `CUSTOMER_CODE` = 'JO' AND `OWNING_INST_ID`='3';
INSERT INTO `CUSTOMER_CODE_T` (`CUSTOMER_CODE_ID`,`CUSTOMER_CODE`,`DESCRIPTION`,`OWNING_INST_ID`,`DELIVERY_RESTRICTIONS`) VALUES (116,'GO','Google NYPL',3,'NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS');
INSERT INTO `CUSTOMER_CODE_T` (`CUSTOMER_CODE_ID`,`CUSTOMER_CODE`,`DESCRIPTION`,`OWNING_INST_ID`,`DELIVERY_RESTRICTIONS`) VALUES (117,'JS','SIBL De-duping candidates',3,'NA,NB,NC**,ND**,NE**,NF**,NG**,NH,NI**,NJ**,NK**,NL,NM**,NN,NO,NP,NQ,NR,NS,NT**,NU,NV,NW,NX,NY,NZ**,GN,GO,ID,JN,JO,JS');

ALTER TABLE `request_item_t` CHANGE `CREATD_DATE` `CREATED_DATE` DATETIME;

ALTER TABLE `request_item_t` ADD COLUMN `REQUESTING_INST_ID` INT NOT NULL;

ALTER TABLE `request_item_t` ADD INDEX `REQUESTING_INST_ID_FK_idx` (`REQUESTING_INST_ID` ASC);

ALTER TABLE `request_item_t` ADD CONSTRAINT `REQUESTING_INST_ID_FK` FOREIGN KEY (`REQUESTING_INST_ID`) REFERENCES `institution_t` (`INSTITUTION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

UPDATE `request_type_t` SET `REQUEST_TYPE_CODE`='BORROW DIRECT', `REQUEST_TYPE_DESC`='BORROW DIRECT' WHERE `REQUEST_TYPE_ID`='5';

DROP INDEX OCLC_idx ON matching_bib_t;

DROP INDEX ISBN_idx ON matching_bib_t;

DROP INDEX ISSN_idx ON matching_bib_t;

ALTER TABLE matching_bib_t MODIFY COLUMN OCLC VARCHAR(1500);

ALTER TABLE matching_bib_t MODIFY COLUMN ISBN VARCHAR(1500);

ALTER TABLE matching_bib_t MODIFY COLUMN ISSN VARCHAR(1500);
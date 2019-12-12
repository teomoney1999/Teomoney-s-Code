SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `User_Role`;
DROP TABLE IF EXISTS `Role`;
DROP TABLE IF EXISTS `Role_Function`;
DROP TABLE IF EXISTS `function`;
DROP TABLE IF EXISTS `Teacher_Info`;
DROP TABLE IF EXISTS `Center_Info`;
DROP TABLE IF EXISTS `Rescruiment_Form`;
DROP TABLE IF EXISTS `Apply`;
DROP TABLE IF EXISTS `Location`;
DROP TABLE IF EXISTS `Hire`;
DROP TABLE IF EXISTS `InterviewInvite`;
DROP TABLE IF EXISTS `Center_Rescruiment_Form`;
DROP TABLE IF EXISTS `Report`;
DROP TABLE IF EXISTS `User_InterviewInvite`;
SET FOREIGN_KEY_CHECKS = 1;
create database `QUALK`;
use QUALK;
drop database QUALK;
CREATE TABLE `User` (
    `ID` BIGINT NOT NULL auto_increment,
    `UserName` VARCHAR(255) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `User_Role` (
    `ID` BIGINT NOT NULL auto_increment,
    `User_ID` BIGINT NOT NULL,
    `Role_ID` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Role` (
    `ID` BIGINT NOT NULL auto_increment,
    `RoleName` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Role_Function` (
    `ID` BIGINT NOT NULL auto_increment,
    `Role_ID` BIGINT NOT NULL,
    `function_ID` BIGINT NOT NULL,
	`View` BOOLEAN NOT NULL,
    `Insert` BOOLEAN NOT NULL,
    `Modify` BOOLEAN NOT NULL,
    `Delete` BOOLEAN NOT NULL,
    `Search` BOOLEAN NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Function` (
    `ID` BIGINT NOT NULL auto_increment,
    `FunctionName` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Teacher_info` (
    `ID` BIGINT NOT NULL auto_increment,
    `User_ID` BIGINT NOT NULL,
    `Location_ID` BIGINT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `BirthDate` DATE NOT NULL,
    `Address` TEXT NOT NULL,
    `Degree` TEXT NOT NULL,
    `Experiences` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `Skills` TEXT NOT NULL,
    `Available` BOOLEAN NOT NULL,
    `Salary_Want` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Center_Info` (
    `ID` BIGINT NOT NULL auto_increment,
    `User_ID` BIGINT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Specialize` TEXT NOT NULL,
    `Address` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `Available` BOOLEAN NOT NULL,
    `Location_ID` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Rescruiment_Form` (
    `ID` BIGINT NOT NULL auto_increment,
    `Location_ID` BIGINT NOT NULL,
    `Title` TEXT NOT NULL,
    `Salary` BIGINT NOT NULL,
    `DateStart` DATE NOT NULL,
    `Content` TEXT NOT NULL,
    `Position` TEXT NOT NULL,
    `Requirement` TEXT NOT NULL,
    `Contact` TEXT NOT NULL,
    `DateEnd` DATETIME NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Apply` (
    `ID` BIGINT NOT NULL auto_increment,
    `Teacher_ID` BIGINT NOT NULL,
    `Center_ID` BIGINT NOT NULL,
    `Datetime` DATETIME NOT NULL,
    `Status` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Location` (
    `ID` BIGINT NOT NULL auto_increment,
    `Name` VARCHAR(255) NOT NULL,
    `Type` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ID`)
);


CREATE TABLE `InterviewInvite` (
    `ID` BIGINT NOT NULL auto_increment,
    `Datetime` DATETIME NOT NULL,
    `Title` VARCHAR(255) NOT NULL,
    `Text` TEXT NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Center_Rescruiment_Form` (
    `Id` BIGINT NOT NULL auto_increment,
    `Center_ID` BIGINT NOT NULL,
    `Rescruiment_Form_ID` BIGINT NOT NULL,
    PRIMARY KEY (`Id`)
);

CREATE TABLE `Report` (
    `ID` BIGINT NOT NULL auto_increment,
    `Center_ID` BIGINT NOT NULL,
    `Teacher_ID` BIGINT NOT NULL,
    `Title` TEXT NOT NULL,
    `Content` TEXT NOT NULL,
    `Datetime` DATETIME NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `User_InterviewInvite` (
    `ID` BIGINT NOT NULL auto_increment,
    `User_Receive` BIGINT NOT NULL,
    `User_Send` BIGINT NOT NULL,
    PRIMARY KEY (`ID`)
);

ALTER TABLE `User_Role` ADD FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`);
ALTER TABLE `User_Role` ADD FOREIGN KEY (`Role_ID`) REFERENCES `Role`(`ID`);
ALTER TABLE `Role_Function` ADD FOREIGN KEY (`Role_ID`) REFERENCES `Role`(`ID`);
ALTER TABLE `Role_Function` ADD FOREIGN KEY (`Function_ID`) REFERENCES `function`(`ID`);
ALTER TABLE `Teacher_Info` ADD FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`);
ALTER TABLE `Teacher_Info` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Center_Info` ADD FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`);
ALTER TABLE `Center_Info` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Rescruiment_Form` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Location`(`ID`);
ALTER TABLE `Apply` ADD FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher_Info`(`ID`);
ALTER TABLE `Apply` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `Center_Rescruiment_Form` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `Center_Rescruiment_Form` ADD FOREIGN KEY (`Rescruiment_Form_ID`) REFERENCES `Rescruiment_Form`(`ID`);
ALTER TABLE `Report` ADD FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher_Info`(`ID`);
ALTER TABLE `Report` ADD FOREIGN KEY (`Center_ID`) REFERENCES `Center_Info`(`ID`);
ALTER TABLE `User_InterviewInvite` ADD FOREIGN KEY (`User_Receive`) REFERENCES `User`(`ID`);
ALTER TABLE `User_InterviewInvite` ADD FOREIGN KEY (`User_Send`) REFERENCES `User`(`ID`);


/*Data-Location*/


INSERT INTO `Location` VALUES ('01', 'Thành phố Hà Nội', 'Thành phố Trung ương');
INSERT INTO `Location` VALUES ('02', 'Tỉnh Hà Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('04', 'Tỉnh Cao Bằng', 'Tỉnh');
INSERT INTO `Location` VALUES ('06', 'Tỉnh Bắc Kạn', 'Tỉnh');
INSERT INTO `Location` VALUES ('08', 'Tỉnh Tuyên Quang', 'Tỉnh');
INSERT INTO `Location` VALUES ('10', 'Tỉnh Lào Cai', 'Tỉnh');
INSERT INTO `Location` VALUES ('11', 'Tỉnh Điện Biên', 'Tỉnh');
INSERT INTO `Location` VALUES ('12', 'Tỉnh Lai Châu', 'Tỉnh');
INSERT INTO `Location` VALUES ('14', 'Tỉnh Sơn La', 'Tỉnh');
INSERT INTO `Location` VALUES ('15', 'Tỉnh Yên Bái', 'Tỉnh');
INSERT INTO `Location` VALUES ('17', 'Tỉnh Hoà Bình', 'Tỉnh');
INSERT INTO `Location` VALUES ('19', 'Tỉnh Thái Nguyên', 'Tỉnh');
INSERT INTO `Location` VALUES ('20', 'Tỉnh Lạng Sơn', 'Tỉnh');
INSERT INTO `Location` VALUES ('22', 'Tỉnh Quảng Ninh', 'Tỉnh');
INSERT INTO `Location` VALUES ('24', 'Tỉnh Bắc Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('25', 'Tỉnh Phú Thọ', 'Tỉnh');
INSERT INTO `Location` VALUES ('26', 'Tỉnh Vĩnh Phúc', 'Tỉnh');
INSERT INTO `Location` VALUES ('27', 'Tỉnh Bắc Ninh', 'Tỉnh');
INSERT INTO `Location` VALUES ('30', 'Tỉnh Hải Dương', 'Tỉnh');
INSERT INTO `Location` VALUES ('31', 'Thành phố Hải Phòng', 'Thành phố Trung ương');
INSERT INTO `Location` VALUES ('33', 'Tỉnh Hưng Yên', 'Tỉnh');
INSERT INTO `Location` VALUES ('34', 'Tỉnh Thái Bình', 'Tỉnh');
INSERT INTO `Location` VALUES ('35', 'Tỉnh Hà Nam', 'Tỉnh');
INSERT INTO `Location` VALUES ('36', 'Tỉnh Nam Định', 'Tỉnh');
INSERT INTO `Location` VALUES ('37', 'Tỉnh Ninh Bình', 'Tỉnh');
INSERT INTO `Location` VALUES ('38', 'Tỉnh Thanh Hóa', 'Tỉnh');
INSERT INTO `Location` VALUES ('40', 'Tỉnh Nghệ An', 'Tỉnh');
INSERT INTO `Location` VALUES ('42', 'Tỉnh Hà Tĩnh', 'Tỉnh');
INSERT INTO `Location` VALUES ('44', 'Tỉnh Quảng Bình', 'Tỉnh');
INSERT INTO `Location` VALUES ('45', 'Tỉnh Quảng Trị', 'Tỉnh');
INSERT INTO `Location` VALUES ('46', 'Tỉnh Thừa Thiên Huế', 'Tỉnh');
INSERT INTO `Location` VALUES ('48', 'Thành phố Đà Nẵng', 'Thành phố Trung ương');
INSERT INTO `Location` VALUES ('49', 'Tỉnh Quảng Nam', 'Tỉnh');
INSERT INTO `Location` VALUES ('51', 'Tỉnh Quảng Ngãi', 'Tỉnh');
INSERT INTO `Location` VALUES ('52', 'Tỉnh Bình Định', 'Tỉnh');
INSERT INTO `Location` VALUES ('54', 'Tỉnh Phú Yên', 'Tỉnh');
INSERT INTO `Location` VALUES ('56', 'Tỉnh Khánh Hòa', 'Tỉnh');
INSERT INTO `Location` VALUES ('58', 'Tỉnh Ninh Thuận', 'Tỉnh');
INSERT INTO `Location` VALUES ('60', 'Tỉnh Bình Thuận', 'Tỉnh');
INSERT INTO `Location` VALUES ('62', 'Tỉnh Kon Tum', 'Tỉnh');
INSERT INTO `Location` VALUES ('64', 'Tỉnh Gia Lai', 'Tỉnh');
INSERT INTO `Location` VALUES ('66', 'Tỉnh Đắk Lắk', 'Tỉnh');
INSERT INTO `Location` VALUES ('67', 'Tỉnh Đắk Nông', 'Tỉnh');
INSERT INTO `Location` VALUES ('68', 'Tỉnh Lâm Đồng', 'Tỉnh');
INSERT INTO `Location` VALUES ('70', 'Tỉnh Bình Phước', 'Tỉnh');
INSERT INTO `Location` VALUES ('72', 'Tỉnh Tây Ninh', 'Tỉnh');
INSERT INTO `Location` VALUES ('74', 'Tỉnh Bình Dương', 'Tỉnh');
INSERT INTO `Location` VALUES ('75', 'Tỉnh Đồng Nai', 'Tỉnh');
INSERT INTO `Location` VALUES ('77', 'Tỉnh Bà Rịa - Vũng Tàu', 'Tỉnh');
INSERT INTO `Location` VALUES ('79', 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương');
INSERT INTO `Location` VALUES ('80', 'Tỉnh Long An', 'Tỉnh');
INSERT INTO `Location` VALUES ('82', 'Tỉnh Tiền Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('83', 'Tỉnh Bến Tre', 'Tỉnh');
INSERT INTO `Location` VALUES ('84', 'Tỉnh Trà Vinh', 'Tỉnh');
INSERT INTO `Location` VALUES ('86', 'Tỉnh Vĩnh Long', 'Tỉnh');
INSERT INTO `Location` VALUES ('87', 'Tỉnh Đồng Tháp', 'Tỉnh');
INSERT INTO `Location` VALUES ('89', 'Tỉnh An Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('91', 'Tỉnh Kiên Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('92', 'Thành phố Cần Thơ', 'Thành phố Trung ương');
INSERT INTO `Location` VALUES ('93', 'Tỉnh Hậu Giang', 'Tỉnh');
INSERT INTO `Location` VALUES ('94', 'Tỉnh Sóc Trăng', 'Tỉnh');
INSERT INTO `Location` VALUES ('95', 'Tỉnh Bạc Liêu', 'Tỉnh');
INSERT INTO `Location` VALUES ('96', 'Tỉnh Cà Mau', 'Tỉnh');

/*User data */

insert into `user` values('1','bimbimkhoai','b1mb1mkh041',"bimbimkhoai@qmail.com");
insert into `user` values(null,'biengbieng','kienlienthien',"bisTK99@qmail.com");
insert into `user` values(null,'teoteo','kworkanh99',"teomoney@qmail.com");
insert into `user` values(null,'fatboy99','haihomhinh',"rongxanh@cmail.com");
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('5', 'user1', '11111111', 'user1@cmail.com');
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('6', 'user2', '22222222', 'user2@cmail.com');
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('7', 'user3', '33333333', 'user3@cmail.com');
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('8', 'user4', '44444444', 'user4@cmail.com');
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('9', 'user5', '55555555', 'user5@cmail.com');
INSERT INTO `qualk`.`user` (`ID`, `UserName`, `PassWord`, `Email`) VALUES ('10', 'user6', '66666666', 'user6@cmail.com');

/*role data*/

INSERT INTO `qualk`.`role` (`RoleName`) VALUES ('Admin');
INSERT INTO `qualk`.`role` (`RoleName`) VALUES ('Teacher');
INSERT INTO `qualk`.`role` (`RoleName`) VALUES ('Center');
/*User_role_data*/
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('1', '1');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('2', '1');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('3', '1');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('4', '1');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('5', '2');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('6', '2');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('7', '2');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('8', '3');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('9', '3');
INSERT INTO `qualk`.`user_role` (`User_ID`, `Role_ID`) VALUES ('10', '3');
/*function_data*/
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Manage_Teacher');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Manage_Center');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Manage_User');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Report');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Manage_Applied_List');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Apply');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Interview_Invite');
INSERT INTO `qualk`.`function` (`FunctionName`) VALUES ('Rescruiment_Form');

/*Role_Function data*/
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '1', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '2', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '3', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '4', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '5', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '6', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '7', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('1', '8', '1', '1', '1', '1', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '1', '1', '1', '1', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '2', '1', '0', '0', '0', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '3', '1', '0', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '4', '1', '1', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '5', '1', '0', '0', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '6', '1', '1', '1', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '7', '1', '0', '0', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('2', '8', '1', '0', '0', '0', '1');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '1', '1', '0', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '2', '1', '1', '1', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '3', '1', '0', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '4', '0', '0', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '5', '1', '0', '0', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '6', '0', '0', '0', '0', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '7', '1', '1', '1', '1', '0');
INSERT INTO `qualk`.`role_function` (`Role_ID`, `function_ID`, `View`, `Insert`, `Modify`, `Delete`, `Search`) VALUES ('3', '8', '1', '1', '1', '1', '0');

/*Teacher_info*/
INSERT INTO `qualk`.`teacher_info` (`User_ID`, `Location_ID`, `Name`, `BirthDate`, `Address`, `Degree`, `Experiences`, `Contact`, `Skills`, `Available`, `Salary_Want`) VALUES ('5', '1', 'Nguyễn Độc Nhất', '2001-1-1', 'Tổ 1 quận 1', 'Tốt nghiệp đại học Bôn Ba, Trường đời, bang tổ lái, phái đua xe', '1 năm', '00111111111', 'Có kinh nghiệm làm cơ trưởng, lái máy bay. ', '1', '50000');
INSERT INTO `qualk`.`teacher_info` (`User_ID`, `Location_ID`, `Name`, `BirthDate`, `Address`, `Degree`, `Experiences`, `Contact`, `Skills`, `Available`, `Salary_Want`) VALUES ('10', '1', 'SáuKe Nảto', '1996-6-6', 'Làng Lá (đu đủ)', 'Hokage đệ lục', '6 tháng', '006666666666', 'Rasengannnnnnnn', '1', '30000');
INSERT INTO `qualk`.`teacher_info` (`User_ID`, `Location_ID`, `Name`, `BirthDate`, `Address`, `Degree`, `Experiences`, `Contact`, `Skills`, `Available`, `Salary_Want`) VALUES ('8', '1', 'Lý Tương Tư', '1994-4-4', 'Tổ 4 khu 4', 'JLPT N4', '4 năm', '00444444444', 'Nói tiếng Việt như gió', '1', '20000');
INSERT INTO `qualk`.`teacher_info` (`User_ID`, `Location_ID`, `Name`, `BirthDate`, `Address`, `Degree`, `Experiences`, `Contact`, `Skills`, `Available`, `Salary_Want`) VALUES ('7', '1', 'Phan Tấn Ba', '1993-3-3', 'Tổ 3 khu 3', 'Giáo viên ưu tú', '3 năm', '00333333333', 'Tố chất lãnh đạo, kỹ năng tốt.', '1', '36620');
INSERT INTO `qualk`.`teacher_info` (`User_ID`, `Location_ID`, `Name`, `BirthDate`, `Address`, `Degree`, `Experiences`, `Contact`, `Skills`, `Available`, `Salary_Want`) VALUES ('2', '1', 'Hà Trung Biêng', '1999-9-5', 'Biệt thự liền kề sát bờ đê ', 'Sinh viên ưu tú ', '20 năm', '00198451854', 'Dùng Diana chuyên nghiệp (LOL),Combo Leesin không trượt phát lào.', '1', '999999999');

/*Center_info*/
INSERT INTO `qualk`.`center_info` (`User_ID`, `Name`, `Specialize`, `Address`, `Contact`, `Available`, `Location_ID`) VALUES ('2', 'Hi Center', 'English', 'No2 Phoco', '00222222222, Haixento@cmail.com', '1', '1');
INSERT INTO `qualk`.`center_info` (`User_ID`, `Name`, `Specialize`, `Address`, `Contact`, `Available`, `Location_ID`) VALUES ('5', 'Numb Corp', 'English', 'Hoalu Street', '00555555555', '1', '1');
INSERT INTO `qualk`.`center_info` (`User_ID`, `Name`, `Specialize`, `Address`, `Contact`, `Available`, `Location_ID`) VALUES ('3', 'MoneyGroup', 'English', 'Kimma District', 'Teomoney@cmail.com', '1', '1');

/*Rescruiment form data*/
INSERT INTO `qualk`.`rescruiment_form` (`Location_ID`, `Title`, `Salary`, `DateStart`, `Content`, `Position`, `Requirement`, `Contact`, `DateEnd`) VALUES ('1', 'Tuyển gia sư nữ', '60000', '2019-9-12', 'Tuyển gia sư nữ, ngoại hình tốt, chịu khó', 'Gia sư', 'Cấp 3 trở lên', '00222222222', '2020-8-12');
INSERT INTO `qualk`.`rescruiment_form` (`Location_ID`, `Title`, `Salary`, `DateStart`, `Content`, `Position`, `Requirement`, `Contact`, `DateEnd`) VALUES ('1', 'Cần giáo viên dạy trực tuyến', '50000', '2019-9-12', 'Cần giáo viên dạy trực tuyến', 'Giáo viên', 'Đại học', '00555555555', '2020-8-12');
INSERT INTO `qualk`.`rescruiment_form` (`Location_ID`, `Title`, `Salary`, `DateStart`, `Content`, `Position`, `Requirement`, `Contact`, `DateEnd`) VALUES ('1', 'Tuyển trợ giảng', '40000', '2019-9-12', 'Tuyển trợ giảng', 'Trợ giảng', 'Biết giao tiếp', 'teomoney@cmail.com', '2020-8-12');
INSERT INTO `qualk`.`rescruiment_form` (`Location_ID`, `Title`, `Salary`, `DateStart`, `Content`, `Position`, `Requirement`, `Contact`, `DateEnd`) VALUES ('1', 'Thực tập đánh bom cảm tử', '80000000', '2019-9-12', 'Nhận lương cuối ngày, tiền mặt, không lừa đảo.', 'Thực tập', 'Không yêu cầu', 'teomonney@cmail.com', '2020-8-12');
INSERT INTO `qualk`.`rescruiment_form` (`Location_ID`, `Title`, `Salary`, `DateStart`, `Content`, `Position`, `Requirement`, `Contact`, `DateEnd`) VALUES ('1', 'Tuyển 2 Giáo viên tiếng Anh người bản xứ', '500000', '2019-9-12', 'Tuyển 2 Giáo viên tiếng Anh bản xứ, biết nói tiếng Việt', 'Giáo viên', 'Không', '00555555555', '2020-8-12');

/*center-rescruimentform data*/
INSERT INTO `qualk`.`center_rescruiment_form` (`Center_ID`, `Rescruiment_Form_ID`) VALUES ('1', '1');
INSERT INTO `qualk`.`center_rescruiment_form` (`Center_ID`, `Rescruiment_Form_ID`) VALUES ('2', '2');
INSERT INTO `qualk`.`center_rescruiment_form` (`Center_ID`, `Rescruiment_Form_ID`) VALUES ('3', '3');
INSERT INTO `qualk`.`center_rescruiment_form` (`Center_ID`, `Rescruiment_Form_ID`) VALUES ('3', '4');
INSERT INTO `qualk`.`center_rescruiment_form` (`Center_ID`, `Rescruiment_Form_ID`) VALUES ('2', '5');

/*Apply data*/
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('1', '2', '2019-12-12', 'Nhận');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('2', '3', '2019-12-12', 'Trượt');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('3', '1', '2019-12-12', 'Chưa xác định');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('4', '2', '2019-12-12', 'Chưa xác định');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('1', '1', '2019-12-12', 'Chưa xác định');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('2', '2', '2019-12-12', 'Chưa xác định');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('3', '3', '2019-12-12', 'Nhận');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('4', '1', '2019-12-12', 'Chưa xác định');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('5', '1', '2019-12-12 00:00:00', 'Nhận');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('5', '2', '2019-12-12 00:00:00', 'Nhận');
INSERT INTO `qualk`.`apply` (`Teacher_ID`, `Center_ID`, `Datetime`, `Status`) VALUES ('5', '3', '2019-12-12 00:00:00', 'Nhận');
/*Interview Invite data*/
INSERT INTO `qualk`.`interviewinvite` (`Datetime`, `Title`, `Text`) VALUES ('2019-12-12', 'Mừng bạn được phỏng vấn', 'Hẹn tại quán cây Đa gần ngã ba nhà bà Cả');
INSERT INTO `qualk`.`interviewinvite` (`Datetime`, `Title`, `Text`) VALUES ('2019-12-3', 'Lịch phỏng vấn', 'Tại công ty, 8 giờ ngày thứ 2');
INSERT INTO `qualk`.`interviewinvite` (`Datetime`, `Title`, `Text`) VALUES ('2019-12-4', 'Chúc bạn may mắn lần sau', 'Chỗ mình đủ người rồi, zui zẻ hong quạo nha :\">');

/*User và interviewInvite data*/
INSERT INTO `qualk`.`user_interviewinvite` (`User_Receive`, `User_Send`) VALUES ('10', '6');
INSERT INTO `qualk`.`user_interviewinvite` (`User_Receive`, `User_Send`) VALUES ('1', '3');
INSERT INTO `qualk`.`user_interviewinvite` (`User_Receive`, `User_Send`) VALUES ('2', '3');
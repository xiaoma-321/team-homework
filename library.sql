/*
Navicat SQLite Data Transfer

Source Server         : MyLocalBook
Source Server Version : 30706
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30706
File Encoding         : 65001

Date: 2025-12-24 14:41:17
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for "main"."admin"
-- ----------------------------
DROP TABLE "main"."admin";
CREATE TABLE admin (
	admin_id VARCHAR(6) NOT NULL, 
	admin_name VARCHAR(32), 
	password VARCHAR(24), 
	"right" VARCHAR(32), 
	PRIMARY KEY (admin_id)
);

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO "main"."admin" VALUES ('admin', '超级管理员', 123456, 1);

-- ----------------------------
-- Table structure for "main"."book"
-- ----------------------------
DROP TABLE "main"."book";
CREATE TABLE book (
	isbn VARCHAR(13) NOT NULL, 
	book_name VARCHAR(64), 
	author VARCHAR(64), 
	press VARCHAR(32), 
	class_name VARCHAR(64), 
	PRIMARY KEY (isbn)
);

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO "main"."book" VALUES ('978704015109X', 'ERP原理与应用实训', '汪清明', '高等教育出版社', '管理社会科学');
INSERT INTO "main"."book" VALUES (9787040273243, '管理信息系统', '黄梯云', '高等教育出版社', '管理社会科学');
INSERT INTO "main"."book" VALUES (9787115335500, '深入浅出node.js', '朴灵', '人民邮电出版社', '自动化技术、计算机技术');
INSERT INTO "main"."book" VALUES (9787121204869, '移动设计', '傅小贞', '电子工业出版社', '自动化技术、计算机技术');
INSERT INTO "main"."book" VALUES (9787302292609, ' 用友ERP生产管理系统实验教程:U8.72版', '张莉莉', '清华大学出版社', '管理社会科学');
INSERT INTO "main"."book" VALUES ('978710800982x', '万历十五年', '[美]黄仁宇', '生活.读书.新知三联书店', '中国史');
INSERT INTO "main"."book" VALUES (9787115488763, 'Python深度学习', '弗朗索瓦.肖莱', '人民邮电出版社', '自动化技术、计算机技术');
INSERT INTO "main"."book" VALUES (9787226044094, '音乐词典', '高天康', '甘肃人民出版社', '音乐');
INSERT INTO "main"."book" VALUES (9787115275790, 'JavaScript 高级程序设计-第3版', '[美] Nicholas C. Zakas 著', '李松峰', '曹力 译');
INSERT INTO "main"."book" VALUES (9787302423287, '机器学习', '周志华', '清华大学出版社', '自动化技术、计算机技术');
INSERT INTO "main"."book" VALUES (9787543862326, '中国知青终结', '邓贤', '湖南人民出版社', '中国文学');
INSERT INTO "main"."book" VALUES (9787810823620, 'ERP原理与实践', '苟娟琼,常丹', '北京交通大学出版社', '管理社会科学');
INSERT INTO "main"."book" VALUES (9787115373991, 'Flask Web开发: 基于Python的Web应用开发实战', '(美) 格林布戈著;安道译', '人民邮电出版社', '计算机技术');

-- ----------------------------
-- Table structure for "main"."inventory"
-- ----------------------------
DROP TABLE "main"."inventory";
CREATE TABLE inventory (
	barcode VARCHAR(6) NOT NULL, 
	isbn VARCHAR(13), 
	storage_date VARCHAR(13), 
	location VARCHAR(32), 
	withdraw BOOLEAN, 
	status BOOLEAN, 
	admin VARCHAR(6), 
	PRIMARY KEY (barcode), 
	FOREIGN KEY(isbn) REFERENCES book (isbn), 
	CHECK (withdraw IN (0, 1)), 
	CHECK (status IN (0, 1)), 
	FOREIGN KEY(admin) REFERENCES admin (admin_id)
);

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO "main"."inventory" VALUES (102341, 9787302423287, 1514736000000, '1楼,02书架,3层,4排', 0, 0, 201801);
INSERT INTO "main"."inventory" VALUES (102342, 9787302423287, 1514736000000, '1楼,02书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (102343, 9787302423287, 1514736000000, '1楼,02书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (102344, 9787302423287, 1514736000000, '1楼,02书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (211411, 9787302292609, 1514736000000, '2楼,11书架,4层,1排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (211412, 9787302292609, 1514736000000, '2楼,11书架,4层,1排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (211413, 9787302292609, 1514736000000, '2楼,11书架,4层,1排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (201231, '978704015109X', 1515168000000, '2楼,01书架,2层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (201232, '978704015109X', 1515168000000, '2楼,01书架,2层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (201233, '978704015109X', 1515168000000, '2楼,01书架,2层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (202331, 9787040273243, 1515772800000, '2楼,02书架,3层,3排', 0, 0, 201802);
INSERT INTO "main"."inventory" VALUES (202332, 9787040273243, 1515772800000, '2楼,02书架,3层,3排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (104341, 9787115335500, 1514995200000, '1楼,04书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (104342, 9787115335500, 1514995200000, '1楼,04书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (104343, 9787115335500, 1514995200000, '1楼,04书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (104344, 9787121204869, 1546358400000, '1楼,04书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (104345, 9787121204869, 1514822400000, '1楼,04书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (310321, '978710800982x', 1517587200000, '3楼,10书架,3层,2排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (310322, '978710800982x', 1517587200000, '3楼,10书架,3层,2排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (310323, '978710800982x', 1517587200000, '3楼,10书架,3层,2排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (309331, 9787115488763, 1515081600000, '3楼,09书架,3层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (309332, 9787115488763, 1515081600000, '3楼,09书架,3层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (309333, 9787115488763, 1515081600000, '3楼,09书架,3层,3排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (401281, 9787226044094, 1515772800000, '4楼,01书架,2层,8排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (401282, 9787226044094, 1515772800000, '4楼,01书架,2层,8排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (308371, 9787115275790, 1516377600000, '3楼,08书架,3层,7排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (308372, 9787115275790, 1516377600000, '3楼,08书架,3层,7排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (308373, 9787115275790, 1516377600000, '3楼,08书架,3层,7排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (411361, 9787543862326, 1516982400000, '4楼,11书架,3层,6排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (411362, 9787543862326, 1516982400000, '4楼,11书架,3层,6排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (203771, 9787810823620, 1517328000000, '2楼,03书架,7层,7排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (203772, 9787810823620, 1517328000000, '2楼,03书架,7层,7排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (203773, 9787810823620, 1517328000000, '2楼,03书架,7层,7排', 0, 1, 201802);
INSERT INTO "main"."inventory" VALUES (102345, 9787302423287, 1547130451000, '1楼,02书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (102346, 9787115373991, 1547222400000, '1楼,02书架,3层,4排', 0, 0, 201801);
INSERT INTO "main"."inventory" VALUES (102347, 9787115373991, 1547222400000, '1楼,02书架,3层,4排', 0, 0, 201801);
INSERT INTO "main"."inventory" VALUES (102348, 9787115373991, 1547222400000, '1楼,02书架,3层,4排', 0, 1, 201801);
INSERT INTO "main"."inventory" VALUES (120346, 9787115488763, 1766505600000, '一楼，02书架，3层', 0, 1, 'admin');

-- ----------------------------
-- Table structure for "main"."readbook"
-- ----------------------------
DROP TABLE "main"."readbook";
CREATE TABLE readbook (
	id INTEGER NOT NULL, 
	barcode VARCHAR(6), 
	card_id VARCHAR(8), 
	start_date VARCHAR(13), 
	borrow_admin VARCHAR(6), 
	end_date VARCHAR(13), 
	return_admin VARCHAR(6), 
	due_date VARCHAR(13), 
	PRIMARY KEY (id), 
	FOREIGN KEY(barcode) REFERENCES inventory (barcode), 
	FOREIGN KEY(card_id) REFERENCES student (card_id), 
	FOREIGN KEY(borrow_admin) REFERENCES admin (admin_id), 
	FOREIGN KEY(return_admin) REFERENCES admin (admin_id)
);

-- ----------------------------
-- Records of readbook
-- ----------------------------
INSERT INTO "main"."readbook" VALUES (1, 102341, 202378030316, 1696900000000, 201801, 1699100000000, 201801, 1702000000000);
INSERT INTO "main"."readbook" VALUES (2, 102342, 202378030317, 1710500000000, 201801, 1712700000000, 201801, 1715600000000);
INSERT INTO "main"."readbook" VALUES (3, 310321, 202378030316, 1696900000000, 201801, 1699100000000, 201801, 1702000000000);
INSERT INTO "main"."readbook" VALUES (4, 203773, 202378030316, 1696900000000, 201801, 1699100000000, 201802, 1702000000000);
INSERT INTO "main"."readbook" VALUES (5, 310322, 202378030317, 1710500000000, 201801, 1712700000000, 201802, 1715600000000);
INSERT INTO "main"."readbook" VALUES (7, 309333, 202378030316, 1696900000000, 201801, 1699100000000, 201801, 1702000000000);
INSERT INTO "main"."readbook" VALUES (8, 102341, 202378030316, 1696900000000, 201801, 1699100000000, null, 1702000000000);
INSERT INTO "main"."readbook" VALUES (9, 211411, 202378030321, 1716200000000, 201801, 1718400000000, null, 1721300000000);
INSERT INTO "main"."readbook" VALUES (10, 202331, 202378030321, 1716200000000, 201801, 1718400000000, null, 1721300000000);
INSERT INTO "main"."readbook" VALUES (11, 102347, 202378030316, 1696900000000, 201801, 1699100000000, null, 1702000000000);
INSERT INTO "main"."readbook" VALUES (12, 309331, 202378030316, 1766505600000, 'admin', 1766505600000, 'admin', 1769961600000);
INSERT INTO "main"."readbook" VALUES (13, 309331, 202378030316, 1766505600000, 'admin', 1766505600000, 'admin', 1769961600000);

-- ----------------------------
-- Table structure for "main"."student"
-- ----------------------------
DROP TABLE "main"."student";
CREATE TABLE student (
	card_id VARCHAR(8) NOT NULL, 
	student_id VARCHAR(9), 
	student_name VARCHAR(32), 
	sex VARCHAR(2), 
	telephone VARCHAR(11), 
	enroll_date VARCHAR(13), 
	valid_date VARCHAR(13), 
	loss BOOLEAN, 
	debt BOOLEAN, 
	PRIMARY KEY (card_id), 
	CHECK (loss IN (0, 1)), 
	CHECK (debt IN (0, 1))
);

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO "main"."student" VALUES (202378030316, 161001222, '马程昊', '男', 18921902722, 1693526400000, 1814313600000, 0, 0);
INSERT INTO "main"."student" VALUES (202378030317, 161001228, '牛博文', '男', 18367890001, 1693526400000, 1814313600000, 0, 0);
INSERT INTO "main"."student" VALUES (202378030321, 161001227, '孙铭健', '男', 18890209433, 1693526400000, 1814313600000, 0, 0);

-- ----------------------------
-- Indexes structure for table readbook
-- ----------------------------
CREATE INDEX "main"."ix_readbook_barcode"
ON "readbook" ("barcode" ASC);
CREATE INDEX "main"."ix_readbook_card_id"
ON "readbook" ("card_id" ASC);

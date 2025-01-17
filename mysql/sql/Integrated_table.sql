/* CREATE DATABASE `CourseSelectionSystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER DBAdmin@'%' identified by '123';
grant all PRIVILEGES on *.* to DBAdmin@'%' WITH GRANT OPTION;
flush privileges;

use CourseSelectionSystem; */

CREATE TABLE `Department` (
    `department_id`     INT PRIMARY KEY,
    `department_name`   VARCHAR (500)
);

INSERT INTO `Department` VALUES (1, '資訊工程學系');
INSERT INTO `Department` VALUES (2, '電機工程學系');
INSERT INTO `Department` VALUES (3, '電子工程學系');
INSERT INTO `Department` VALUES (4, '自動控制工程學系');
INSERT INTO `Department` VALUES (5, '資訊電機學院學士班');
INSERT INTO `Department` VALUES (6, '通訊工程學系');
INSERT INTO `Department` VALUES (7, '光電科學與工程學系');
INSERT INTO `Department` VALUES (8, '通識中心');
INSERT INTO `Department` VALUES (9, '應用數學學系');
INSERT INTO `Department` VALUES (10, '統計學系');

CREATE TABLE `Student` (
    /*name              VARCHAR(500) we don't need it right now */            
    `student_id`        VARCHAR (10) PRIMARY KEY,
    `student_password`  VARCHAR (500) NOT NULL,
    `department_id`     INT NOT NULL,
    `credits`           INT DEFAULT 0,
    `grade`             INT NOT NULL
);

INSERT INTO `Student` VALUES ('D1234567', '123', 1, 0, 1);
INSERT INTO `Student` VALUES ('E2345678', '234', 1, 0, 2);
INSERT INTO `Student` VALUES ('F3456789', '345', 2, 0, 3);
INSERT INTO `Student` VALUES ('G4567890', '456', 2, 0, 4);
INSERT INTO `Student` VALUES ('H5678901', '567', 3, 0, 1);

CREATE TABLE `Course` (
    `course_id`         VARCHAR (10) PRIMARY KEY,
    `course_name`       VARCHAR (500) NOT NULL,
    `department_id`     INT NOT NULL,
    `required`          VARCHAR (500) NOT NULL,
    `credit`            INT NOT NULL, 
    `description`       VARCHAR (500),
    `prerequisite_id`   VARCHAR (10),
    `grade`             INT NOT NULL,
    `maxNumOfSelect`    INT NOT NULL,
    `curNumOfSelect`    INT NOT NULL DEFAULT 0
);

INSERT INTO `Course` VALUES ('001', '程式設計', 1, '必修', 3, '一門呱呱課程呱呱', 'null', 1, 5, 0);
INSERT INTO `Course` VALUES ('002', '資料結構', 1, '必修', 3, '一門很重要的課程呱', 'null', 1, 5, 0);
INSERT INTO `Course` VALUES ('003', '演算法', 1, '必修', 3, '一門涵蓋廣泛的呱呱', '001', 2, 5, 0);
INSERT INTO `Course` VALUES ('004', '計算機組織與結構', 1, '必修', 3, '一門呱呱與實踐相結合的課程', '001', 2, 5, 0);
INSERT INTO `Course` VALUES ('005', '離散數學', 1, '必修', 3, '一呱基礎性的課程', 'null', 1, 5, 0);

INSERT INTO `Course` VALUES ('006', '離散數學', 2, '必修', 3, '一呱基礎性的課程', 'null', 1, 5, 0);
INSERT INTO `Course` VALUES ('007', '數學離散', 2, '必修', 3, '一呱基礎性的課程', 'null', 1, 5, 0);
INSERT INTO `Course` VALUES ('008', '離散數學離散', 2, '必修', 3, '一呱基礎性的課程', 'null', 2, 5, 0);
INSERT INTO `Course` VALUES ('009', '數學離散數學', 2, '必修', 3, '一呱基礎性的課程', 'null', 2, 5, 0);
INSERT INTO `Course` VALUES ('010', '呱呱鴨呱呱', 2, '必修', 3, '一呱基礎性的課程', 'null', 3, 5, 0);


/* Record the courses required relations */
CREATE TABLE `PrerequisiteCourses` (
    `prerequisite_id`       VARCHAR (10),
    `course_id`             VARCHAR (10),
    PRIMARY KEY (`prerequisite_id`, `course_id`)
);

INSERT INTO `PrerequisiteCourses` VALUES ('002', '003');
INSERT INTO `PrerequisiteCourses` VALUES ('002', '004');
INSERT INTO `PrerequisiteCourses` VALUES ('005', '002');

/* Record the courses start and end time */
CREATE TABLE `CourseTime` (
    `course_id`         VARCHAR (10),
    `week_day`          VARCHAR (20),
    `time_index`        INT, /* 1 ~ 12 */
    PRIMARY KEY (`course_id`, `week_day`, `time_index`)
);

INSERT INTO `CourseTime` VALUES ('001', 'Monday', '1');
INSERT INTO `CourseTime` VALUES ('001', 'Wednesday', '2');
INSERT INTO `CourseTime` VALUES ('002', 'Tuesday', '3');
INSERT INTO `CourseTime` VALUES ('003', 'Thursday', '4');
INSERT INTO `CourseTime` VALUES ('004', 'Friday', '5');
INSERT INTO `CourseTime` VALUES ('005', 'Monday', '6');


/* Record the courses students have 'selected' */
CREATE TABLE `SelectedCouse` (
    `course_id`         VARCHAR (10),
    `student_id`        VARCHAR (10),
    PRIMARY KEY (`course_id`, `student_id`)
);

INSERT INTO `SelectedCouse` VALUES ('001', 'D1234567');
INSERT INTO `SelectedCouse` VALUES ('002', 'E2345678');
INSERT INTO `SelectedCouse` VALUES ('003', 'F3456789');
INSERT INTO `SelectedCouse` VALUES ('004', 'G4567890');
INSERT INTO `SelectedCouse` VALUES ('005', 'H5678901');

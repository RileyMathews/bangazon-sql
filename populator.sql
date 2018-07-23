-- CREATE TABLE `Affiliation` (
--     `Affiliation_Id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
--     `Name` TEXT NOT NULL
-- );

-- INSERT INTO Affiliation VALUES (null, "Justice League");
-- INSERT INTO Affiliation VALUES (null, "X-Men");


-- CREATE TABLE `Superhero` (
--     `Superhero_Id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
--     `Name`    TEXT NOT NULL,
--     `Gender`    TEXT NOT NULL,
--     `Secret_Id` TEXT NOT NULL,
--     `Affiliation_Id` TEXT,
--     FOREIGN KEY(`Affiliation_id`) REFERENCES `Affiliation` (`Affiliation_Id`)
-- );

DELETE FROM employee_training;
DELETE FROM training;
DELETE FROM computer;
DELETE FROM employee;
DELETE FROM department;

DROP TABLE IF EXISTS employee_training;
DROP TABLE IF EXISTS training;
DROP TABLE IF EXISTS computer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;


CREATE TABLE `department` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `name` TEXT NOT NULL,
    `budget` INTEGER NOT NULL
);

INSERT INTO department VALUES (null, "Technology", 20000);
INSERT INTO department VALUES (null, "Management", 30000);


CREATE TABLE `employee` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `job_title` TEXT NOT NULL,
    `supervisor` BOOLEAN,
    `department_id` TEXT,
    FOREIGN KEY(`department_id`) REFERENCES `department` (`id`)
);

INSERT INTO employee VALUES(null, "Joe", "Shepard", "CEO", 1, 2);
INSERT INTO employee VALUES(null, "Kimmy", "Bird", "Manager", 0, 2);
INSERT INTO employee VALUES(null, "Riley", "Mathews", "Junior Devoloper", 0, 1);
INSERT INTO employee VALUES(null, "Ronnie", "Young", "Developer", 1, 1);

CREATE TABLE `computer` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `employee_id` TEXT,
    `purchase_date` TEXT NOT NULL,
    `decomission_date` TEXT,
    FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
);

INSERT INTO computer VALUES(null, 1, "2018-07-21", null);
INSERT INTO computer VALUES(null, 2, "2018-07-21", null);
INSERT INTO computer VALUES(null, 3, "2018-07-21", null);
INSERT INTO computer VALUES(null, 4, "2018-07-21", null);

CREATE TABLE `training` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `title` TEXT NOT NULL,
    `start_date` TEXT NOT NULL,
    `end_date` TEXT NOT NULL,
    `maximum_attendees` INTEGER NOT NULL
);

INSERT INTO training VALUES(null, "intro to sql", "2018-06-21", "2018-06-23", 6);
INSERT INTO training VALUES(null, "intro to python", "2018-06-24", "2018-06-25", 6);
INSERT INTO training VALUES(null, "intro to django", "2018-08-1", "2018-08-3", 6);

CREATE TABLE `employee_training`(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `employee_id` TEXT,
    `training_id` TEXT,
    FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
    FOREIGN KEY (`training_id`) REFERENCES `training` (`id`)
);

INSERT INTO employee_training VALUES(null, 3, 1);
INSERT INTO employee_training VALUES(null, 3, 2);
INSERT INTO employee_training VALUES(null, 4, 2);
INSERT INTO employee_training VALUES(null, 4, 3);

-- customer data

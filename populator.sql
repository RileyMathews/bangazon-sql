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

DROP TABLE IF EXISTS user_order;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS user_payment;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `created_date` TEXT NOT NULL,
    `last_activity_date` TEXT NOT NULL
);

INSERT INTO user VALUES (null, "Nathan", "Taylor", "2018-07-21", "2018-07-21");
INSERT INTO user VALUES (null, "Jake", "Turner", "2018-07-21", "2018-07-22");

CREATE TABLE `category` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `type` TEXT NOT NULL
);

INSERT INTO category VALUES (null, "music");
INSERT INTO category VALUES (null, "tech");
INSERT INTO category VALUES (null, "games");

CREATE TABLE `payment` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `name` TEXT NOT NULL,
    `type` TEXT NOT NULL,
    `number` INTEGER NOT NULL
);

INSERT INTO payment VALUES (null, "checking", "bank", 12515);
INSERT INTO payment VALUES (null, "debit", "card", 1241248);
INSERT INTO payment VALUES (null, "credit", "card", 12312);

CREATE TABLE `user_payment` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `user_id` TEXT,
    `payment_id` TEXT,
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`)
);

INSERT INTO user_payment VALUES (null, 1, 1);
INSERT INTO user_payment VALUES (null, 1, 2);
INSERT INTO user_payment VALUES (null, 2, 3);

CREATE TABLE `product` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `category_id` TEXT,
    `seller_id` TEXT,
    `title` TEXT NOT NULL,
    `price` INTEGER NOT NULL,
    `description` TEXT NOT NULL,
    FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
    FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
);

INSERT INTO product VALUES (null, 1, 1, "Guitar", 300, "fender strat");
INSERT INTO product VALUES (null, 3, 2, "Xbox", 300, "game console");
INSERT INTO product VALUES (null, 2, 2, "Computer", 300, "pc");

CREATE TABLE `user_order` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `customer_id` TEXT,
    `product_id` TEXT,
    `payment_id` TEXT,
    FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
    FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
    FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`)
);

INSERT INTO user_order VALUES (null, 2, 1, 3);
INSERT INTO user_order VALUES (null, 1, 3, null);
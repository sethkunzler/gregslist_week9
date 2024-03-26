-- Active: 1711142519797@@35.87.147.206@3306@forgiving_monk_a379d6_db
CREATE TABLE accounts(
  id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  name varchar(255) COMMENT 'User Name',
  email varchar(255) COMMENT 'User Email',
  picture varchar(255) COMMENT 'User Picture'
) default charset utf8mb4 COMMENT '';

CREATE TABLE houses(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  sqft INT NOT NULL COMMENT 'Square Footage',
  bedrooms INT NOT NULL,
  bathrooms INT NOT NULL,
  imgUrl VARCHAR(255) NOT NULL COMMENT 'Image URL',
  description VARCHAR(255) NOT NULL, 
  price INT NOT NULL, 
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  creatorId VARCHAR(255) NOT NULL,
  FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE
) default charset utf8mb4 COMMENT '';

-- NOTE dummy data 

-- DROP TABLE houses;

-- SELECT id, name from accounts;

-- INSERT INTO houses 
-- (sqft, bedrooms, bathrooms, imgUrl, description, price, creatorID)
-- VALUES(2200, 4, 2, 'https://images.unsplash.com/photo-1605146769289-440113cc3d00?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'is an amazing, cute house in a quiet neighborhood. space for', 67000, '65e9fb59e1423c341b6d36f6');
-- INSERT INTO houses 
-- (sqft, bedrooms, bathrooms, imgUrl, description, price, creatorID)
-- VALUES(3650, 4, 3, 'https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'beautiful home in the suburbs, comfortable and affordable', 82000, '65e9fb59e1423c341b6d36f6');

SELECT * FROM houses;
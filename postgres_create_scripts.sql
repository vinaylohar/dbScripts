CREATE TABLE IF NOT EXISTS UserDetails(
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  username VARCHAR(20) NOT NULL,
  userpassword VARCHAR(45) NOT NULL,
  firstname VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NULL,
  phonenumber VARCHAR(10) NOT NULL,
  emailaddress VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products(
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  name VARCHAR(20) NOT NULL,
  description VARCHAR(255) NOT NULL,
  price INTEGER NOT NULL,
  discount INTEGER NULL,
  unitsinstock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS UserType (
   id BIGSERIAL PRIMARY KEY     NOT NULL,
  name VARCHAR(20) NOT NULL,
  description VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ProductCategory (
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  name VARCHAR(20) NOT NULL,
  description VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS reviews (
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  Products_id INTEGER references products(id),
  User_id INTEGER references UserDetails(id),
  title VARCHAR(20) NOT NULL,
  description VARCHAR(255) NOT NULL,
  rating INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Pictures (
   id BIGSERIAL PRIMARY KEY     NOT NULL,
  Products_id INTEGER references products(id),
  picture text NOT NULL
);

CREATE TABLE IF NOT EXISTS UserTypeMapping (
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  UserType_id INTEGER references UserType(id),
  UserDetails_id INTEGER references UserDetails(id)
);

CREATE TABLE IF NOT EXISTS UserAddress (
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  UserDetails_id INTEGER references UserDetails(id),
  address1 VARCHAR(45) NOT NULL,
  address2 VARCHAR(45) NULL,
  city VARCHAR(20) NULL,
  state VARCHAR(20) NULL,
  phone INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ProductCategoryMapping (
  id BIGSERIAL PRIMARY KEY     NOT NULL,
  ProductCategory_id INTEGER references ProductCategory(id),
  Products_id INTEGER references products(id)
);

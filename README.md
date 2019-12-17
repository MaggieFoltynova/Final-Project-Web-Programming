CREATE TABLE product (
    productNum INT NOT NULL AUTO_INCREMENT,
    productName VARCHAR(20) NOT NULL,
    productPrice INT,
    sellerID VARCHAR(20) NOT NULL,
    sellerName VARCHAR(20) NOT NULL,
    sellerPhone VARCHAR(20) NOT NULL,
    productPlace VARCHAR(50) NOT NULL,
    productClass VARCHAR(20) NOT NULL,
    productStatus VARCHAR(20) NOT NULL,
    productImg blob,
    wishCount INT,
    firstBuyer VARCHAR(20),
    firstPrice INT,
    secondBuyer VARCHAR(20),
    secondPrice INT,
    thirdBuyer VARCHAR(20),
    thirdPrice INT,
    PRIMARY KEY (productNum)
);

CREATE TABLE user(
    userID VARCHAR(20) NOT NULL,
    userPassword VARCHAR(20) NOT NULL,
    userName VARCHAR(20) NOT NULL,
    userClass VARCHAR(10) NOT NULL,
    PRIMARY KEY (userID)
);


You have to login before enter "admin*", "buyer*", "seller*" page

insert into user value ('root', 'root', 'Master', 'Administer');
insert into user value ('buyer', '1234', 'Mr_buyer', 'Buyer');
insert into user value ('seller', '1234', 'Ms_seller', 'Seller');

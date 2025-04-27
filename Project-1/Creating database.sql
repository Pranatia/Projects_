CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Gender VARCHAR(10),
    CityTier INT,
    MaritalStatus VARCHAR(20),
    NumberOfAddress INT
);
CREATE TABLE subscriptions (	
    CustomerID INT PRIMARY KEY,
    Tenure FLOAT,
    PreferredLoginDevice VARCHAR(50),
    PreferredPaymentMode VARCHAR(50),
    NumberOfDeviceRegistered INT,
    PreferedOrderCat VARCHAR(100),
    SatisfactionScore INT,
    Churn BOOLEAN
);

CREATE TABLE orders (
    CustomerID INT PRIMARY KEY,
    OrderCount INT,
    OrderAmountHikeFromlastYear FLOAT,
    CouponUsed BOOLEAN,
    DaySinceLastOrder FLOAT,
    CashbackAmount FLOAT
);

CREATE TABLE support_tickets (
    CustomerID INT PRIMARY KEY,
    Complain BOOLEAN,
    WarehouseToHome FLOAT
);
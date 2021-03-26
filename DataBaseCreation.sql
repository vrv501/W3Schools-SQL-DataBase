CREATE TABLE categories (
  categoryid INTEGER NOT NULL,
  categoryname varchar(255) DEFAULT NULL,
  description varchar(255) DEFAULT NULL, 
  PRIMARY KEY(categoryid)
);

CREATE TABLE customers (
  customerid INTEGER NOT NULL,
  customername varchar(255) DEFAULT NULL,
  contactname varchar(255) DEFAULT NULL, 
  address varchar(255) DEFAULT NULL,     
  city varchar(255) DEFAULT NULL,        
  postalcode varchar(255) DEFAULT NULL,  
  country varchar(255) DEFAULT NULL,     
  PRIMARY KEY(customerid)
);

CREATE TABLE employees (
  employeeid INTEGER NOT NULL,
  lastname varchar(255) DEFAULT NULL,    
  firstname varchar(255) DEFAULT NULL,   
  birthdate date DEFAULT NULL,
  photo varchar(255) DEFAULT NULL,       
  notes text,
  PRIMARY KEY(employeeid)
);

CREATE TABLE shippers (
  shipperid INTEGER NOT NULL,
  shippername varchar(255) DEFAULT NULL, 
  phone varchar(255) DEFAULT NULL,
  PRIMARY KEY(shipperid)
);

CREATE TABLE suppliers (
  supplierid INTEGER NOT NULL,
  suppliername varchar(255) DEFAULT NULL,
  contactname varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  postalcode varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  PRIMARY KEY(supplierid)
);

CREATE TABLE orders (
  orderid INTEGER NOT NULL,
  customerid INTEGER DEFAULT NULL,
  employeeid INTEGER DEFAULT NULL,
  orderdate date DEFAULT NULL,
  shipperid INTEGER DEFAULT NULL,
  PRIMARY KEY(orderid),
  FOREIGN KEY (customerid) REFERENCES customers(customerid),
  FOREIGN KEY (employeeid) REFERENCES employees(employeeid),
  FOREIGN KEY (shipperid) REFERENCES shippers(shipperid)
);

CREATE TABLE products (
  productid INTEGER NOT NULL,
  productname varchar(255) DEFAULT NULL,
  supplierid INTEGER DEFAULT NULL,
  categoryid INTEGER DEFAULT NULL,
  unit varchar(255) DEFAULT NULL,
  price decimal NOT NULL,
  PRIMARY KEY(productid),
  FOREIGN KEY (categoryid) REFERENCES categories(categoryid),
  FOREIGN KEY (supplierid) REFERENCES suppliers(supplierid)
);

CREATE TABLE order_details (
  orderdetailid INTEGER NOT NULL,
  orderid INTEGER DEFAULT NULL,
  productid INTEGER DEFAULT NULL,
  quantity INTEGER DEFAULT NULL,
  PRIMARY KEY(orderdetailid),
  FOREIGN KEY (orderid) REFERENCES orders(orderid),
  FOREIGN KEY (productid) REFERENCES products(productid)
);

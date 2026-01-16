CREATE TABLE PRODUCTOS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_code VARCHAR(50) UNIQUE,
  description VARCHAR(255),
  price DECIMAL(10,2)
);

CREATE TABLE PRODUCTOS_NOMBRES (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  product_name VARCHAR(100),
  FOREIGN KEY (product_id) REFERENCES PRODUCTOS(id)
);

CREATE TABLE PROVEEDORES (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(100),
  phone VARCHAR(20)
);

CREATE TABLE PRODUCTOS_PROVEEDORES (
  product_id INT,
  supplier_id INT,
  PRIMARY KEY (product_id, supplier_id),
  FOREIGN KEY (product_id) REFERENCES PRODUCTOS(id),
  FOREIGN KEY (supplier_id) REFERENCES PROVEEDORES(id)
);

CREATE TABLE ALMACENES (
  id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_name VARCHAR(100)
);

CREATE TABLE INVENTARIO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  warehouse_id INT,
  stock INT,
  FOREIGN KEY (product_id) REFERENCES PRODUCTOS(id),
  FOREIGN KEY (warehouse_id) REFERENCES ALMACENES(id)
);

CREATE TABLE EMPLEADOS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(100),
  phone VARCHAR(20)
);

CREATE TABLE MOVIMIENTOS_INVENTARIO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  warehouse_id INT,
  employee_id INT,
  movement_type VARCHAR(50),
  movement_date DATETIME,
  quantity INT,
  comments TEXT,
  FOREIGN KEY (product_id) REFERENCES PRODUCTOS(id),
  FOREIGN KEY (warehouse_id) REFERENCES ALMACENES(id),
  FOREIGN KEY (employee_id) REFERENCES EMPLEADOS(id)
);

CREATE TABLE CLIENTES (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_name VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(255)
);

CREATE TABLE PEDIDOS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  order_date DATETIME,
  FOREIGN KEY (client_id) REFERENCES CLIENTES(id)
);

CREATE TABLE PEDIDOS_DETALLE (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES PEDIDOS(id),
  FOREIGN KEY (product_id) REFERENCES PRODUCTOS(id)
);

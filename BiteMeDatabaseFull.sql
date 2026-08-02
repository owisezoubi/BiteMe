-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --
-- SQL queries for building the WHOLE DATABASE FOR THE ASSIGNMENT 3 --
-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --
 


-- --------------- -- --------------------------------------------------------------- --
-- Creating Schema -- biteme_database contains all the inner data for the app to work --
-- --------------- -- --------------------------------------------------------------- --

CREATE DATABASE biteme_database;

-- --------------- --
-- Creating Tables -- 
-- --------------- --

USE biteme_database;

-- Create `branches` table
CREATE TABLE branches (
    branch_id VARCHAR(255) PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL
);

-- Create `menus` table
CREATE TABLE menus (
    menu_id VARCHAR(255) PRIMARY KEY
);

-- Create `menu_items` table
CREATE TABLE menu_items (
    menu_id VARCHAR(255),
    item_id VARCHAR(255),
    item_name VARCHAR(255),
    description VARCHAR(255),
    price VARCHAR(255),
    category VARCHAR(255),
    PRIMARY KEY (menu_id, item_id),
    FOREIGN KEY (menu_id) REFERENCES menus(menu_id) ON DELETE CASCADE
);

-- Create `additions` table
CREATE TABLE additions (
    addition_id VARCHAR(255) PRIMARY KEY,
    addition_name VARCHAR(255) NOT NULL
);



-- Create `branch_managers` table
CREATE TABLE branch_managers (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `ceos` table
CREATE TABLE ceos (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `private_customers` table
CREATE TABLE private_customers (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    credit_card_number VARCHAR(255),
    credit_card_cvv VARCHAR(255),
    credit_card_month VARCHAR(255),
    credit_card_year VARCHAR(255),
    is_eligible_for_refund VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `business_customers` table
CREATE TABLE business_customers (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    is_eligible_for_refund VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `restaurants` table
CREATE TABLE restaurants (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    restaurant_name VARCHAR(255),
    menu_id VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL,
    FOREIGN KEY (menu_id) REFERENCES menus(menu_id) ON DELETE SET NULL
);

-- Create `users` table
CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `customers` table
CREATE TABLE customers (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    credit_card_number VARCHAR(255),
    credit_card_cvv VARCHAR(255),
    credit_card_month VARCHAR(255),
    credit_card_year VARCHAR(255),
    is_eligible_for_refund VARCHAR(255),
    customer_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL
);

-- Create `certified_workers` table
CREATE TABLE certified_workers (
    id VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_logged_in VARCHAR(255),
    user_type VARCHAR(255) NOT NULL,
    home_branch VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    restaurant_id VARCHAR(255),
    FOREIGN KEY (home_branch) REFERENCES branches(branch_id) ON DELETE SET NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE SET NULL
);

CREATE TABLE category (
    category VARCHAR(255) PRIMARY KEY
);

CREATE TABLE category_additions (
    category VARCHAR(255) NOT NULL,
    addition_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (category, addition_id),
    FOREIGN KEY (category) REFERENCES category(category),
    FOREIGN KEY (addition_id) REFERENCES additions(addition_id)
);



CREATE TABLE orders (
    order_id VARCHAR(255) PRIMARY KEY,
    restaurant_id VARCHAR(255),
    user_id VARCHAR(255),
    date VARCHAR(255),
    desired_time VARCHAR(255),
    arrival_time VARCHAR(255),
    price VARCHAR(255),
    total_price VARCHAR(255),
    restaurant_confirmed VARCHAR(255),
    customer_confirmed VARCHAR(255),
    is_ready VARCHAR(255),
    is_late VARCHAR(255),
    order_type VARCHAR(255),
    order_receiving_method VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE order_category (
    order_id VARCHAR(255),
    category VARCHAR(255),
    quantity VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (category) REFERENCES category(category) ON DELETE CASCADE,
    PRIMARY KEY (order_id, category)
);




CREATE TABLE order_items (
    order_id VARCHAR(255),
    menu_id VARCHAR(255),
    item_id VARCHAR(255),
    item_selected_Additions VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (category) REFERENCES category(category) ON DELETE CASCADE,
    PRIMARY KEY (order_id, category)
);


-- ----------------------- --
-- Creating Reports tables --
-- ----------------------- --


CREATE TABLE quarter_report (
    report_id VARCHAR(255) PRIMARY KEY,
    restaurant_id VARCHAR(255),
    month1 VARCHAR(255),
    month2 VARCHAR(255),
    month3 VARCHAR(255),
    year VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE daily_quarter_report_data (
    report_id VARCHAR(255),
    date VARCHAR(255),
    orders VARCHAR(255),
    revenue VARCHAR(255),
    FOREIGN KEY (report_id) REFERENCES quarter_report(report_id)
);




-- ----------------------------------------------- --
-- Creating Triggers for filling the "users" table --
-- ----------------------------------------------- --



DELIMITER //

-- ---------------------------------------------------
-- Triggers for private_customers
-- ---------------------------------------------------

-- Insert or update users table when private_customers is inserted or updated
CREATE TRIGGER after_insert_update_private_customers_to_users
AFTER INSERT ON private_customers
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'customer', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when private_customers is updated
CREATE TRIGGER after_update_private_customers_to_users
AFTER UPDATE ON private_customers
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Insert or update customers table when private_customers is inserted or updated
CREATE TRIGGER after_insert_update_private_customers_to_customers
AFTER INSERT ON private_customers
FOR EACH ROW
BEGIN
    INSERT INTO customers (id, user_name, password, is_logged_in, user_type, home_branch, credit_card_number, credit_card_cvv, credit_card_month, credit_card_year, is_eligible_for_refund, customer_type)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'customer', NEW.home_branch, NEW.credit_card_number, NEW.credit_card_cvv, NEW.credit_card_month, NEW.credit_card_year, NEW.is_eligible_for_refund, 'private')
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch),
    credit_card_number = VALUES(credit_card_number),
    credit_card_cvv = VALUES(credit_card_cvv),
    credit_card_month = VALUES(credit_card_month),
    credit_card_year = VALUES(credit_card_year),
    is_eligible_for_refund = VALUES(is_eligible_for_refund);
END//

-- Update customers table when private_customers is updated
CREATE TRIGGER after_update_private_customers_to_customers
AFTER UPDATE ON private_customers
FOR EACH ROW
BEGIN
    UPDATE customers
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch,
        credit_card_number = NEW.credit_card_number,
        credit_card_cvv = NEW.credit_card_cvv,
        credit_card_month = NEW.credit_card_month,
        credit_card_year = NEW.credit_card_year,
        is_eligible_for_refund = NEW.is_eligible_for_refund
    WHERE id = NEW.id;
END//

-- Delete from users table when private_customers is deleted
CREATE TRIGGER after_delete_private_customers_from_users
AFTER DELETE ON private_customers
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

-- Delete from customers table when private_customers is deleted
CREATE TRIGGER after_delete_private_customers_from_customers
AFTER DELETE ON private_customers
FOR EACH ROW
BEGIN
    DELETE FROM customers WHERE id = OLD.id;
END//

-- ---------------------------------------------------
-- Triggers for business_customers
-- ---------------------------------------------------

-- Insert or update users table when business_customers is inserted or updated
CREATE TRIGGER after_insert_update_business_customers_to_users
AFTER INSERT ON business_customers
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'customer', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when business_customers is updated
CREATE TRIGGER after_update_business_customers_to_users
AFTER UPDATE ON business_customers
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Insert or update customers table when business_customers is inserted or updated
CREATE TRIGGER after_insert_update_business_customers_to_customers
AFTER INSERT ON business_customers
FOR EACH ROW
BEGIN
    INSERT INTO customers (id, user_name, password, is_logged_in, user_type, home_branch, credit_card_number, credit_card_cvv, credit_card_month, credit_card_year, is_eligible_for_refund, customer_type)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'customer', NEW.home_branch, NULL, NULL, NULL, NULL, NEW.is_eligible_for_refund, 'business')
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch),
    is_eligible_for_refund = VALUES(is_eligible_for_refund);
END//

-- Update customers table when business_customers is updated
CREATE TRIGGER after_update_business_customers_to_customers
AFTER UPDATE ON business_customers
FOR EACH ROW
BEGIN
    UPDATE customers
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch,
        is_eligible_for_refund = NEW.is_eligible_for_refund
    WHERE id = NEW.id;
END//

-- Delete from users table when business_customers is deleted
CREATE TRIGGER after_delete_business_customers_from_users
AFTER DELETE ON business_customers
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

-- Delete from customers table when business_customers is deleted
CREATE TRIGGER after_delete_business_customers_from_customers
AFTER DELETE ON business_customers
FOR EACH ROW
BEGIN
    DELETE FROM customers WHERE id = OLD.id;
END//

-- ---------------------------------------------------
-- Triggers for ceos, branch_managers, certified_workers, restaurants
-- ---------------------------------------------------

-- Insert or update users table when ceos is inserted or updated
CREATE TRIGGER after_insert_update_ceos_to_users
AFTER INSERT ON ceos
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'ceo', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when ceos is updated
CREATE TRIGGER after_update_ceos_to_users
AFTER UPDATE ON ceos
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Delete from users table when ceos is deleted
CREATE TRIGGER after_delete_ceos_from_users
AFTER DELETE ON ceos
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

-- Insert or update users table when branch_managers is inserted or updated
CREATE TRIGGER after_insert_update_branch_managers_to_users
AFTER INSERT ON branch_managers
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'branch_manager', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when branch_managers is updated
CREATE TRIGGER after_update_branch_managers_to_users
AFTER UPDATE ON branch_managers
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Delete from users table when branch_managers is deleted
CREATE TRIGGER after_delete_branch_managers_from_users
AFTER DELETE ON branch_managers
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

-- Insert or update users table when certified_workers is inserted or updated
CREATE TRIGGER after_insert_update_certified_workers_to_users
AFTER INSERT ON certified_workers
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'certified_worker', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when certified_workers is updated
CREATE TRIGGER after_update_certified_workers_to_users
AFTER UPDATE ON certified_workers
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Delete from users table when certified_workers is deleted
CREATE TRIGGER after_delete_certified_workers_from_users
AFTER DELETE ON certified_workers
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

-- Insert or update users table when restaurants is inserted or updated
CREATE TRIGGER after_insert_update_restaurants_to_users
AFTER INSERT ON restaurants
FOR EACH ROW
BEGIN
    INSERT INTO users (id, user_name, password, is_logged_in, user_type, home_branch)
    VALUES (NEW.id, NEW.user_name, NEW.password, NEW.is_logged_in, 'restaurant', NEW.home_branch)
    ON DUPLICATE KEY UPDATE
    user_name = VALUES(user_name),
    password = VALUES(password),
    is_logged_in = VALUES(is_logged_in),
    home_branch = VALUES(home_branch);
END//

-- Update users table when restaurants is updated
CREATE TRIGGER after_update_restaurants_to_users
AFTER UPDATE ON restaurants
FOR EACH ROW
BEGIN
    UPDATE users
    SET user_name = NEW.user_name,
        password = NEW.password,
        is_logged_in = NEW.is_logged_in,
        home_branch = NEW.home_branch
    WHERE id = NEW.id;
END//

-- Delete from users table when restaurants is deleted
CREATE TRIGGER after_delete_restaurants_from_users
AFTER DELETE ON restaurants
FOR EACH ROW
BEGIN
    DELETE FROM users WHERE id = OLD.id;
END//

DELIMITER ;







-- ------------------------- --
-- Insert data to the tables --
-- ------------------------- --



-- Insert data into branches
INSERT INTO branches (branch_id, branch_name) VALUES
('1', 'North'),
('2', 'South'),
('3', 'Central');



-- Menus
INSERT INTO menus (menu_id) VALUES
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10'),
('11');










USE biteme_database;

-- Insert data for Menu 1
INSERT INTO menu_items(menu_id, item_id, item_name, description, price, category) VALUES
('1', 'salad1', 'Caesar Salad', 'Classic Caesar salad with lettuce, croutons, and Caesar dressing.', '50', 'salad'),
('1', 'salad2', 'Greek Salad', 'Salad with cucumbers, tomatoes, olives, feta cheese, and onions.', '45', 'salad'),
('1', 'salad3', 'Garden Salad', 'Fresh garden salad with mixed greens and vegetables.', '40', 'salad'),
('1', 'salad4', 'Cobb Salad', 'Salad with grilled chicken, bacon, eggs, and avocado.', '55', 'salad'),
('1', 'salad5', 'Caprese Salad', 'Salad with fresh tomatoes, mozzarella cheese, and basil.', '50', 'salad'),
('1', 'salad6', 'Spinach Salad', 'Salad with spinach, strawberries, and walnuts.', '45', 'salad'),
('1', 'salad7', 'Pasta Salad', 'Salad with pasta, vegetables, and Italian dressing.', '50', 'salad'),
('1', 'salad8', 'Fruit Salad', 'Salad with mixed seasonal fruits.', '40', 'salad'),
('1', 'main1', 'Grilled Chicken', 'Juicy grilled chicken breast served with vegetables.', '120', 'main dish'),
('1', 'main2', 'Beef Steak', 'Tender beef steak cooked to your preference.', '150', 'main dish'),
('1', 'main3', 'Vegetable Stir Fry', 'Mixed vegetables stir-fried with a savory sauce.', '110', 'main dish'),
('1', 'main4', 'Pasta Carbonara', 'Pasta with creamy carbonara sauce and bacon.', '130', 'main dish'),
('1', 'main5', 'Fish Tacos', 'Tacos with grilled fish, cabbage, and a tangy sauce.', '115', 'main dish'),
('1', 'main6', 'BBQ Ribs', 'Ribs slow-cooked and smothered in BBQ sauce.', '140', 'main dish'),
('1', 'main7', 'Lamb Chops', 'Grilled lamb chops with rosemary and garlic.', '160', 'main dish'),
('1', 'main8', 'Chicken Alfredo', 'Pasta with chicken in a creamy Alfredo sauce.', '125', 'main dish'),
('1', 'main9', 'Veggie Burger', 'Grilled veggie patty served with lettuce and tomato.', '105', 'main dish'),
('1', 'main10', 'Seafood Paella', 'Spanish rice dish with mixed seafood.', '150', 'main dish'),
('1', 'main11', 'Chicken Parmesan', 'Breaded chicken breast topped with marinara and cheese.', '130', 'main dish'),
('1', 'dessert1', 'Cheesecake', 'Rich and creamy cheesecake with a graham cracker crust.', '60', 'dessert'),
('1', 'dessert2', 'Chocolate Lava Cake', 'Warm chocolate cake with a molten center.', '65', 'dessert'),
('1', 'dessert3', 'Apple Pie', 'Classic apple pie with a flaky crust.', '55', 'dessert'),
('1', 'dessert4', 'Tiramisu', 'Italian dessert with coffee-soaked ladyfingers and mascarpone cheese.', '70', 'dessert'),
('1', 'dessert5', 'Panna Cotta', 'Italian vanilla-flavored custard dessert.', '60', 'dessert'),
('1', 'dessert6', 'Lemon Meringue Pie', 'Tangy lemon pie topped with fluffy meringue.', '65', 'dessert'),
('1', 'dessert7', 'Brownies', 'Rich and fudgy brownies with chocolate chunks.', '50', 'dessert'),
('1', 'drink1', 'Coke', 'Classic Coca-Cola soft drink.', '15', 'drink'),
('1', 'drink2', 'Sprite', 'Lemon-lime flavored soft drink.', '15', 'drink'),
('1', 'drink3', 'Water', 'Bottled mineral water.', '10', 'drink'),
('1', 'drink4', 'Orange Juice', 'Freshly squeezed orange juice.', '20', 'drink'),
('1', 'drink5', 'Coffee', 'Hot brewed coffee.', '18', 'drink'),
('1', 'drink6', 'Tea', 'Hot tea with various flavors.', '18', 'drink'),

-- Insert data for Menu 2
('2', 'salad1', 'Avocado Salad', 'Salad with avocado, tomatoes, and a citrus vinaigrette.', '55', 'salad'),
('2', 'salad2', 'Waldorf Salad', 'Salad with apples, celery, and walnuts.', '50', 'salad'),
('2', 'salad3', 'Asian Slaw', 'Crispy slaw with a tangy Asian dressing.', '45', 'salad'),
('2', 'salad4', 'Chicken Salad', 'Salad with grilled chicken, mixed greens, and balsamic vinaigrette.', '60', 'salad'),
('2', 'salad5', 'Panzanella Salad', 'Italian bread salad with tomatoes and cucumbers.', '55', 'salad'),
('2', 'salad6', 'Cucumber Salad', 'Salad with cucumbers, dill, and yogurt dressing.', '45', 'salad'),
('2', 'salad7', 'Beet Salad', 'Salad with roasted beets, goat cheese, and walnuts.', '50', 'salad'),
('2', 'salad8', 'Quinoa Salad', 'Salad with quinoa, black beans, and corn.', '55', 'salad'),
('2', 'main1', 'Roast Chicken', 'Herb-roasted chicken with seasonal vegetables.', '125', 'main dish'),
('2', 'main2', 'Pork Schnitzel', 'Breaded pork cutlet served with lemon.', '135', 'main dish'),
('2', 'main3', 'Spaghetti Bolognese', 'Spaghetti with a rich Bolognese sauce.', '125', 'main dish'),
('2', 'main4', 'Chicken Tikka Masala', 'Grilled chicken in a spiced tomato sauce.', '140', 'main dish'),
('2', 'main5', 'Lentil Curry', 'Spicy lentil curry with rice.', '115', 'main dish'),
('2', 'main6', 'Shrimp Scampi', 'Shrimp in a garlic butter sauce with pasta.', '150', 'main dish'),
('2', 'main7', 'Vegetarian Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('2', 'main8', 'BBQ Chicken Pizza', 'Pizza with BBQ chicken and caramelized onions.', '140', 'main dish'),
('2', 'main9', 'Beef Stroganoff', 'Beef in a creamy mushroom sauce with noodles.', '140', 'main dish'),
('2', 'main10', 'Pork Tenderloin', 'Roasted pork tenderloin with a wine reduction.', '150', 'main dish'),
('2', 'main11', 'Grilled Salmon', 'Salmon fillet grilled with lemon and herbs.', '160', 'main dish'),
('2', 'dessert1', 'Fruit Tart', 'Tart with fresh fruit and custard.', '65', 'dessert'),
('2', 'dessert2', 'Crème Brûlée', 'Vanilla custard with a caramelized sugar crust.', '70', 'dessert'),
('2', 'dessert3', 'Raspberry Sorbet', 'Refreshing raspberry sorbet.', '55', 'dessert'),
('2', 'dessert4', 'Apple Crumble', 'Baked apple crumble with a cinnamon topping.', '60', 'dessert'),
('2', 'dessert5', 'Chocolate Mousse', 'Rich chocolate mousse with whipped cream.', '65', 'dessert'),
('2', 'dessert6', 'Peach Cobbler', 'Warm peach cobbler with a biscuit topping.', '60', 'dessert'),
('2', 'dessert7', 'Baklava', 'Sweet pastry with nuts and honey.', '55', 'dessert'),
('2', 'drink1', 'Lemonade', 'Homemade lemonade with fresh lemon juice.', '18', 'drink'),
('2', 'drink2', 'Iced Tea', 'Refreshing iced tea with lemon.', '15', 'drink'),
('2', 'drink3', 'Root Beer', 'Classic root beer soft drink.', '15', 'drink'),
('2', 'drink4', 'Ginger Ale', 'Spicy ginger-flavored soft drink.', '15', 'drink'),
('2', 'drink5', 'Hot Chocolate', 'Warm hot chocolate with whipped cream.', '20', 'drink'),
('2', 'drink6', 'Milkshake', 'Thick milkshake with your choice of flavor.', '25', 'drink'),

-- Insert data for Menu 3
('3', 'salad1', 'Nicoise Salad', 'Salad with tuna, eggs, and olives.', '60', 'salad'),
('3', 'salad2', 'Autumn Salad', 'Salad with roasted squash, cranberries, and pecans.', '55', 'salad'),
('3', 'salad3', 'Chickpea Salad', 'Salad with chickpeas, tomatoes, and feta cheese.', '50', 'salad'),
('3', 'salad4', 'Arugula Salad', 'Salad with arugula, parmesan, and lemon vinaigrette.', '45', 'salad'),
('3', 'salad5', 'Mediterranean Salad', 'Salad with olives, cucumbers, and tomatoes.', '50', 'salad'),
('3', 'salad6', 'Bulgur Salad', 'Salad with bulgur wheat, parsley, and tomatoes.', '45', 'salad'),
('3', 'salad7', 'Pico de Gallo', 'Fresh salsa with tomatoes, onions, and cilantro.', '40', 'salad'),
('3', 'salad8', 'Cabbage Salad', 'Crunchy cabbage salad with a tangy dressing.', '45', 'salad'),
('3', 'main1', 'Stuffed Bell Peppers', 'Bell peppers stuffed with rice and meat.', '120', 'main dish'),
('3', 'main2', 'Chicken Kiev', 'Breaded chicken stuffed with herb butter.', '135', 'main dish'),
('3', 'main3', 'Beef Wellington', 'Beef wrapped in pastry with mushroom duxelles.', '180', 'main dish'),
('3', 'main4', 'Eggplant Parmesan', 'Layers of eggplant, marinara, and cheese.', '125', 'main dish'),
('3', 'main5', 'Seafood Risotto', 'Creamy risotto with mixed seafood.', '150', 'main dish'),
('3', 'main6', 'Pork Belly', 'Slow-roasted pork belly with crispy skin.', '160', 'main dish'),
('3', 'main7', 'Chicken Enchiladas', 'Corn tortillas filled with chicken and cheese.', '140', 'main dish'),
('3', 'main8', 'Vegetable Curry', 'Mixed vegetables in a spicy curry sauce.', '115', 'main dish'),
('3', 'main9', 'Fettuccine Alfredo', 'Fettuccine pasta with a creamy Alfredo sauce.', '130', 'main dish'),
('3', 'main10', 'Beef Tacos', 'Soft tacos with seasoned beef and toppings.', '110', 'main dish'),
('3', 'main11', 'Moussaka', 'Greek dish with layers of eggplant and meat sauce.', '145', 'main dish'),
('3', 'dessert1', 'Lemon Bars', 'Sweet and tangy lemon bars with powdered sugar.', '55', 'dessert'),
('3', 'dessert2', 'Apple Strudel', 'Pastry filled with spiced apples and raisins.', '60', 'dessert'),
('3', 'dessert3', 'Pumpkin Pie', 'Classic pumpkin pie with a spiced filling.', '55', 'dessert'),
('3', 'dessert4', 'Profiteroles', 'Pastry puffs filled with cream and drizzled with chocolate.', '65', 'dessert'),
('3', 'dessert5', 'Key Lime Pie', 'Tart lime pie with a graham cracker crust.', '60', 'dessert'),
('3', 'dessert6', 'Raisin Cake', 'Moist cake with raisins and spices.', '55', 'dessert'),
('3', 'dessert7', 'Peach Melba', 'Peach with raspberry sauce and vanilla ice cream.', '60', 'dessert'),
('3', 'drink1', 'Iced Coffee', 'Cold brewed coffee served over ice.', '20', 'drink'),
('3', 'drink2', 'Peach Juice', 'Fresh peach juice.', '20', 'drink'),
('3', 'drink3', 'Berry Smoothie', 'Smoothie made with mixed berries.', '25', 'drink'),
('3', 'drink4', 'Green Tea', 'Hot green tea with a subtle flavor.', '15', 'drink'),
('3', 'drink5', 'Chai Latte', 'Spiced tea with steamed milk.', '22', 'drink'),
('3', 'drink6', 'Hot Apple Cider', 'Warm apple cider with spices.', '20', 'drink'),

-- Insert data for Menu 4
('4', 'salad1', 'Thai Salad', 'Salad with mixed greens, carrots, and a spicy Thai dressing.', '55', 'salad'),
('4', 'salad2', 'Fattoush Salad', 'Lebanese salad with tomatoes, cucumbers, and crispy pita.', '50', 'salad'),
('4', 'salad3', 'Tabbouleh', 'Salad with bulgur, parsley, and mint.', '45', 'salad'),
('4', 'salad4', 'Salmon Salad', 'Salad with smoked salmon and avocado.', '60', 'salad'),
('4', 'salad5', 'Caprese Salad', 'Salad with fresh mozzarella, tomatoes, and basil.', '55', 'salad'),
('4', 'salad6', 'Chopped Salad', 'Salad with chopped vegetables and feta cheese.', '50', 'salad'),
('4', 'salad7', 'Bean Salad', 'Salad with mixed beans and a tangy vinaigrette.', '45', 'salad'),
('4', 'salad8', 'Roasted Veggie Salad', 'Salad with roasted vegetables and a balsamic glaze.', '55', 'salad'),
('4', 'main1', 'Grilled Lamb', 'Grilled lamb chops served with a mint sauce.', '160', 'main dish'),
('4', 'main2', 'Chicken Cacciatore', 'Chicken stewed with tomatoes and herbs.', '130', 'main dish'),
('4', 'main3', 'Lasagna', 'Layers of pasta, meat sauce, and cheese.', '140', 'main dish'),
('4', 'main4', 'Beef Tacos', 'Tacos with seasoned beef and fresh toppings.', '110', 'main dish'),
('4', 'main5', 'Chicken Stir Fry', 'Chicken stir-fried with vegetables and a savory sauce.', '120', 'main dish'),
('4', 'main6', 'Pork Ribs', 'Slow-cooked pork ribs with a smoky BBQ sauce.', '145', 'main dish'),
('4', 'main7', 'Spaghetti', 'Classic spaghetti with marinara sauce.', '115', 'main dish'),
('4', 'main8', 'Stuffed Mushrooms', 'Mushrooms stuffed with cheese and herbs.', '105', 'main dish'),
('4', 'main9', 'Chicken Caesar Wrap', 'Wrap with grilled chicken, Caesar dressing, and lettuce.', '110', 'main dish'),
('4', 'main10', 'Fish and Chips', 'Battered fish served with crispy fries.', '125', 'main dish'),
('4', 'main11', 'Mushroom Risotto', 'Creamy risotto with mushrooms and parmesan.', '130', 'main dish'),
('4', 'dessert1', 'Pavlova', 'Meringue dessert topped with fresh fruit and cream.', '65', 'dessert'),
('4', 'dessert2', 'Baklava', 'Sweet pastry filled with nuts and honey.', '55', 'dessert'),
('4', 'dessert3', 'Panna Cotta', 'Creamy vanilla custard with a berry sauce.', '60', 'dessert'),
('4', 'dessert4', 'Chocolate Chip Cookies', 'Classic cookies with chocolate chips.', '50', 'dessert'),
('4', 'dessert5', 'Almond Cake', 'Moist cake with almond flavor.', '60', 'dessert'),
('4', 'dessert6', 'Crepes', 'Thin pancakes served with fresh fruit and syrup.', '55', 'dessert'),
('4', 'dessert7', 'Raspberry Cheesecake', 'Cheesecake topped with a raspberry sauce.', '65', 'dessert'),
('4', 'drink1', 'Apple Juice', 'Freshly squeezed apple juice.', '20', 'drink'),
('4', 'drink2', 'Grape Juice', 'Juice made from ripe grapes.', '20', 'drink'),
('4', 'drink3', 'Smoothie', 'Fruit smoothie with your choice of flavor.', '25', 'drink'),
('4', 'drink4', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),
('4', 'drink5', 'Herbal Tea', 'Caffeine-free herbal tea.', '18', 'drink'),
('4', 'drink6', 'Soda', 'Classic carbonated soft drink.', '15', 'drink'),

-- Insert data for Menu 5
('5', 'salad1', 'Shaved Brussels Sprouts', 'Salad with shaved Brussels sprouts, pecorino, and lemon.', '55', 'salad'),
('5', 'salad2', 'Mixed Green Salad', 'Fresh greens with a variety of vegetables.', '45', 'salad'),
('5', 'salad3', 'Avocado and Mango Salad', 'Salad with avocado, mango, and a lime dressing.', '50', 'salad'),
('5', 'salad4', 'Corn Salad', 'Salad with corn, black beans, and cilantro.', '45', 'salad'),
('5', 'salad5', 'Asian Noodle Salad', 'Salad with noodles, vegetables, and a sesame dressing.', '50', 'salad'),
('5', 'salad6', 'Cucumber and Tomato Salad', 'Salad with cucumbers, tomatoes, and feta cheese.', '40', 'salad'),
('5', 'salad7', 'Roasted Beet Salad', 'Salad with roasted beets, goat cheese, and walnuts.', '55', 'salad'),
('5', 'salad8', 'Spinach and Strawberry Salad', 'Salad with spinach, strawberries, and almonds.', '50', 'salad'),
('5', 'main1', 'Chicken Tenders', 'Crispy chicken tenders served with dipping sauce.', '110', 'main dish'),
('5', 'main2', 'Beef Burritos', 'Burritos filled with seasoned beef and beans.', '120', 'main dish'),
('5', 'main3', 'Vegetarian Chili', 'Spicy chili with a variety of beans and vegetables.', '110', 'main dish'),
('5', 'main4', 'Shrimp Tacos', 'Tacos with grilled shrimp and fresh toppings.', '125', 'main dish'),
('5', 'main5', 'Spaghetti Carbonara', 'Spaghetti with a creamy carbonara sauce and bacon.', '130', 'main dish'),
('5', 'main6', 'Chicken Parmesan', 'Breaded chicken with marinara and melted cheese.', '140', 'main dish'),
('5', 'main7', 'Pulled Pork Sandwich', 'Sandwich with tender pulled pork and coleslaw.', '125', 'main dish'),
('5', 'main8', 'Vegetable Frittata', 'Egg frittata with a mix of fresh vegetables.', '115', 'main dish'),
('5', 'main9', 'Stuffed Peppers', 'Bell peppers stuffed with rice and ground meat.', '120', 'main dish'),
('5', 'main10', 'Grilled Tuna Steak', 'Tuna steak grilled with a lemon glaze.', '145', 'main dish'),
('5', 'main11', 'Pork Chops', 'Grilled pork chops with a savory sauce.', '140', 'main dish'),
('5', 'dessert1', 'Raspberry Sorbet', 'Refreshing raspberry sorbet.', '55', 'dessert'),
('5', 'dessert2', 'Cheesecake', 'Rich and creamy cheesecake with a graham cracker crust.', '65', 'dessert'),
('5', 'dessert3', 'Carrot Cake', 'Spiced carrot cake with cream cheese frosting.', '60', 'dessert'),
('5', 'dessert4', 'Chocolate Cake', 'Decadent chocolate cake with ganache.', '65', 'dessert'),
('5', 'dessert5', 'Tiramisu', 'Classic Italian tiramisu with coffee-soaked ladyfingers.', '70', 'dessert'),
('5', 'dessert6', 'Panna Cotta', 'Vanilla panna cotta with berry sauce.', '60', 'dessert'),
('5', 'dessert7', 'Coconut Macaroons', 'Chewy coconut macaroons dipped in chocolate.', '55', 'dessert'),
('5', 'drink1', 'Soft Drink', 'Classic soft drink in various flavors.', '15', 'drink'),
('5', 'drink2', 'Lemonade', 'Refreshing lemonade made from fresh lemons.', '18', 'drink'),
('5', 'drink3', 'Iced Coffee', 'Cold brew coffee served over ice.', '22', 'drink'),
('5', 'drink4', 'Milkshake', 'Thick milkshake with a choice of flavor.', '25', 'drink'),
('5', 'drink5', 'Fruit Punch', 'Sweet fruit punch with a mix of juices.', '20', 'drink'),
('5', 'drink6', 'Sparkling Water', 'Carbonated water with a hint of lemon.', '18', 'drink'),

-- Insert data for Menu 6
('6', 'salad1', 'Crispy Chickpea Salad', 'Salad with crispy chickpeas, tomatoes, and cucumbers.', '50', 'salad'),
('6', 'salad2', 'Grilled Veggie Salad', 'Salad with grilled vegetables and a balsamic vinaigrette.', '55', 'salad'),
('6', 'salad3', 'Tomato Basil Salad', 'Salad with ripe tomatoes and fresh basil.', '45', 'salad'),
('6', 'salad4', 'Pear Salad', 'Salad with pear slices, blue cheese, and walnuts.', '55', 'salad'),
('6', 'salad5', 'Pico de Gallo Salad', 'Fresh salsa with tomatoes, onions, and cilantro.', '45', 'salad'),
('6', 'salad6', 'Mediterranean Quinoa Salad', 'Salad with quinoa, olives, and feta cheese.', '50', 'salad'),
('6', 'salad7', 'Lentil Salad', 'Salad with lentils, carrots, and a lemon dressing.', '45', 'salad'),
('6', 'salad8', 'Southwestern Salad', 'Salad with black beans, corn, and avocado.', '50', 'salad'),
('6', 'main1', 'Chicken Skewers', 'Grilled chicken skewers with a spicy marinade.', '120', 'main dish'),
('6', 'main2', 'Beef Stroganoff', 'Beef in a creamy mushroom sauce served with noodles.', '140', 'main dish'),
('6', 'main3', 'Salmon Fillet', 'Grilled salmon fillet with a citrus glaze.', '160', 'main dish'),
('6', 'main4', 'Spaghetti Bolognese', 'Spaghetti with a rich Bolognese sauce.', '125', 'main dish'),
('6', 'main5', 'Pork Chops', 'Grilled pork chops served with apple sauce.', '140', 'main dish'),
('6', 'main6', 'Vegetable Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('6', 'main7', 'Chicken Burrito', 'Burrito filled with chicken, rice, and beans.', '120', 'main dish'),
('6', 'main8', 'BBQ Pork Ribs', 'Slow-cooked pork ribs with a smoky BBQ sauce.', '150', 'main dish'),
('6', 'main9', 'Mushroom Risotto', 'Creamy risotto with mushrooms and parmesan.', '130', 'main dish'),
('6', 'main10', 'Grilled Tuna', 'Tuna steak grilled with a lemon glaze.', '145', 'main dish'),
('6', 'main11', 'Pasta Primavera', 'Pasta with fresh vegetables in a light sauce.', '125', 'main dish'),
('6', 'dessert1', 'Fruit Tart', 'Pastry tart with fresh fruit and custard.', '60', 'dessert'),
('6', 'dessert2', 'Chocolate Fondue', 'Melting chocolate served with fruit for dipping.', '70', 'dessert'),
('6', 'dessert3', 'Blueberry Muffins', 'Freshly baked blueberry muffins.', '55', 'dessert'),
('6', 'dessert4', 'Peach Cobbler', 'Warm peach cobbler with a biscuit topping.', '60', 'dessert'),
('6', 'dessert5', 'Lemon Poppy Seed Cake', 'Moist cake with lemon and poppy seeds.', '60', 'dessert'),
('6', 'dessert6', 'Berry Crumble', 'Mixed berries topped with a crumbly topping.', '55', 'dessert'),
('6', 'dessert7', 'Baklava', 'Sweet pastry filled with nuts and honey.', '55', 'dessert'),
('6', 'drink1', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),
('6', 'drink2', 'Iced Tea', 'Chilled tea with a hint of lemon.', '18', 'drink'),
('6', 'drink3', 'Sparkling Water', 'Carbonated water with a hint of citrus.', '20', 'drink'),
('6', 'drink4', 'Green Tea', 'Hot green tea with a delicate flavor.', '18', 'drink'),
('6', 'drink5', 'Hot Chocolate', 'Warm hot chocolate with whipped cream.', '20', 'drink'),
('6', 'drink6', 'Lemonade', 'Fresh lemonade with a splash of citrus.', '18', 'drink'),

-- Insert data for Menu 7
('7', 'salad1', 'Greek Salad', 'Salad with feta cheese, olives, and cucumbers.', '50', 'salad'),
('7', 'salad2', 'Cucumber Salad', 'Cucumber salad with dill and yogurt dressing.', '45', 'salad'),
('7', 'salad3', 'Avocado Salad', 'Salad with avocado, tomatoes, and onions.', '55', 'salad'),
('7', 'salad4', 'Quinoa Salad', 'Salad with quinoa, black beans, and corn.', '50', 'salad'),
('7', 'salad5', 'Garden Salad', 'Simple salad with mixed greens and a vinaigrette.', '45', 'salad'),
('7', 'salad6', 'Spinach Salad', 'Spinach salad with strawberries and walnuts.', '55', 'salad'),
('7', 'salad7', 'Kale Salad', 'Kale salad with lemon and olive oil.', '50', 'salad'),
('7', 'salad8', 'Winter Salad', 'Salad with roasted root vegetables and a balsamic glaze.', '55', 'salad'),
('7', 'main1', 'Barbecue Chicken', 'Grilled chicken with barbecue sauce.', '140', 'main dish'),
('7', 'main2', 'Pasta Primavera', 'Pasta with fresh vegetables and a light sauce.', '120', 'main dish'),
('7', 'main3', 'Beef Stroganoff', 'Beef with a creamy mushroom sauce served over noodles.', '130', 'main dish'),
('7', 'main4', 'Stuffed Eggplant', 'Eggplant stuffed with vegetables and cheese.', '125', 'main dish'),
('7', 'main5', 'Chicken Alfredo', 'Pasta with a creamy Alfredo sauce and chicken.', '135', 'main dish'),
('7', 'main6', 'Vegetarian Burritos', 'Burritos filled with vegetables and beans.', '115', 'main dish'),
('7', 'main7', 'Pork Schnitzel', 'Breaded pork cutlet with a lemon wedge.', '140', 'main dish'),
('7', 'main8', 'Seafood Pasta', 'Pasta with a mix of seafood in a light sauce.', '150', 'main dish'),
('7', 'main9', 'Grilled Lamb Chops', 'Lamb chops grilled with rosemary.', '160', 'main dish'),
('7', 'main10', 'Shrimp Scampi', 'Shrimp cooked in a garlic and lemon sauce.', '145', 'main dish'),
('7', 'main11', 'Moussaka', 'Layered dish with eggplant and meat.', '140', 'main dish'),
('7', 'dessert1', 'Tiramisu', 'Classic Italian dessert with coffee-soaked ladyfingers.', '70', 'dessert'),
('7', 'dessert2', 'Lemon Meringue Pie', 'Pie with lemon filling and meringue topping.', '65', 'dessert'),
('7', 'dessert3', 'Peach Cobbler', 'Warm cobbler with peaches and a biscuit topping.', '60', 'dessert'),
('7', 'dessert4', 'Chocolate Mousse', 'Rich chocolate mousse with whipped cream.', '65', 'dessert'),
('7', 'dessert5', 'Baklava', 'Sweet pastry with nuts and honey.', '55', 'dessert'),
('7', 'dessert6', 'Panna Cotta', 'Vanilla custard with a berry sauce.', '60', 'dessert'),
('7', 'dessert7', 'Fruit Salad', 'Fresh fruit salad with a honey-lime dressing.', '55', 'dessert'),
('7', 'drink1', 'Lemonade', 'Refreshing lemonade with a splash of citrus.', '18', 'drink'),
('7', 'drink2', 'Iced Tea', 'Chilled tea with lemon.', '18', 'drink'),
('7', 'drink3', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),
('7', 'drink4', 'Sparkling Water', 'Carbonated water with a hint of citrus.', '20', 'drink'),
('7', 'drink5', 'Hot Chocolate', 'Warm hot chocolate with whipped cream.', '20', 'drink'),
('7', 'drink6', 'Fruit Smoothie', 'Smoothie made with fresh fruit.', '25', 'drink'),

-- Insert data for Menu 8
('8', 'salad1', 'Roasted Carrot Salad', 'Salad with roasted carrots, feta cheese, and herbs.', '50', 'salad'),
('8', 'salad2', 'Winter Slaw', 'Shredded cabbage salad with a tangy dressing.', '45', 'salad'),
('8', 'salad3', 'Quinoa Salad', 'Salad with quinoa, cucumbers, and tomatoes.', '55', 'salad'),
('8', 'salad4', 'Spinach Salad', 'Spinach salad with apples and walnuts.', '50', 'salad'),
('8', 'salad5', 'Greek Salad', 'Salad with olives, feta, and cucumbers.', '55', 'salad'),
('8', 'salad6', 'Pasta Salad', 'Salad with pasta, vegetables, and Italian dressing.', '45', 'salad'),
('8', 'salad7', 'Beet Salad', 'Salad with roasted beets and goat cheese.', '55', 'salad'),
('8', 'salad8', 'Asian Cucumber Salad', 'Cucumber salad with sesame seeds and rice vinegar.', '50', 'salad'),
('8', 'main1', 'Beef Tacos', 'Tacos with seasoned beef and fresh toppings.', '110', 'main dish'),
('8', 'main2', 'Chicken Burritos', 'Burritos filled with chicken and black beans.', '120', 'main dish'),
('8', 'main3', 'Vegetable Stir-Fry', 'Stir-fried vegetables with a savory sauce.', '110', 'main dish'),
('8', 'main4', 'Grilled Chicken', 'Grilled chicken served with a side of vegetables.', '130', 'main dish'),
('8', 'main5', 'Pasta Bolognese', 'Pasta with a rich Bolognese sauce.', '125', 'main dish'),
('8', 'main6', 'Seafood Paella', 'Paella with a mix of seafood and saffron.', '160', 'main dish'),
('8', 'main7', 'Eggplant Parmesan', 'Layers of eggplant, marinara, and cheese.', '130', 'main dish'),
('8', 'main8', 'Pulled Pork Tacos', 'Tacos with pulled pork and spicy sauce.', '140', 'main dish'),
('8', 'main9', 'Chicken Tikka Masala', 'Chicken cooked in a spicy masala sauce.', '150', 'main dish'),
('8', 'main10', 'Vegetable Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('8', 'main11', 'Pork Schnitzel', 'Breaded pork cutlet with a lemon wedge.', '140', 'main dish'),
('8', 'dessert1', 'Chocolate Cake', 'Decadent chocolate cake with ganache.', '65', 'dessert'),
('8', 'dessert2', 'Cheesecake', 'Rich and creamy cheesecake with a graham cracker crust.', '70', 'dessert'),
('8', 'dessert3', 'Apple Crisp', 'Warm apple crisp with a crumbly topping.', '60', 'dessert'),
('8', 'dessert4', 'Fruit Tart', 'Pastry tart with fresh fruit and custard.', '65', 'dessert'),
('8', 'dessert5', 'Panna Cotta', 'Vanilla custard with berry sauce.', '60', 'dessert'),
('8', 'dessert6', 'Lemon Bars', 'Sweet and tangy lemon bars.', '55', 'dessert'),
('8', 'dessert7', 'Baklava', 'Sweet pastry filled with nuts and honey.', '60', 'dessert'),
('8', 'drink1', 'Iced Coffee', 'Cold brewed coffee served over ice.', '22', 'drink'),
('8', 'drink2', 'Lemonade', 'Refreshing lemonade made from fresh lemons.', '20', 'drink'),
('8', 'drink3', 'Smoothie', 'Fruit smoothie with your choice of flavor.', '25', 'drink'),
('8', 'drink4', 'Herbal Tea', 'Caffeine-free herbal tea.', '18', 'drink'),
('8', 'drink5', 'Sparkling Water', 'Carbonated water with a hint of lemon.', '20', 'drink'),
('8', 'drink6', 'Hot Apple Cider', 'Warm apple cider with spices.', '20', 'drink'),

-- Insert data for Menu 9
('9', 'salad1', 'Mediterranean Salad', 'Salad with olives, cucumbers, and tomatoes.', '50', 'salad'),
('9', 'salad2', 'Caprese Salad', 'Salad with fresh mozzarella, tomatoes, and basil.', '55', 'salad'),
('9', 'salad3', 'Kale Salad', 'Salad with kale, avocado, and lemon vinaigrette.', '50', 'salad'),
('9', 'salad4', 'Quinoa Salad', 'Salad with quinoa, black beans, and corn.', '55', 'salad'),
('9', 'salad5', 'Spinach Salad', 'Spinach salad with strawberries and walnuts.', '50', 'salad'),
('9', 'salad6', 'Roasted Beet Salad', 'Salad with roasted beets, goat cheese, and walnuts.', '55', 'salad'),
('9', 'salad7', 'Greek Salad', 'Salad with feta cheese, olives, and cucumbers.', '50', 'salad'),
('9', 'salad8', 'Garden Salad', 'Simple salad with mixed greens and a vinaigrette.', '45', 'salad'),
('9', 'main1', 'BBQ Chicken', 'Grilled BBQ chicken with a side of coleslaw.', '140', 'main dish'),
('9', 'main2', 'Chicken Alfredo', 'Pasta with creamy Alfredo sauce and chicken.', '130', 'main dish'),
('9', 'main3', 'Vegetable Stir-Fry', 'Stir-fried vegetables with rice.', '115', 'main dish'),
('9', 'main4', 'Grilled Salmon', 'Grilled salmon with a lemon glaze.', '160', 'main dish'),
('9', 'main5', 'Pasta Bolognese', 'Pasta with a rich meat sauce.', '125', 'main dish'),
('9', 'main6', 'Vegetable Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('9', 'main7', 'Beef Tacos', 'Tacos with seasoned beef and fresh toppings.', '120', 'main dish'),
('9', 'main8', 'Pulled Pork Sandwich', 'Pulled pork sandwich with coleslaw.', '125', 'main dish'),
('9', 'main9', 'Seafood Paella', 'Paella with a mix of seafood and saffron.', '160', 'main dish'),
('9', 'main10', 'Chicken Burritos', 'Burritos filled with chicken, rice, and beans.', '120', 'main dish'),
('9', 'main11', 'Pork Schnitzel', 'Breaded pork cutlet with a lemon wedge.', '140', 'main dish'),
('9', 'dessert1', 'Fruit Salad', 'Fresh fruit salad with a honey-lime dressing.', '55', 'dessert'),
('9', 'dessert2', 'Cheesecake', 'Rich cheesecake with a graham cracker crust.', '65', 'dessert'),
('9', 'dessert3', 'Chocolate Cake', 'Decadent chocolate cake with ganache.', '70', 'dessert'),
('9', 'dessert4', 'Apple Crisp', 'Warm apple crisp with a crumbly topping.', '60', 'dessert'),
('9', 'dessert5', 'Baklava', 'Sweet pastry filled with nuts and honey.', '60', 'dessert'),
('9', 'dessert6', 'Lemon Bars', 'Sweet and tangy lemon bars.', '55', 'dessert'),
('9', 'dessert7', 'Panna Cotta', 'Vanilla panna cotta with a berry sauce.', '60', 'dessert'),
('9', 'drink1', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),
('9', 'drink2', 'Iced Tea', 'Chilled tea with lemon.', '18', 'drink'),
('9', 'drink3', 'Lemonade', 'Refreshing lemonade made from fresh lemons.', '20', 'drink'),
('9', 'drink4', 'Herbal Tea', 'Caffeine-free herbal tea.', '18', 'drink'),
('9', 'drink5', 'Sparkling Water', 'Carbonated water with a hint of lemon.', '20', 'drink'),
('9', 'drink6', 'Fruit Smoothie', 'Smoothie made with fresh fruit.', '25', 'drink'),

-- Insert data for Menu 10
('10', 'salad1', 'Fattoush Salad', 'Salad with mixed greens, tomatoes, and crispy pita chips.', '50', 'salad'),
('10', 'salad2', 'Tomato Basil Salad', 'Salad with ripe tomatoes and fresh basil.', '45', 'salad'),
('10', 'salad3', 'Avocado Salad', 'Salad with avocado, tomatoes, and onions.', '55', 'salad'),
('10', 'salad4', 'Cucumber Salad', 'Cucumber salad with dill and yogurt dressing.', '45', 'salad'),
('10', 'salad5', 'Quinoa Salad', 'Salad with quinoa, black beans, and corn.', '55', 'salad'),
('10', 'salad6', 'Spinach Salad', 'Spinach salad with apples and walnuts.', '50', 'salad'),
('10', 'salad7', 'Greek Salad', 'Salad with feta cheese, olives, and cucumbers.', '50', 'salad'),
('10', 'salad8', 'Winter Salad', 'Salad with roasted root vegetables and a balsamic glaze.', '55', 'salad'),
('10', 'main1', 'Chicken Parmesan', 'Breaded chicken with marinara sauce and melted cheese.', '140', 'main dish'),
('10', 'main2', 'Vegetable Stir-Fry', 'Stir-fried vegetables with a savory sauce.', '115', 'main dish'),
('10', 'main3', 'Beef Tacos', 'Tacos with seasoned beef and fresh toppings.', '110', 'main dish'),
('10', 'main4', 'Grilled Chicken', 'Grilled chicken served with a side of vegetables.', '130', 'main dish'),
('10', 'main5', 'Seafood Paella', 'Paella with a mix of seafood and saffron.', '160', 'main dish'),
('10', 'main6', 'Vegetable Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('10', 'main7', 'Pulled Pork Tacos', 'Tacos with pulled pork and spicy sauce.', '140', 'main dish'),
('10', 'main8', 'Chicken Burrito', 'Burrito filled with chicken, rice, and beans.', '120', 'main dish'),
('10', 'main9', 'BBQ Pork Ribs', 'Slow-cooked pork ribs with a smoky BBQ sauce.', '150', 'main dish'),
('10', 'main10', 'Pasta Primavera', 'Pasta with fresh vegetables in a light sauce.', '120', 'main dish'),
('10', 'main11', 'Pork Schnitzel', 'Breaded pork cutlet with a lemon wedge.', '140', 'main dish'),
('10', 'dessert1', 'Lemon Bars', 'Sweet and tangy lemon bars.', '55', 'dessert'),
('10', 'dessert2', 'Panna Cotta', 'Vanilla panna cotta with a berry sauce.', '60', 'dessert'),
('10', 'dessert3', 'Fruit Tart', 'Pastry tart with fresh fruit and custard.', '60', 'dessert'),
('10', 'dessert4', 'Apple Crisp', 'Warm apple crisp with a crumbly topping.', '60', 'dessert'),
('10', 'dessert5', 'Chocolate Cake', 'Decadent chocolate cake with ganache.', '65', 'dessert'),
('10', 'dessert6', 'Baklava', 'Sweet pastry filled with nuts and honey.', '55', 'dessert'),
('10', 'dessert7', 'Cheesecake', 'Rich and creamy cheesecake with a graham cracker crust.', '70', 'dessert'),
('10', 'drink1', 'Fruit Smoothie', 'Smoothie made with fresh fruit.', '25', 'drink'),
('10', 'drink2', 'Sparkling Water', 'Carbonated water with a hint of lemon.', '20', 'drink'),
('10', 'drink3', 'Iced Tea', 'Chilled tea with lemon.', '18', 'drink'),
('10', 'drink4', 'Herbal Tea', 'Caffeine-free herbal tea.', '18', 'drink'),
('10', 'drink5', 'Hot Chocolate', 'Warm hot chocolate with whipped cream.', '20', 'drink'),
('10', 'drink6', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),

-- Insert data for Menu 11
('11', 'salad1', 'Roasted Beet Salad', 'Salad with roasted beets, goat cheese, and walnuts.', '55', 'salad'),
('11', 'salad2', 'Greek Salad', 'Salad with feta cheese, olives, and cucumbers.', '50', 'salad'),
('11', 'salad3', 'Spinach Salad', 'Spinach salad with strawberries and walnuts.', '55', 'salad'),
('11', 'salad4', 'Tomato Basil Salad', 'Salad with ripe tomatoes and fresh basil.', '45', 'salad'),
('11', 'salad5', 'Garden Salad', 'Simple salad with mixed greens and a vinaigrette.', '45', 'salad'),
('11', 'salad6', 'Mediterranean Quinoa Salad', 'Salad with quinoa, olives, and feta cheese.', '50', 'salad'),
('11', 'salad7', 'Cucumber Salad', 'Cucumber salad with dill and yogurt dressing.', '45', 'salad'),
('11', 'salad8', 'Avocado Salad', 'Salad with avocado, tomatoes, and onions.', '55', 'salad'),
('11', 'main1', 'Chicken Tikka Masala', 'Chicken cooked in a spicy masala sauce.', '150', 'main dish'),
('11', 'main2', 'Vegetable Stir-Fry', 'Stir-fried vegetables with rice.', '115', 'main dish'),
('11', 'main3', 'Beef Stroganoff', 'Beef with a creamy mushroom sauce served over noodles.', '130', 'main dish'),
('11', 'main4', 'Pasta Primavera', 'Pasta with fresh vegetables and a light sauce.', '120', 'main dish'),
('11', 'main5', 'Grilled Lamb Chops', 'Lamb chops grilled with rosemary.', '160', 'main dish'),
('11', 'main6', 'Pulled Pork Tacos', 'Tacos with pulled pork and spicy sauce.', '140', 'main dish'),
('11', 'main7', 'Seafood Pasta', 'Pasta with a mix of seafood in a light sauce.', '150', 'main dish'),
('11', 'main8', 'Chicken Parmesan', 'Breaded chicken with marinara sauce and melted cheese.', '140', 'main dish'),
('11', 'main9', 'Vegetable Lasagna', 'Lasagna with layers of vegetables and cheese.', '130', 'main dish'),
('11', 'main10', 'BBQ Chicken', 'Grilled BBQ chicken with a side of coleslaw.', '140', 'main dish'),
('11', 'main11', 'Beef Tacos', 'Tacos with seasoned beef and fresh toppings.', '110', 'main dish'),
('11', 'dessert1', 'Cheesecake', 'Rich and creamy cheesecake with a graham cracker crust.', '70', 'dessert'),
('11', 'dessert2', 'Chocolate Mousse', 'Rich chocolate mousse with whipped cream.', '65', 'dessert'),
('11', 'dessert3', 'Baklava', 'Sweet pastry with nuts and honey.', '60', 'dessert'),
('11', 'dessert4', 'Apple Crisp', 'Warm apple crisp with a crumbly topping.', '60', 'dessert'),
('11', 'dessert5', 'Panna Cotta', 'Vanilla custard with a berry sauce.', '60', 'dessert'),
('11', 'dessert6', 'Fruit Salad', 'Fresh fruit salad with a honey-lime dressing.', '55', 'dessert'),
('11', 'dessert7', 'Lemon Bars', 'Sweet and tangy lemon bars.', '55', 'dessert'),
('11', 'drink1', 'Herbal Tea', 'Caffeine-free herbal tea.', '18', 'drink'),
('11', 'drink2', 'Iced Coffee', 'Cold brewed coffee served over ice.', '22', 'drink'),
('11', 'drink3', 'Fruit Smoothie', 'Smoothie made with fresh fruit.', '25', 'drink'),
('11', 'drink4', 'Cold Brew Coffee', 'Smooth cold brew coffee.', '22', 'drink'),
('11', 'drink5', 'Sparkling Water', 'Carbonated water with a hint of lemon.', '20', 'drink'),
('11', 'drink6', 'Lemonade', 'Refreshing lemonade made from fresh lemons.', '20', 'drink');





-- Insert data into additions
INSERT INTO additions (addition_id, addition_name) VALUES
-- Salad additions
('A001', 'Extra Dressing'),
('A002', 'Cheese'),
('A003', 'Croutons'),
('A004', 'Nuts'),
('A005', 'Olives'),
('A006', 'Bacon'),
('A007', 'Avocado'),
('A008', 'Chicken'),

-- Main Dish additions
('A009', 'Fries'),
('A010', 'Onions'),
('A011', 'Garlic Bread'),
('A012', 'Extra Cheese'),
('A013', 'Gravy'),
('A014', 'Side Salad'),
('A015', 'Mashed Potatoes'),
('A016', 'Rice'),

-- Dessert additions
('A017', 'Whipped Cream'),
('A018', 'Fruit Toppings'),
('A019', 'Chocolate Sauce'),
('A020', 'Ice Cream'),
('A021', 'Nuts'),

-- Drink size options
('A022', 'Small'),
('A023', 'Medium'),
('A024', 'Large'),
('A025', 'Extra Large');




-- Insert data into users

-- Restaurants
INSERT INTO restaurants (id, user_name, password, is_logged_in, user_type, home_branch, restaurant_name, menu_id, phone_number, email) VALUES
('R001', 'r1', 'r1', '0', 'restaurant', '1', 'BBQ Haven', '1', '1234567890', 'bbq.haven@example.com'),
('R002', 'rest_sushi', 'password456', '0', 'restaurant', '2', 'Sushi World', '2', '2345678901', 'sushi.world@example.com'),
('R003', 'rest_pasta', 'password789', '0', 'restaurant', '3', 'Pasta Palace', '3', '3456789012', 'pasta.palace@example.com'),
('R004', 'rest_burger', 'password123', '0', 'restaurant', '1', 'Burger Town', '4', '4567890123', 'burger.town@example.com'),
('R005', 'rest_mexican', 'password456', '0', 'restaurant', '2', 'Mexican Fiesta', '5', '5678901234', 'mexican.fiesta@example.com'),
('R006', 'rest_indian', 'password789', '0', 'restaurant', '3', 'Indian Spice', '6', '6789012345', 'indian.spice@example.com'),
('R007', 'rest_vegan', 'password123', '0', 'restaurant', '1', 'Vegan Delight', '7', '7890123456', 'vegan.delight@example.com'),
('R008', 'rest_diner', 'password456', '0', 'restaurant', '2', 'Diner Deluxe', '8', '8901234567', 'diner.deluxe@example.com'),
('R009', 'rest_seafood', 'password789', '0', 'restaurant', '3', 'Seafood Central', '9', '9012345678', 'seafood.central@example.com'),
('R010', 'rest_pizza', 'password123', '0', 'restaurant', '1', 'Pizza Palace', '10', '0123456789', 'pizza.palace@example.com'),
('R011', 'rest_grill', 'password456', '0', 'restaurant', '2', 'Grill Master', '11', '1234567890', 'grill.master@example.com');



-- Certified Workers
INSERT INTO certified_workers (id, user_name, password, is_logged_in, user_type, home_branch, first_name, last_name, phone_number, email, restaurant_id) VALUES
('CW001', 'cw1', 'cw1', '0', 'certified_worker', '1', 'John', 'Doe', '1234567890', 'john.doe@example.com', 'R001'),
('CW002', 'cw_jane', 'password456', '0', 'certified_worker', '2', 'Jane', 'Smith', '2345678901', 'jane.smith@example.com', 'R002'),
('CW003', 'cw_bob', 'password789', '0', 'certified_worker', '3', 'Bob', 'Brown', '3456789012', 'bob.brown@example.com', 'R003');

-- Branch Managers
INSERT INTO branch_managers (id, user_name, password, is_logged_in, user_type, home_branch, first_name, last_name, phone_number, email) VALUES
('BM001', 'bm1', 'bm1', '0', 'branch_manager', '1', 'Alice', 'Johnson', '4567890123', 'alice.johnson@example.com'),
('BM002', 'bm_eve', 'password456', '0', 'branch_manager', '2', 'Eve', 'Davis', '5678901234', 'eve.davis@example.com'),
('BM003', 'bm_charlie', 'password789', '0', 'branch_manager', '3', 'Charlie', 'Wilson', '6789012345', 'charlie.wilson@example.com');

-- CEOs
INSERT INTO ceos (id, user_name, password, is_logged_in, user_type, home_branch, first_name, last_name, phone_number, email) VALUES
('CEO001', 'ceo1', 'ceo1', '0', 'ceo', '1', 'Mike', 'Wilson', '7890123456', 'mike.wilson@example.com'),
('CEO002', 'ceo_lisa', 'password456', '0', 'ceo', '2', 'Lisa', 'Taylor', '8901234567', 'lisa.taylor@example.com'),
('CEO003', 'ceo_susan', 'password789', '0', 'ceo', '3', 'Susan', 'Miller', '9012345678', 'susan.miller@example.com');

-- Private Customers
INSERT INTO private_customers (id, user_name, password, is_logged_in, user_type, home_branch, first_name, last_name, phone_number, email, credit_card_number, credit_card_cvv, credit_card_month, credit_card_year, is_eligible_for_refund) VALUES
('PC001', 'c1', 'c1', '0', 'customer', '1', 'Anna', 'Green', '1234567890', 'anna.green@example.com', '4111111111111111', '123', '12', '2025', '0'),
('PC002', 'pc_james', 'password456', '0', 'customer', '2', 'James', 'White', '2345678901', 'james.white@example.com', '4222222222222222', '456', '07', '2024', '0'),
('PC003', 'pc_emily', 'password789', '0', 'customer', '3', 'Emily', 'Clark', '3456789012', 'emily.clark@example.com', '4333333333333333', '789', '11', '2023', '0');

-- Business Customers
INSERT INTO business_customers (id, user_name, password, is_logged_in, user_type, home_branch, first_name, last_name, phone_number, email, is_eligible_for_refund) VALUES
('BC001', 'c2', 'c2', '0', 'customer', '1', 'Acme Corp', 'Business', '4567890123', 'acme@business.com', '0'),
('BC002', 'bc_futura', 'password456', '0', 'customer', '2', 'Futura Inc', 'Business', '5678901234', 'futura@business.com', '0'),
('BC003', 'bc_techco', 'password789', '0', 'customer', '3', 'TechCo Ltd', 'Business', '6789012345', 'techco@business.com', '0');



-- Insert data into category
INSERT INTO category (category) VALUES
-- category
('salad'),
('main dish'),
('dessert'),
('drink');





-- Insert data into category_additions
INSERT INTO category_additions (category, addition_id) VALUES
-- Salad additions
('salad', 'A001'),
('salad', 'A002'),
('salad', 'A003'),
('salad', 'A004'),
('salad', 'A005'),
('salad', 'A006'),
('salad', 'A007'),
('salad', 'A008'),

-- Main Dish additions
('main dish', 'A009'),
('main dish', 'A010'),
('main dish', 'A011'),
('main dish', 'A012'),
('main dish', 'A013'),
('main dish', 'A014'),
('main dish', 'A015'),
('main dish', 'A016'),

-- Dessert additions
('dessert', 'A017'),
('dessert', 'A018'),
('dessert', 'A019'),
('dessert', 'A020'),
('dessert', 'A021'),

-- Drink size options
('drink', 'A022'),
('drink', 'A023'),
('drink', 'A024'),
('drink', 'A025');



-- Insert data into orders for each restaurant with new columns
INSERT INTO orders (order_id, restaurant_id, user_id, date, start_time, arrival_time, price, total_price, restaurant_confirmed, customer_confirmed, is_ready, is_late, order_type, order_receiving_method) VALUES
-- Orders for restaurant R001
('O001', 'R001', 'PC001', '2024-01-01', '12:00', '12:30', '15.99', '15.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O002', 'R001', 'PC002', '2024-01-02', '13:00', '13:30', '17.49', '17.49', '0', '0', '0', '0', 'early', 'delivery'),
('O003', 'R001', 'PC003', '2024-01-03', '14:00', '14:30', '12.99', '12.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O004', 'R001', 'PC001', '2024-01-04', '15:00', '15:30', '14.99', '14.99', '0', '0', '0', '0', 'early', 'delivery'),
('O005', 'R001', 'PC002', '2024-01-05', '16:00', '16:30', '13.49', '13.49', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R002
('O006', 'R002', 'PC003', '2024-02-01', '12:00', '12:30', '9.99', '9.99', '0', '0', '0', '0', 'early', 'delivery'),
('O007', 'R002', 'PC001', '2024-02-02', '13:00', '13:30', '11.49', '11.49', '0', '0', '0', '0', 'normal', 'pick up'),
('O008', 'R002', 'PC002', '2024-02-03', '14:00', '14:30', '12.99', '12.99', '0', '0', '0', '0', 'early', 'delivery'),
('O009', 'R002', 'PC003', '2024-02-04', '15:00', '15:30', '8.99', '8.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O010', 'R002', 'PC001', '2024-02-05', '16:00', '16:30', '10.49', '10.49', '0', '0', '0', '0', 'early', 'delivery'),

-- Orders for restaurant R003
('O011', 'R003', 'PC002', '2024-03-01', '12:00', '12:30', '11.99', '11.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O012', 'R003', 'PC003', '2024-03-02', '13:00', '13:30', '13.49', '13.49', '0', '0', '0', '0', 'early', 'delivery'),
('O013', 'R003', 'PC001', '2024-03-03', '14:00', '14:30', '10.99', '10.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O014', 'R003', 'PC002', '2024-03-04', '15:00', '15:30', '9.99', '9.99', '0', '0', '0', '0', 'early', 'delivery'),
('O015', 'R003', 'PC003', '2024-03-05', '16:00', '16:30', '12.49', '12.49', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R004
('O016', 'R004', 'PC001', '2024-04-01', '12:00', '12:30', '8.99', '8.99', '0', '0', '0', '0', 'early', 'delivery'),
('O017', 'R004', 'PC002', '2024-04-02', '13:00', '13:30', '9.99', '9.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O018', 'R004', 'PC003', '2024-04-03', '14:00', '14:30', '7.99', '7.99', '0', '0', '0', '0', 'early', 'delivery'),
('O019', 'R004', 'PC001', '2024-04-04', '15:00', '15:30', '6.99', '6.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O020', 'R004', 'PC002', '2024-04-05', '16:00', '16:30', '8.49', '8.49', '0', '0', '0', '0', 'early', 'delivery'),

-- Orders for restaurant R005
('O021', 'R005', 'PC003', '2024-05-01', '12:00', '12:30', '10.99', '10.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O022', 'R005', 'PC001', '2024-05-02', '13:00', '13:30', '11.49', '11.49', '0', '0', '0', '0', 'early', 'delivery'),
('O023', 'R005', 'PC002', '2024-05-03', '14:00', '14:30', '12.99', '12.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O024', 'R005', 'PC003', '2024-05-04', '15:00', '15:30', '9.99', '9.99', '0', '0', '0', '0', 'early', 'delivery'),
('O025', 'R005', 'PC001', '2024-05-05', '16:00', '16:30', '8.99', '8.99', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R006
('O026', 'R006', 'PC002', '2024-06-01', '12:00', '12:30', '11.99', '11.99', '0', '0', '0', '0', 'early', 'delivery'),
('O027', 'R006', 'PC003', '2024-06-02', '13:00', '13:30', '13.49', '13.49', '0', '0', '0', '0', 'normal', 'pick up'),
('O028', 'R006', 'PC001', '2024-06-03', '14:00', '14:30', '10.99', '10.99', '0', '0', '0', '0', 'early', 'delivery'),
('O029', 'R006', 'PC002', '2024-06-04', '15:00', '15:30', '9.99', '9.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O030', 'R006', 'PC003', '2024-06-05', '16:00', '16:30', '12.49', '12.49', '0', '0', '0', '0', 'early', 'delivery'),

-- Orders for restaurant R007
('O031', 'R007', 'PC001', '2024-07-01', '12:00', '12:30', '7.99', '7.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O032', 'R007', 'PC002', '2024-07-02', '13:00', '13:30', '9.49', '9.49', '0', '0', '0', '0', 'early', 'delivery'),
('O033', 'R007', 'PC003', '2024-07-03', '14:00', '14:30', '11.99', '11.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O034', 'R007', 'PC001', '2024-07-04', '15:00', '15:30', '8.99', '8.99', '0', '0', '0', '0', 'early', 'delivery'),
('O035', 'R007', 'PC002', '2024-07-05', '16:00', '16:30', '10.49', '10.49', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R008
('O036', 'R008', 'PC003', '2024-08-01', '12:00', '12:30', '12.99', '12.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O037', 'R008', 'PC001', '2024-08-02', '13:00', '13:30', '14.49', '14.49', '0', '0', '0', '0', 'early', 'delivery'),
('O038', 'R008', 'PC002', '2024-08-03', '14:00', '14:30', '13.99', '13.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O039', 'R008', 'PC003', '2024-08-04', '15:00', '15:30', '9.99', '9.99', '0', '0', '0', '0', 'early', 'delivery'),
('O040', 'R008', 'PC001', '2024-08-05', '16:00', '16:30', '11.49', '11.49', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R009
('O041', 'R009', 'PC002', '2024-09-01', '12:00', '12:30', '10.99', '10.99', '0', '0', '0', '0', 'early', 'delivery'),
('O042', 'R009', 'PC003', '2024-09-02', '13:00', '13:30', '12.49', '12.49', '0', '0', '0', '0', 'normal', 'pick up'),
('O043', 'R009', 'PC001', '2024-09-03', '14:00', '14:30', '11.99', '11.99', '0', '0', '0', '0', 'early', 'delivery'),
('O044', 'R009', 'PC002', '2024-09-04', '15:00', '15:30', '8.99', '8.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O045', 'R009', 'PC003', '2024-09-05', '16:00', '16:30', '9.49', '9.49', '0', '0', '0', '0', 'early', 'delivery'),

-- Orders for restaurant R010
('O046', 'R010', 'PC001', '2024-10-01', '12:00', '12:30', '9.99', '9.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O047', 'R010', 'PC002', '2024-10-02', '13:00', '13:30', '11.49', '11.49', '0', '0', '0', '0', 'early', 'delivery'),
('O048', 'R010', 'PC003', '2024-10-03', '14:00', '14:30', '12.99', '12.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O049', 'R010', 'PC001', '2024-10-04', '15:00', '15:30', '10.49', '10.49', '0', '0', '0', '0', 'early', 'delivery'),
('O050', 'R010', 'PC002', '2024-10-05', '16:00', '16:30', '8.99', '8.99', '0', '0', '0', '0', 'normal', 'pick up'),

-- Orders for restaurant R011
('O051', 'R011', 'PC003', '2024-11-01', '12:00', '12:30', '11.49', '11.49', '0', '0', '0', '0', 'early', 'delivery'),
('O052', 'R011', 'PC001', '2024-11-02', '13:00', '13:30', '12.99', '12.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O053', 'R011', 'PC002', '2024-11-03', '14:00', '14:30', '10.99', '10.99', '0', '0', '0', '0', 'early', 'delivery'),
('O054', 'R011', 'PC003', '2024-11-04', '15:00', '15:30', '9.99', '9.99', '0', '0', '0', '0', 'normal', 'pick up'),
('O055', 'R011', 'PC001', '2024-11-05', '16:00', '16:30', '8.49', '8.49', '0', '0', '0', '0', 'early', 'delivery');









-- --------------- -- ----------------------------------------------------------------------------------------- --
-- Creating Schema -- biteme_usermanagement contains all the external users data for registering for the system --
-- --------------- -- ----------------------------------------------------------------------------------------- --






-- Create a new schema
CREATE SCHEMA biteme_usermanagement;

-- Use the new schema
USE biteme_usermanagement;

-- Create the `users` table
CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    user_type VARCHAR(255)
);



-- Insert data into users table from restaurants
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('R001', 'BBQ Haven', NULL, 'bbq.haven@example.com', '1234567890', 'restaurant'),
    ('R002', 'Sushi World', NULL, 'sushi.world@example.com', '2345678901', 'restaurant'),
    ('R003', 'Pasta Palace', NULL, 'pasta.palace@example.com', '3456789012', 'restaurant'),
    ('R004', 'Burger Town', NULL, 'burger.town@example.com', '4567890123', 'restaurant'),
    ('R005', 'Mexican Fiesta', NULL, 'mexican.fiesta@example.com', '5678901234', 'restaurant'),
    ('R006', 'Indian Spice', NULL, 'indian.spice@example.com', '6789012345', 'restaurant'),
    ('R007', 'Vegan Delight', NULL, 'vegan.delight@example.com', '7890123456', 'restaurant'),
    ('R008', 'Diner Deluxe', NULL, 'diner.deluxe@example.com', '8901234567', 'restaurant'),
    ('R009', 'Seafood Central', NULL, 'seafood.central@example.com', '9012345678', 'restaurant'),
    ('R010', 'Pizza Palace', NULL, 'pizza.palace@example.com', '0123456789', 'restaurant'),
    ('R011', 'Grill Master', NULL, 'grill.master@example.com', '1234567890', 'restaurant');

-- Insert data into users table from certified_workers
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('CW001', 'John', 'Doe', 'john.doe@example.com', '1234567890', 'certified_worker'),
    ('CW002', 'Jane', 'Smith', 'jane.smith@example.com', '2345678901', 'certified_worker'),
    ('CW003', 'Bob', 'Brown', 'bob.brown@example.com', '3456789012', 'certified_worker');

-- Insert data into users table from branch_managers
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('BM001', 'Alice', 'Johnson', 'alice.johnson@example.com', '4567890123', 'branch_manager'),
    ('BM002', 'Eve', 'Davis', 'eve.davis@example.com', '5678901234', 'branch_manager'),
    ('BM003', 'Charlie', 'Wilson', 'charlie.wilson@example.com', '6789012345', 'branch_manager');

-- Insert data into users table from ceos
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('CEO001', 'Mike', 'Wilson', 'mike.wilson@example.com', '7890123456', 'ceo'),
    ('CEO002', 'Lisa', 'Taylor', 'lisa.taylor@example.com', '8901234567', 'ceo'),
    ('CEO003', 'Susan', 'Miller', 'susan.miller@example.com', '9012345678', 'ceo');

-- Insert additional data into users table from private_customers
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('PC001', 'Anna', 'Green', 'anna.green@example.com', '1234567890', 'customer'),
    ('PC002', 'James', 'White', 'james.white@example.com', '2345678901', 'customer'),
    ('PC003', 'Emily', 'Clark', 'emily.clark@example.com', '3456789012', 'customer'),
    ('PC004', 'Michael', 'Johnson', 'michael.johnson@example.com', '4567890123', 'customer'),
    ('PC005', 'Sarah', 'Williams', 'sarah.williams@example.com', '5678901234', 'customer'),
    ('PC006', 'David', 'Brown', 'david.brown@example.com', '6789012345', 'customer'),
    ('PC007', 'Laura', 'Jones', 'laura.jones@example.com', '7890123456', 'customer'),
    ('PC008', 'Robert', 'Miller', 'robert.miller@example.com', '8901234567', 'customer'),
    ('PC009', 'Jessica', 'Davis', 'jessica.davis@example.com', '9012345678', 'customer'),
    ('PC010', 'Daniel', 'Garcia', 'daniel.garcia@example.com', '0123456789', 'customer'),
    ('PC011', 'Emily', 'Martinez', 'emily.martinez@example.com', '1234567890', 'customer'),
    ('PC012', 'Matthew', 'Hernandez', 'matthew.hernandez@example.com', '2345678901', 'customer');

-- Insert data into users table from business_customers
INSERT INTO users (id, first_name, last_name, email, phone_number, user_type)
VALUES
    ('BC001', 'Acme Corp', NULL, 'acme@business.com', '4567890123', 'customer'),
    ('BC002', 'Futura Inc', NULL, 'futura@business.com', '5678901234', 'customer'),
    ('BC003', 'TechCo Ltd', NULL, 'techco@business.com', '6789012345', 'customer');

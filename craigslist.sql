-- regions
CREATE TABLE Regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255),
    description TEXT
);

-- users 
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    preferred_region_id INT,
    password VARCHAR(255),
    FOREIGN KEY (preferred_region_id) REFERENCES Regions(region_id)
);

-- posts
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    title VARCHAR(255),
    text TEXT,
    user_id INT,
    location VARCHAR(255),
    region_id INT,
    posting_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

-- categories 
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT
);

-- post categories 
CREATE TABLE PostCategories (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- data 

-- Insert a region
INSERT INTO Regions (region_id, region_name, description) VALUES (1, 'San Francisco', 'The Bay Area');

-- Insert a user
INSERT INTO Users (user_id, username, email, preferred_region_id, password) VALUES (1, 'user123', 'user@example.com', 1, 'password123');

-- Create a post and associate it with a user and a region
INSERT INTO Posts (post_id, title, text, user_id, location, region_id, posting_date) VALUES (1, 'Selling Furniture', 'Good condition furniture for sale.', 1, 'San Francisco, CA', 1, '2023-01-15');

-- Add categories to the post
INSERT INTO PostCategories (post_id, category_id) VALUES (1, 1); -- Assuming 'Furniture' has a corresponding category_id in the Categories table.

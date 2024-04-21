#!/bin/bash

# Define variables for configuration settings
GITHUB_REPO="https://github.com/50000000000000000000000/TODO-Application.git"
MYSQL_ROOT_PASSWORD="your_root_password"  # Change this to your desired root password
MYSQL_DB="todo"
MYSQL_USER="passertech"
MYSQL_PASSWORD="passertech"  # Updated MySQL user password
APACHE_ROOT="/var/www/html"

# Update system repositories and upgrade existing packages
echo "Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install Apache2, MySQL, PHP, and required PHP extensions
echo "Installing Apache2, MySQL, PHP, and required PHP extensions..."
sudo apt-get install apache2 mysql-server php php-mysql libapache2-mod-php php-cli php-cgi -y

# Enable Apache mod_rewrite
echo "Enabling Apache mod_rewrite..."
sudo a2enmod rewrite
sudo systemctl restart apache2

# Secure MySQL installation automatically
echo "Securing MySQL installation..."
sudo mysql_secure_installation <<EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
EOF

# Clone the PHP application from GitHub
echo "Cloning the PHP application from GitHub to Apache root directory..."
sudo git clone $GITHUB_REPO $APACHE_ROOT/todo-app

# Set ownership and correct file permissions
echo "Setting ownership and permissions..."
sudo chown -R www-data:www-data $APACHE_ROOT/todo-app
sudo find $APACHE_ROOT/todo-app/ -type d -exec chmod 755 {} \;
sudo find $APACHE_ROOT/todo-app/ -type f -exec chmod 644 {} \;

# Configure MySQL database
echo "Configuring MySQL database..."
sudo mysql -u root -p$MYSQL_ROOT_PASSWORD <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
USE $MYSQL_DB;
SOURCE $APACHE_ROOT/todo-app/create_database.sql;
MYSQL_SCRIPT

echo "Restarting Apache to apply changes..."
sudo systemctl restart apache2

# Display setup complete message
echo "Setup complete. Your PHP application is now available at http://localhost/todo-app"

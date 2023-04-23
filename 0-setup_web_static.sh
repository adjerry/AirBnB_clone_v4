#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static
# Install Nginx if it not already installed
if [ ! -x /usr/sbin/nginx ]
then
	sudo apt-get -y update
	sudo apt-get -y install nginx
fi
# Create the folders
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
# Create a fake HTML file
touch /data/web_static/releases/test/index.html
echo "<html>
<head>
</head>
<body>
<h1>Testing Nginx configuration <h1>
</body>
</html>" > /data/web_static/releases/test/index.html
# Create a symbolic link /data/web_static/current linked to the /data/web_static/releases/test/ folder
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
# Give ownership of the /data/ folder to the ubuntu user AND group
sudo chown -R ubuntu:ubuntu /data
sudo chmod -R 755 /data/
# Update the Nginx configuration to serve the content of /data/web_static/current/ to hbnb_static
sudo sed -i '48 i \\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
# Restart nginx
sudo service nginx restart

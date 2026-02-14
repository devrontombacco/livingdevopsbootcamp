# Simple static flask app - Portfolio

A personal portfolio website deployed on AWS infrastructure, served via Nginx, secured with SSL, and accessible via a custom domain.

Live site: https://devron.cloud

## Accomplishments

Each step in this project was an accomplishment for me. I learned a lot of valuable lessons. See below for more.

### 1. Launched a configured an Amazon Linux server on an EC2 instance

Created following resources in AWS clickops style:

- VPC
- IGW
- Subnet
- SG allowing http/ https/ icmp / ssh traffic
- route table
- ec2, with Amazon Linux

See screenshot of compute instance
![Screenshot](/Class4_aws_networking_hands_on_assignment/Week2/Day2+3/ec2.png)

### 2. Used Python to create environment and then ClaudeAI to build a static portfolio site, grabbing info from github, linkedin and personal website

Doing this project I learned about commands like:

- Create venv: `python3 -m venv venv`
- Activate it: `source venv/bin/activate`
- Install Flask locally: `pip install flask`

I also ClaudeAi to:

- create app.py: containing html + inline
- grabbed data from online sources

### 3. Installed and configured Nginx on Amazon Linux to serve site

I learned many nginx commands and concepts doing this project, such as:

- Checking if Nginx is running: `sudo systemctl status nginx`
- Starting it if needed: `sudo systemctl start nginx`
- Enabling it to start on boot: `sudo systemctl enable nginx`
- Using `hostname -I` to find server's ip and check it's running on `http://localhost` or `http://your-server-ip`
- learning about **contexts** and **directives**
- learning that website code is stored in /var/www/html
- learning that nginx code is found in nginx.conf inside /etc/nginx

### 4. Pointed my domain at my server using Route53

- I purchased a domain on namecheap
- I pointed the AWS nameservers at my domain in my domain registrar
- I created a hosted zone in Route53
- I created an A record for devron.cloud

![Screenshot](/Class4_aws_networking_hands_on_assignment/Week2/Day2+3/domain.png)

### 5. Secured it with a free SSL certificate via Certbot and Let's Encrypt

- I learned about the importance of SSL certificates for providing HTTPS connections.
- A Certificate Authority verifies the domain owner's identity and that they own the domain
- They provide the server an SSL cert, proving their authenticity
- Your browser connects to this website, gets the ssl, and checks the signature is correct
- I used Certbot to get a free certificate via Let's Encrypt
- I then had to ensure this ssl was properly added to nginx so that https connections could be established

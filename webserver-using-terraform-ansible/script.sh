#!/bin/bash

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#skills">Skills</a></li>
                <li><a href="#projects">Projects</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="home">
            <h1>Welcome to My Portfolio</h1>
            <p>Hi, I'm Akash Shendkar. I'm a Student based in Pune.</p>
        </section>

        <section id="about">
            <h2>About Me</h2>
            <p>Hello Everyone 
            I am Unique Akash, finding my way in DevOps. I like to solve the problems,read the books.</p>
        </section>

        <section id="skills">
            <h2>My Skills</h2>
            <ul>
                <li>AWS Cloud</li>
                <li>Terraform-IAC</li>
                <li>Git</li>
                <li>Kubernetes</li>
                <li>Docker</li>
            </ul>
        </section>

        <section id="projects">
            <h2>My Projects</h2>
            <div class="project">
                <h3>Web Application</h3>
                <p>My first project is based on Aws cloud where I deployed my web application using aws console using EC2, Rds, S3, Route 53.</p>
            </div>
            <div class="project">
                <h3>High Availability</h3>
                <p>I created a load balancing and auto scaling of my web application using ELB and EC2 auto scaling groups.</p>
            </div>
            <div class="project">
                <h3>Terraform</h3>
                <p>In this project I used terraform, Using terraform as IAC I deployed my application in AWS</p>
            </div>
        </section>

        <section id="contact">
            <h2>Contact Me</h2>
            <p>Email: akashshendkar3@gmail.com</p>
            <p>Phone: 9834340327</p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Akash Shendkar. All rights reserved.</p>
    </footer>
</body>
</html>
EOF


cat <<EOF > /var/www/html/styles.css
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
}

header {
    background-color: #f4f4f4;
    padding: 20px;
}

nav ul {
    list-style: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 10px;
}

nav ul li a {
    text-decoration: none;
    color: #333;
}

section {
    padding: 20px;
}

h1, h2, h3 {
    color: #444;
}

.project {
    margin-bottom: 20px;
}

footer {
    background-color: #f4f4f4;
    padding: 20px;
    text-align: center;
}
EOF
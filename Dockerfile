# Use the Moodle base image
FROM moodlehq/moodle-php-apache:8.1

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs

# Install Grunt globally
RUN npm install -g grunt-cli

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory to Moodle source
WORKDIR /var/www/html

# Start with a base image known to have outdated packages
FROM python:2.7-slim

# Install some outdated, vulnerable Python packages
RUN pip install --no-cache-dir Flask==0.10.1
RUN pip install --no-cache-dir requests==2.6.0
RUN pip install --no-cache-dir SQLAlchemy==1.1.0

# Install a vulnerable version of OpenSSL
RUN apt-get update && apt-get install -y openssl=1.0.1f-1ubuntu2.27

# Vulnerable package: Ghostscript (known vulnerabilities)
RUN apt-get install -y ghostscript=9.06~dfsg-0.2

# Copy application files
WORKDIR /app
COPY . .

# Set environment variable for the app
ENV APP_ENV=production

# Run the app (simplified example)
CMD ["python", "app.py"]

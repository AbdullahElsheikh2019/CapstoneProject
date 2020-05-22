FROM php:5.6-apache
LABEL maintainer Abdullah Elsheikh <abdullahelsheikh@gmail.com>
## Step 1:
# Create a working directory

WORKDIR /app
## Step 2:
# Copy source code to working directory
COPY . app.py /app/
#COPY index.html /var/www/
#COPY index.html /var/www/html/
## Step 2:
# Copy source code to working directory
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#RUN pip install --upgrade pip &&\
#    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80
## Step 5:
# Run app.py at container launch
#CMD ["python", "app.py"]

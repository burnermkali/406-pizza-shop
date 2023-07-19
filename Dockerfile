# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Install Python and other dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose the port on which the application runs
EXPOSE 5000

# Run the application
CMD ["panel", "serve", "orderbot.py", "--port", "5000", "--allow-websocket-origin", "localhost:5000"]

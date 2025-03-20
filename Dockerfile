# Use a specific version of Python
FROM python:3.9

# Set the working directory
WORKDIR /data

# Install required packages
RUN apt-get update && apt-get install -y python3-venv

# Install Django
RUN pip install django==3.2

# Copy the current directory contents into the container at /data
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Command to run the application (if needed)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

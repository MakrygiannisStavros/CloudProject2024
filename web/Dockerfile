# base image
FROM python:3.9-slim

# set working directory
WORKDIR /app

# copy application code to working directory
COPY . /app

# install dependencies
RUN pip install -r requirements.txt

# expose port
EXPOSE 8000

# start application
CMD ["python", "app.py"]

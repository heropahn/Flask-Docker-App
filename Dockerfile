# Official Python image recommended for smaller images
FROM python:3.9-slim

WORKDIR /app

COPY . /app

# Install the dependencies from the requirements.txt file
# no chace dir is used to avoid caching the installation of the dependencies - source from the official docker docs
# https://docs.docker.com/guides/use-case/nlp/sentiment-analysis/ 4. Install the Python dependencies in the image
RUN pip install --no-cache-dir -r requirements.txt

# Setting the environment variable for the port
ENV PORT=5000

# Using EXPOSE to expose the port 5000 from docker.docs
# This is only a formality and does not actually expose the port
# Reference: https://docs.docker.com/engine/reference/builder/#expose
# Mentioned by Edric in the discord 
EXPOSE 5000

# Setting the environment variable for the flask app
ENV FLASK_APP=app.py

# Setting the environment variable for the flask app to run in development mode
# Reference: https://flask.palletsprojects.com/en/2.0.x/config/#development
CMD ["flask", "run", "--host=0.0.0.0"]
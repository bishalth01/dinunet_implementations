FROM coinstacteam/coinstac-base:python3.7-buster

# Copy the current directory contents into the container
COPY ./requirements.txt /computation/requirements.txt

# Set the working directory
WORKDIR /computation

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir setuptools
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . /computation

# For dev only
RUN pip install "/computation/dist/$(ls -t1 dist|  head -n 1)"


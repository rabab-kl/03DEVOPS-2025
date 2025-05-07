FROM python:3.11-slim

# Install openssh-server and Poetry
RUN apt update && \
    apt install -y openssh-server && \
    pip install --upgrade pip && \
    pip install poetry

# Configure SSH (user: admin / password: admin)
RUN useradd -m admin && echo "admin:admin" | chpasswd && \
    mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd

# Expose Django (8000) and SSH (22)
EXPOSE 8000 22

# Set working directory and install dependencies
WORKDIR /app
COPY pyproject.toml poetry.lock* ./
RUN poetry config virtualenvs.create false && poetry install --no-root
COPY . .

# Start sshd + Django
CMD [ "bash", "-c", "/usr/sbin/sshd && poetry run python manage.py runserver 0.0.0.0:8000" ]


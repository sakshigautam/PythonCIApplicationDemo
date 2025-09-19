# syntax=docker/dockerfile:1

FROM python:3.8-slim

# Set work directory
WORKDIR /app

# Install system dependencies (if any are needed for requirements.txt)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# If you built your package into dist/, you can also install it like this:
# COPY dist/*.whl .
# RUN pip install --no-cache-dir *.whl

# Default command (update with your actual entrypoint/module)
CMD ["python", "-m", "operations.py"]

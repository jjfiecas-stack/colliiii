# 1. Use the Python base image
FROM python:3.11-slim

# 2. Set the working directory
WORKDIR /app

# 3. Install system dependencies (only if needed)
RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

# 4. COPY your files from the current directory into the container
# This replaces the "git clone" line that failed
COPY . .

# 5. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6. Start the application
# Using the correct path for MediaFlow-Proxy
CMD ["uvicorn", "mediaflow_proxy.main:app", "--host", "0.0.0.0", "--port", "7860"]

FROM python:3.9-alpine3.13

# Maintainer information
LABEL maintainer="basavarajmrk.com"

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app
# Copy requirements and application code
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app


# Expose the port
EXPOSE 8000
ARG DEV=false
# Install dependencies and create a virtual environment
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# Update PATH environment variable
ENV PATH="/py/bin:$PATH"

# Switch to non-root user
USER django-user

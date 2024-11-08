# FROM python:3.9-slim AS build

# RUN apt-get update
# RUN python -m venv /opt/venv
# ENV PATH="/opt/venv/bin:$PATH"

# COPY deployment/requirements.txt .
# RUN pip install -r requirements.txt

# FROM python:3.9-slim

# # RUN apt-get update && \
# #   apt-get install -y --no-install-recommends \
# #     openjdk-11-jre-headless && \
# #   apt-get autoremove -yqq --purge && \
# #   apt-get clean && \
# #   rm -rf /var/lib/apt/lists/*
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     openjdk-17-jre-headless && \
#     apt-get autoremove -yqq --purge && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*


# ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# COPY --from=build /opt/venv /opt/venv
# ENV PATH="/opt/venv/bin:$PATH"

# COPY . /data_pipeline
# WORKDIR /data_pipeline



#--------------------------------------------------------------------------

FROM python:3.9-slim AS build

# Cài đặt môi trường ảo
RUN apt-get update
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy file requirements.txt
WORKDIR /app
COPY deployment/requirements.txt .
RUN /opt/venv/bin/python -m pip install --upgrade pip
RUN /opt/venv/bin/python -m pip install -r requirements.txt

# Stage 2
FROM python:3.9-slim

# Cài đặt OpenJDK
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-17-jre-headless && \
    apt-get autoremove -yqq --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Thiết lập biến môi trường Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Copy môi trường ảo từ tầng build
COPY --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy toàn bộ project
WORKDIR /data_pipeline
COPY . .

CMD ["python", "main.py"]  # Thay main.py bằng file entrypoint của bạn

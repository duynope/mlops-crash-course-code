FROM python:3.9-slim AS build

# Cập nhật và cài đặt các phụ thuộc cần thiết
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Tạo môi trường ảo
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Sao chép file yêu cầu và cài đặt các thư viện
COPY deployment/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Bắt đầu giai đoạn chạyS
FROM python:3.9-slim

# Sao chép môi trường ảo từ giai đoạn xây dựng
COPY --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Sao chép mã nguồn và thiết lập thư mục làm việc
COPY . /monitoring_service
WORKDIR /monitoring_service

# Khai báo lệnh để chạy ứng dụng
CMD ["python", "src/monitoring_service.py"]

FROM python:3.9-slim

# copy code, data and dependencies
COPY stream_emitting.py stream_emitting.py
COPY data/driver_stats_stream.parquet data/driver_stats_stream.parquet
COPY dev_requirements.txt requirements.txt

# # install dependencies
# RUN pip install -r requirements.txt
# Install dependencies
RUN echo "Đang cài đặt các thư viện từ requirements.txt" && \
    pip install -r requirements.txt
CMD python stream_emitting.py \
    --bootstrap_servers ${BOOTSTRAP_SERVERS} \
    --data ${DATA}

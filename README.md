# mlops-crash-course-code

# Data pipeline
    cd ../stream_emitting
    bash deploy.sh start
    cd ../data_pipeline

    cd feature_repo
    feast apply

    cd feature_repo
    feast materialize-incremental $(date +%Y-%m-%d)

    cd ..
    make build_image
    make deploy_dags # 

# Training pipeline
    export TRAINING_PIPELINE_DIR=$(pwd)
    export MLFLOW_TRACKING_URI="http://localhost:5000"

    cd ../data_pipeline
    make deploy_feature_repo 
    cd ../training_pipeline

    cd feature_repo
    feast apply 
    cd ..
    cd feature_repo
    feast apply # 

    cd ..
    cd src
    python data_extraction.py
    cd ..
    cd src
    python data_validation.py
    cd ..
    cd src
    python data_preparation.py
    cd ..
    cd src
    python model_training.py
    cd ..
    cd src
    python model_evaluation.py
    cd ..
    cd src
    python model_validation.py
    cd ..


    make build_image
    make deploy_dags # 

## Model serving
    export MODEL_SERVING_DIR=$(pwd)
    export MLFLOW_TRACKING_URI="http://localhost:5000"
    cd feature_repo
    feast apply # 

    cd ..
    cd src
    python data_extraction.py
    cd ..

    cd ../training_pipeline
    make deploy_registered_model_file
    cd ../model_serving
    cd src
    python batch_prediction.py
    cd ..
    make build_image
    make deploy_dags # 
    cd feature_repo
    feast apply
    feast materialize-incremental $(date +%Y-%m-%d)
    cd ..



    make build_image
    make compose_up
    Note: data test UI BentoML:
    Copy paste UI Bento

        {
        "request_id": "uuid-1",
        "driver_ids": [1001, 1002, 1003, 1004, 1005]
        }

## Monitoring
    export MONITORING_SERVICE_DIR=$(pwd)
    cd ../data_pipeline
    make deploy_feature_repo # 
    cd ../monitoring_service

    make build_image
    make compose_up


    python src/mock_request.py -d drift -n 5
    python src/mock_request.py -d normal -n 5

## Requirements

```bash
Docker version 27.3.1, build ce12230
Docker Compose version v2.10.2
```

Tested on OS:

-   Ubuntu 20.04
-   MacOS using M1, M2, Intel CPU

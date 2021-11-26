FROM airflow-hive:0.5

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-u", "-x", "-c"]

# Install pytest and jupyterlab
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir jupyterlab pytest

USER ${AIRFLOW_UID}

# directory project (writeable)
# RUN umask 0022;\
# mkdir -pv /opt/airflow/source \
# && mkdir -pv /opt/airflow/data \
# && mkdir -pv /opt/airflow/test \
# && mkdir -pv /opt/airflow/notebook
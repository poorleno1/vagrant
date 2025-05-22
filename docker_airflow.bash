# https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html


sudo mkdir /opt/airflow
cd /opt/airflow
sudo mkdir -p ./dags ./logs ./plugins ./config
sudo chown -R $(whoami) ./dags ./logs ./plugins ./config
sudo chmod -R 777 ./dags ./logs ./plugins ./config
grep -q '^AIRFLOW_UID=' .env || echo 'AIRFLOW_UID=50000' | sudo tee -a .env


sudo curl -LfO 'https://airflow.apache.org/docs/apache-airflow/3.0.1/docker-compose.yaml'

# If you want to initialize airflow.cfg with default values before launching the airflow service, run.
docker compose run airflow-cli airflow config list
sudo sed -i 's/utc/cet/g' /opt/airflow/config/airflow.cfg

#Initialize the database. The account created has the login airflow and the password airflow
docker compose up airflow-init
# this should end with: start_airflow-init_1 exited with code 0

docker compose up -d


# Clean up
# docker compose down --volumes --remove-orphans
echo "Airflow installation completed successfully!"
echo "Access at: https://<your-server-ip>:8080"
echo "Username: airflow and Password: airflow"
docker build --build-arg NODE_ENV=development --build-arg PORT=5000 -t backend-image .
docker run -d --name backend-container -p 5000:5000 --env-file .env backend-image

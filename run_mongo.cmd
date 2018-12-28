REM сомнения в пароле
export CONFIG_SERVICE_PASSWORD=passwd
export NOTIFICATION_SERVICE_PASSWORD=passwd
export STATISTICS_SERVICE_PASSWORD=passwd
export ACCOUNT_SERVICE_PASSWORD=passwd
export ACCOUNT_SERVICE_PASSWORD=passwd
export MONGODB_PASSWORD=passwd


REM подьем только MONGOGO
REM  сделал основной файл и его наследника, как в примере  
REM https://github.com/sqshq/PiggyMetrics#how-to-run-all-the-things
docker-compose -f docker-compose-mongo.yml -f docker-compose-mongo.dev.yml up

sleep 3
docker ps -a | grep claims_db
docker ps
docker inspect claims_db --format='RestartCount: {{.RestartCount}}, Status: {{.State.Status}}'
docker exec claims_db bash -c 'ps aux | head -5'
docker top claims_db
docker exec claims_db bash -c 'kill -9 1 2>&1; echo "RESULT: $?"'
docker exec claims_db bash -c 'kill -9 1; echo SENT'
docker exec claims_db bash -c 'ps aux | head -3' 2>&1
docker down
docker compose down
docker compose up -d
docker ps
docker kill claims_db
docker ps
docker ps -a
docker ps
dockr ps
docker ps
docker ps -a
docker ps
sleep 3
docker ps | grep claims_db
docker inspect claims_db --format='RestartCount: {{.RestartCount}}'
docker ps
docker ps -a
docker inspect claims_db --format='{{json .HostConfig.RestartPolicy}}'
docker compose up -d db
docker inspect claims_db --format='{{json .HostConfig.RestartPolicy}}'
docker kill claims_db
sleep 5
docker ps | grep claims_db
docker inspect claims_db --format='RestartCount: {{.RestartCount}}'
docker system events --since 2m --filter container=claims_db
yml, com.docker.compose.project.working_dir=/home/mun/portfolio/entry/insurance-claims-platform, com.docker.compose.service=db, com.docker.compose.version=5.1.4, execID=48ceddc3223493e93da754d80f6731491716cdf4af64e87bbc3f999302f0
docker ps
docker inspect claims_db --format='{{json .HostConfig.RestartPolicy}}'
docker kill claims_db
docker ps | grep claims_db
docker inspect claims_db --format='RestartCount: {{.RestartCount}}'
docker start claims_db
sleep 3
docker ps | grep claims_db
docker kill claims_db
sleep 5
docker ps | grep claims_db
docker inspect claims_db --format='RestartCount: {{.RestartCount}}'
docker inspect claims_db --format='{{json .HostConfig.RestartPolicy}}'
docker compose down
docker compose up -d --force-recreate
docker inspect claims_db --format='{{json .HostConfig.RestartPolicy}}'
docker ps
docker kill claimbs_Db
docker kill claimbs_db
docker kill claims_db
docker ps
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker ps
docker ps -a
docker ps
docker ps -a
dokcer ps
docker ps
docker ps -a
docker ps
docker ps -a
docker inspect --format='{{json .State}}' claims_db
sudo lsof -i :5432
sudo systemctl disable postgresql
sudo lsof -i :5432
sudo systemctl stop postgresql
sudo lsof -i :5432
docker ps
docker inspect --format='{{json .State}}' claims_db
docker ps
docker compose down
docker compose up -d
docker ps
docker kill claims_db
ls
docker ssp
docker ps
docker inspect --format='{{json .State}}' claims_db
docker ps
docker ps -a
docker inspect --format='{{json .State}}' claims_db
docker ps
docker ps -a
docker inspect --format='{{json .State}}' claims_db
docker ps
docker ps -a
docker inspect --format='{{json .State}}' claims_db
docker inspect --format='{{json .HostConfig.RestartPolicy}}' claims_db
docker inspect --format='{{json .RestartCount}}' claims_db
docker ps
docker ps -a
docker events --since '2026-07-18T04:25:00' --until '2026-07-18T04:35:00'
docker start claims_db
docker ps
wsl --shutdown
ls
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events --since '15m' --filter 'container=claims_db'
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events --since '15m' | grep claims_db
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events --since '5m' | grep claims_db
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events --since '150' | grep claims_db
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
docker events --since '10m' | grep claims_db
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
ls
docker ps
docker events
docker inspect --format='{{json .HostConfig.RestartPolicy}}' claims_db
docker inspect --format='{{json .RestartCount}}' claims_db
docker inspect --format='{{json .RestartCount}}' claims_backend
docker inspect --format='{{json .RestartCount}}' claims_apache
docker inspect --format='{{json .RestartCount}}' claims_db
docker ps -a
docker inspect --format='{{.State.StartedAt}}' claims_db
docker inspect --format='{{json .RestartCount}}' claims_db
docker inspect --format='{{json .State}}' claims_db
docker kill claims_db
docker ps
docker inspect --format='{{.RestartCount}}' claims_db
docker inspect --format='{{.State.Health.Status}}' claims_db
docker inspect --format='{{.HostConfig.RestartPolicy.Name}}' claims_db
docker start claims_db
docker ps
docker exec claims_db kill 1
docker ps
docker exec claims_db bash
kill 1
docker exec claims_db bash kill 1
docker ps
docker ps -a
docker ps
docker ps -a
docker inspect --format='{{.State.Health.Status}}' claims_db
docker inspect --format='{{.RestartCount}}' claims_db
docker logs claims_db --tail 50
docker ps
docker ps -a
docker inspect --format='{{json .RestartCount}}' claims_db
docker ps
docker start claims_db
docker ps
sudo lsof -i :5432
docker ps -a --filter name=claims_db
docker logs claims_db --tail 50
docker logs claims_db 2>&1 | head -100
docker ps
docker start claims_db
docker ps
docker stop claims_db
docker ps
docker start claims_db
docker ps
docker exec claims_db
docker exec claims_db kill 1
docker ps
docker p
docker ps
docker inspect --format='{{.RestartCount}}' claims_db
docker inspect --format='{{json .State}}' claims_db
docker ps
docker logs claims_db 2>&1 | head -100
docker logs claims_db --tail 80
docker ps
docker ps -a
docker exec claims_db ps -ef
docker exec claims_db kill 1
docker ps
docker stop claims_db
docker start claims_db
docker ps
docker exec claims_db kill -9 1
docker ps
docker top claims_db
docker ps
docker p
docker ps

docker ps
docker inspect --format='{{json .RestartCount}}' claims_db
docker inspect --format='{{.State.StartedAt}}' claims_db
docker ps -a --filter name=claims_db
docker exec claims_db ps -ef
docker logs claims_db --tail 30
docker ps
docker kill claims_db
sleep 3
docker inspect --format='{{json .RestartCount}}' claims_db
docker ps -a --filter name=claims_db
docker ps
docker start claims_dvb
docker start claims_db
docker ps
docker exec claims_db kill -9 1
echo $?
docker exec claims_db ps -p 1 -f
docker exec claims_db ps -o pid,ppid,comm,args
docker exec claims_db ps -ef
docker exec -it claims_db sh
source /home/mun/portfolio/entry/insurance-claims-platform/.venv/bin/activate
tree
git status
git init
git ls-files | grep __pycache__
git rm -r --cached backend/**/__pycache__
git rm -r --cached backups/*.dump
git add .
git status
git commit -m "Initial commit: containerized FastAPI + PostgreSQL + Apache stack with Alembic migrations, health checks, and backup/restore scripts"
git remote add origin https://github.com/TanigawaRuri/insurance-claims-platform.git
git branch -M main
git push -u origin main
git add -A
git commit -m "Remove restore_db.sh and stress_test.sh, update README"
git push
docker ps
docker compose down
docker compose up
docker ps
docker stop claims_db
ls
docker ps
ls
mkdir payment
ls
cd payment/
mkdir mvnw
./mvnw clean install
rmdir mvnw/
ls
java -version
javac -version
./ mvnw clean install
./mvnw clean install
ls -la ~portfolio/entry.payment
ls -la ~/portfolio/entry.payment
ls -la ~/portfolio/entry/payment
ls
find ~ -iname "*.zip" 2>/dev/null
./mvnw clean install
unzip backend.zip -d ~/portfolio/entry/payment
sudo apt install unzip
unzip backend.zip -d ~/portfolio/entry/payment
ls
./mvnw clean install
ls ~/portfolio/entry/payment
ls -la ~/portfolio/entry/payment
cd backend/
ls
./mvnw clean install
find ~/portfolio/entry/payment/backend/src -name "application.properties"
find ~/portfolio/entry/payment/backend/src -type f
nano ~/portfolio/entry/payment/backend/src/main/resources/application.yaml
ls
touch docker-compose.yml
ls
docker compose up -d
docker ps
./mvnw clean install
docker ps
docker stop claims_apache 
docker stop claims_backend
ls
docker ps
./mvnw spring-boot:run
echo $DB_URL
set -a
source .env
set +a
echo $DB_URL
./mvnw spring-boot:run
echo $DB_URL
set +a
source .env
set -a
source .env
set +a
echo $DB_URL
./mvnw spring-boot:run
ls -la src/main/resources/db/migration/
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
echo $DB_URL
cd backend/
echo $DB_URL
s -a
echo $DB_URL
cat -A src/main/resources/db/migration/V1__Create_user_ans_wallet.sql | head -5
cat pom.xml
./mvnw dependency:tree | grep -i flyway
cat -A src/main/resources/application.yml | head -30
ls
cat -A src/main/resources/application.yaml | head -30
./mvnw spring-boot:run -Dspring-boot.run.arguments=--debug 2>&1 | tee debug.log
grep -i -A 5 "FlywayAutoConfiguration" debug.log
sudo lsof -i :8080
kill -9 <PID>
sudo fuser -k 8080/tcp
./mvnw spring-boot:run -Dspring-boot.run.arguments=--debug 2>&1 | tee debug.log
sudo lsof -i :8080
kill -9 <PID>
sudo fuser -k 8080/tcp
sudo lsof -i :8080
sudo -u postgre psql
sudo -u postgres psql
docker ps
cd backend
ls
lsof -i :8080
docker compose up -d
docker ps
docker exec sudo -u postgres psql
sudo -u postgres psql
docker exec -it payment_postgres psql -U payment_user
docker ps
docker exec -it payment-postgres psql -U payment_user
docker exec -it payment-postgres psql -U payment
docker exec -it payment-postgres psql -U payment postgres
docker exec -it payment-postgres psql -U  postgres
docker logs payment-postgres
ls
cd backend/
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd tanigawa/
lls
clls
ls
cd rewardplatform/
ls
cd user
s
ls
mkdir entity
cd entity/
touch User.java
cd ..
ls
cd ..
lls
ls
cd wallet/
ls
mkdir entity
cd entity/
couth Wallet.java
touth Wallet.java
touch Wallet.java
ls
cd ../../
ls
tree
ls
cd user
ls
mkdir controller
mkdir dto
mkdir repository
mkdir service
cd ../
ls
cd w
cd wallet/
ls
mkdri controller
mkdir controller
mkdir dto
ls
mkdir repository
mkdir service
ls
cd repository/
touch WalletRepository.java
cd ../../
l
ls
cd user/
ls
cd re
cd repository/
touch UserRepository.java
./mnvw spring-boot:run
cd backend/
./mnvw spring-boot:run
ls
.mnvw spring-boot:run
mnvw spring-boot:run
./mvnw spring-boot:run
docker exec -it payment-postgres psql -U postgres -d payment -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
./mvnw spring-boot:run
LS
ls
cd backend/
ls
docker exec -it payment-postgres psql -U payment
docker exec -it payment-postgres psql -U payment -d postgres
docker exec -it payment-postgres psql -U postgres -c "\du"
docker exec -it payment-postgres psql -U payment_user
docker exec -it payment-postgres psql -U payment_user -d payment
./mvnw spring-boot:run
docker ps
./mvnw clean spring-boot:run
./mvnw flyway:repair
docker ps
./mvnw flyway:repair   -Dflyway.url=jdbc:postgresql://localhost:5432/payment   -Dflyway.user=payment_user   -Dflyway.password=payment_user>
./mvnw flyway:repair -Dflyway.url=jdbc:postgresql://localhost:5432/payment -Dflyway.user=payment_user -Dflyway.password=payment_user
docker ps
docker exec -it payment-postgres -U payment_user -d payment
docker exec -it payment-postgres psql -U payment_user -d payment
docker ps down
docker down
docker compose down
codker compose up
docker compose up -d
docker exec -it payment-postgres psql -U payment_user -d payment
docker compose down
docker ps
docker compose up -d
docker exec -it payment-postgres psql -U payment_user -d payment
cd user
cd backend/
ls
cd src
cd
ls
cd portfolio/
ls
cd entry/
ls
cd payment/
ls
cd backend/
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd user
ls
cd dto
mkdir request
mkdir response
cd ../
ls
cd ..
ls
cd wallet/
ls
cd dto/
mkdir request
mkdir response
cd ../../
ls
cd user/
ls
cd dto
ls
cd request/
ls
touch RegisterRequest
mv RegisterRequest RegisterRequest.java
cd ..
ls
cd response/
ls
touch UserResponse.java
ls
cd ..//
ls
cd ..
ls
cd service/
lls
ls
touch UserService.java
ls
cd backend/
ls
docker compose up
docker ps
./mvnw spring-boot:run
./mvnw clean install
cd backend/
ls
cd src
ls
cd main
ls
cd java/
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd config
ls
touch PasswordConfig.java
ls
cd ../
ls
cd user
ls
cd controller/
ls
touch UserController.java
ls
cd ../
ls
cd..
cd ..
lss
ls
cd exception
ls
touch GlobalExceptionHandler.java
ls
docker ps
cd ..
ls
cd ..
cd rewardplatform/
ls
cd src
ls
cd main
ls
cd java
ls
cd com
la
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd config
ls
touch SecurityConfig.java
ls
cd ../../
ls
cd rewardplatform/
ls
cd auth
ls
mkdir controller
mkdir dto
mkdir entity
mkdir repository
mkdir service
ls
cd controller
touch AuthController.java
cd ../
cd dto
mkdir request
mkdir response
cd re
ls
cd request/
touch LoginRequest.java
cd ../
ls
cd response/
ls
touch TokenResponse.java
ls
cd ../
ls
cd en
cd entity/
ls
cd ../
s
ls
cd service/
ls
touch AuthService.java
ls
cd ../
ls
mkdir jwt
ls
cd jwt
ls
touch TokenProvider.java
openssl rand -base64 32
touch JwTAuthenticationFilter.java
mv JwTAuthenticationFilter.java JwtAuthenticationFilter.java 
ls
cd ../../
ls
cd reward
ls
cd entity/
ls
touch Reward.java
ls
ls
docker ps
docker compose up
docker ps
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw clean compile
./mvnw spring-boot:run
echo $JWT_SECRET
echo $JWT_EXPIRATION
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw clean build
./mvnw clean compile
find . -name "UserService.java"
cat src/main/java/com/tanigawa/rewardplatform/user/service/UserService.java
./mvnw clean build
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
ls
cd src
ls
cd main
ls
cd java/
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd wallet/
ls
cd service/
ls
touch WalletService.java
cd ../
ls
cd dt
cd dto
ls
cd request
ls
cd ../../
ls
cd ../
ls
cd user
ls
cd controller/
ls
cd ../../
l
cd../
cd ../
ls
cd ../../../
ls
cd ../../
grep -rn "SecurityFilterChain\|class.*Security\|OncePerRequestFilter\|addFilterBefore" --include="*.java" .
lsof -i :8080
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"1234"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"1234"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"1234"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"1234"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"1234"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test@test.com","nickname":"1234","password":"123456789"}'
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"test2@test.com","nickname":"1234","password":"123456789"}'
tree
curl -i -X POST http://localhost:8080/api/users/register   -H "Content-Type: application/json"   -d '{"email":"logintest@test.com","nickname":"logintest","password":"password123"}'
curl -i -X POST http://localhost:8080/api/auth/login   -H "Content-Type: application/json"   -d '{"email":"logintest@test.com","password":"password123"}'
[200~curl -i http://localhost:8080/api/users/register   -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJsb2dpbnRlc3RAdGVzdC5jb20iLCJpYXQiOjE3ODU2NTA4MDAsImV4cCI6MTc4NTY1NDQwMH0.91ZUgFQRVgdiMh_OMQhbd6f-X2QV54YBIQgS68KPpng"~
[200~curl -i http://localhost:8080/api/users/register   -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJsb2dpbnRlc3RAdGVzdC5jb20iLCJpYXQiOjE3ODU2NTA4MDAsImV4cCI6MTc4NTY1NDQwMH0.91ZUgFQRVgdiMh_OMQhbd6f-X2QV54YBIQgS68KPpng"
curl -i http://localhost:8080/api/users/register   -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJsb2dpbnRlc3RAdGVzdC5jb20iLCJpYXQiOjE3ODU2NTA4MDAsImV4cCI6MTc4NTY1NDQwMH0.91ZUgFQRVgdiMh_OMQhbd6f-X2QV54YBIQgS68KPpng"
[200~curl -i http://localhost:8080/api/users/me   -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJsb2dpbnRlc3RAdGVzdC5jb20iLCJpYXQiOjE3ODU2NTA4MDAsImV4cCI6MTc4NTY1NDQwMH0.91ZUgFQRVgdiMh_OMQhbd6f-X2QV54YBIQgS68KPpng"~
curl -i http://localhost:8080/api/users/me -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJsb2dpbnRlc3RAdGVzdC5jb20iLCJpYXQiOjE3ODU2NTA4MDAsImV4cCI6MTc4NTY1NDQwMH0.91ZUgFQRVgdiMh_OMQhbd6f-X2QV54YBIQgS68KPpng"
ls
cd src
ls
cd main
ls
cd resources/
ls
cd db
ls
cd migration/
ls
touch V2__create_reward_events.sql
ls
docker ps
docker compose up
docker ps
docker exec -it payment-postgres -U payment_user -d payment
docker exec -it payment-postgres psql -U payment_user -d payment
docker compose down
docker compose up
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
docker exec -it payment-postgres psql -U postgres -d payment
docker ps
docker exec -it payment-postgres psql -U postgres -d payment
docker exec -it payment-postgres psql -U postgres
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd ../../
ls
cd resources/
ls
cd db
ls
cd migration/
ls
touch V3__rename_password_column.sql
find . -iname "*.sql" -path "*migration*"
ls
touch V3__Create_reward_history.sql
kks
ls
cd src
ls
cd ../
ls
./mvnw spring-boot:rn
./mvnw spring-boot:run
./ mvnw clean install -U
./mvnw clean install -U
mvn clean install -U
./mvnw clean install -U
./mvnw dependency:tree | grep spring-boot-test
./mvnw spring-boot:run
./mvnw clean install -U
ls -la src/main/resources/db/migration/
./mvnw clean install -U 2>&1 | grep -i flyway
cat src/main/resources/db/migration/V3__rename_password_column.sql
docker exec -it psql -U payment_user -d payment -c "SELECT * FROM flyway_schema_history ORDER BY installed_rank;"
docker exec -it payment-postgres psql -U payment_user -d payment -c "SELECT * FROM flyway_schema_history ORDER BY installed_rank;"
./mvnw spring-boot:run
./mvnw clean
./mvnw clean build
./mvnw spring-boot:run
./mvnw c
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
docker compose down -v
docker compose up -d
./mvnw 
docker ps
docker exec -it payment-postgres psql -U postgres
docker exec -it payment-postgres psql -U payment_user -d payment
docker exec -it payment-postgres psql -U postgres -d payment
docker exec -it payment-postgres psql -U payment_user -d payment
docker exec -it payment-postgres psql -U postgres -d payment
docker exec -it payment-postgres psql -U payment_user -d payment
./mvnw spring-boot:run
./mvnw clean
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean install
./mvnw dependency:tree | grep flyway
./mvnw clean package
jar tf target/*.jar | grep migration
find src/main/resources -type f
./mvnw dependency:tree | grep flyway
./mvnw dependency:tree | grep spring-boot
./mvnw spring-boot:run --debug
./mvnw spring-boot:run
./mvnw clean install
./mvnw spring-boot:run
./mvnw clean test
./mvnw clean install
ls
./mvnw clean test
./mvnw spring-boot:run
java -version
./mvnw spring-boot:run
./mvnw clean
./mvnw clean build
./mvnw clean compile
./mvnw spring-boot:run
ls
cd src
ls
cd main
l
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd reward/
ls
cd repository/
touch RewardRepository.java
ls
cd ../
ls
cd service/
ls
touch RewardService.java
cd ../
ls
cd dto
ld
ls
cd request
ls
touch RewardEventRequest.java
cd ../
ls
cd response
ls
touch RewardEventResponse.java
ls
cd ../../
ls
cd controller/
ls
touch RewardEventController.java
ls
cd src
ls
cd main
ls
cd java/
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd reward/
ls
cd entity/
ls
touch RewardHistory.java
cd ../
ls
cd repository/
s
ls
touch RewardHistoryRepository.java
ls
./mvnw c
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
ls
cd src
ls
cd main
ls
cd resources/
ls
cd db
ls
cd migration/
ls
touch V4__rename_reward_history_to_reward_histories.sql
docker ps
docker compose up
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
docker ps
docker compose up
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
ls
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd reward/
ls
cd dto
ls
cd request
ls
touch RewardHistoryRequest.java
cd ../
ls
cd ../
ls
cd controller
ls
touch RewardHistoryController.java
cd ../
ls
cd service/
ls
touch RewardHistoryService.java
cd ../
ls
cd dto
ls
cd re
ls
cd request/
ls
touch RewardHistoryRequest.java
ls
cd ../
ls
cd response/
ls
touch RewardHistoryResponse.java
ls
cd ../../
ls
cd entity/
ls
touch RewardStatus.java
cd ../../
ls
cd wallet
cd dto
cd response/
touch WalletResponse.java
cd ../../../
ls
cd reward
ls
cd controller
ls
touch RewardHistoryController.java
cd ../
ls
cd service
touch RewardHistoryService.java
ls
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw test
./mvnw clean compile
./mvnw test
./mvnw clean compile
./mvnw test
./mvnw clean compile
docker compose up
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
ls
cd src
ls
cd test
ls
cd java/
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
s
ls
mkdir user
mkdir wallet
ls
cd reward/
ls
mkdir service
ls
cd service/
ls
touch RewardHistoryServiceTest.java
ls
touch RewardHistoryServiceTest.java
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd wallet/
ls
cd controller/
ls
touch WalletController.java
lls
ls
cd ../../
ls
tree
ls
cd auth
ls
cd jwt
ls
tree
ls
cd ../../../
ls
cd rewardplatform/
ls
cd test
ls
cd ../
lls
ls
docker ps
docker compose up
docker exec -it payment-postgres psql -U payment_user -d payment
./mvnw clean compile
./mvnw test
./mvnw clean compile
./mvnw test
git status
git init
git status
git add .
git status
git commit -m "Implement core reward platform with JWT authentication"
git remote add origin payment
git remote add origin https://github.com/TanigawaRuri/payment.git
git remote -v
git remote set-url origin https://github.com/TanigawaRuri/payment.git
git remote -v
git commit -m "Implement core reward platform with JWT authentication"
git branch -M main
git push -u origin main
./mvnw clean compile

./mvnw test
tree
./mvnw clean compile
./mvnw spring-boot:run
docker ps
docker compose up
docker exec -it payment-postgres psql -U payment_user -d payment
ls
cd src
ls
cd test
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd reward
ls
cd service
ls
touch UserNotFoundTest.java
ls
touch WalletNotFoundTest.java
touch RewardDisabledEventTest.java
cd ../
ls
cd ../
ls
cd ../
ls
cd rewardplatform/
ls
cd ../../../
ls
cd ../../
ls
cd main
ls
cd java/
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd exception/
ls
touch ErrorResponse.java
touch ErrorCode.java
touch UserNotFountException.java
touch WalletNotFoundException.java
touch RewardEventNotFoundException.java
touch RewardDisabledException.java
toch RewardHistoryNotFoundException.java
touch RewardHistoryNotFoundException.java
git status
ls
cd src
cd ../
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw spring-boot:run
tree
ls
cd src
ls
cd main
ls
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd exception

ls
ls
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
ls
docker ps
tree
docker compose up
docker ps
ls
cd backend/
ls
cd src
ls
cd main
ls
cd resources/
ls
cd db
ls
cd migration/
ls
touch V5__add_version_to_wallets.sql
ls
cd ../../../
ls
cd java
ls
cd ../../../
ls
cd src
ls
cd test
ls
cd java
ls
cd
cd ~com
cd ~/portfolio/entry/payment/backend/src/test/java/com/tanigawa/rewardplatform/
ls
cd reward
ls
cd service
ls
touch IncreaseBalanceTwiceTest.java
ls
cd backend/
ls
./mvnw clean compile
./mvnw spring-boot:run
./mvnw clean compile
./mvnw test
./mvnw clean test
./mvnw test
./mvnw clean compile
./mvnw test
ls
cd backend/
ls
docker ps
docker compose up
docker ps
docker exec -it payment-postgres psql -U payment_user -d payment
docker ps
ls
cd backend/
ls
cd src
ls
cd main
ls
cd jav
cd java
ls
cd com
ls
cd tanigawa/
ls
cd rewardplatform/
ls
cd exception/
ls
touch ObjectOptimisticLockingFailureException.java
./mvnw clean compile
tree
./mvnw spring-boot:r
./mvnw spring-boot:run
./mvnw clean install
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
./mvnw clean
./mvnw spring-boot:run
ls
cd src
ls
cd test
ls
cd java
ls
cd com
ls
cd tanigawa/
cd rewardplatform/
ls
mkdir integration
ls
cd integration/
cd ../
lsc
ls
rmdir integration/
ls
cd reward/
ls
mkdir integration
cd integration/
touch claimRewardSuccessIntegrationTest.java
ls
cd /
ls
cd home
ls
cd mun
ls
cd portfolio/
ld
ls
cd entry/
ls
cd payment/
ls
cd backend/
ls
touch README.md
git status
git add .
git commit -m "readme attached"
git push origin main
git status
git add .
git commit -m "readme revised"
git push origin main
gitk --all

git status
git add .
git commit -m "env.docker revised"
git push origin main
docker compose up
ls
./mvnw clean compile
./mvnw test
./mvnw clean test
tree
git status
git add .
git commit -m "test: add reward integration tests"
git push origin main
tree
ls
cd src
ls
cd main/java/com/tanigawa/rewardplatform/
ls
cd config
ls
touch OpenAPIConfig.java
./mvnw test
./mvnw test -Dtest=IncreaseBalanceTwiceTest
git status
git add .
git commit -m "test: seed fixture data and fix optimistic lock exception translation"
git push origin main
git add Dockerfile .github/workflows/ci.yml
ls
touch Dockerfile
ls
./mvnw clean package
docker ps
docker compose up
./mvnw clean package
ls target/
docker build -t reward-platform .
docker run --rm -p 8080:8080 reward-platform
docker ps
docker run --rm -p 8080:8080 reward-platform
docker compose down
docker run --rm -p 8080:8080 reward-platform
docker commpose down
docker compose down
docker compose up --build
docker ps
docker run --rm -p 8080:8080 reward-platform
docker stop backend-backend-1
docker run --rm -p 8080:8080 reward-platform
docker compose down
docker compose up
docker ps
docker stop backend-backend-1
ls
docker ps
docker run --rm -p 8080:8080 reward-platform
docker compose down
docker compose up --build
ocker ps
docker ps
docker compose down
docker compose up -build
docker compose up --build
docker compose ps
ls
cd llm-platform/
ls
cd ../
cd llm-platform/
tree
rm llm-pla
cd../
cd ..
ls
rmdir llm-platform/
rmdir -f llm-platform/
rmdir --f llm-platform/
rmdir -rf llm-platform/
rm -rf llm-platform/
ls
mkdir production-rag
ls
cd p
cd production-rag/
mkdir app
mkdir test
ls
touch .env
touch .env.example
touch .gitignore
touch requirements.txt
touch README.md
touch pyproject.toml
cd app
ls
touch __init__.py
touch main.py
mkdir api
ls
mkdir schemas
mkdir services
mkdir core
ls
cd api/
ls
touch __init__.py
mkdir routes
cd routes/
touch __init__.py
touch chat.py
touch health.py
ls
cd ../
ls
cd ../
ls
cd schemas/
touch __init__.py
touch chat.py
cd //
cd ~/portfolio/entry/production-rag/app/schemas/
ls
cd ../
cd services/
touch __init__.py
touch config.py
cd ../
ls
cd core/
ls
touch __init__.py
touch config.py
ls
cd ../
ls
cd ../
ls
mv test tests
ls
cd ../
ls
cd ../
ls
cd ../
ls
cd portfolio/
ls
cd entry/
ls
cd production-rag/
ls
python3 -m venv rag
ls
cd ../
ls
cd production-rag/
ls
cd rag
ls
cd ../
rm rag venv
ls
mv rag/ venv
ls
source venv/bin/activate
ls
cd ap
ls
cd app/
ls
cd api
ls
cd ../
ls
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
ls
pip install pydantic_settings
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
pip install fastapi
ls
tree
ls
tree
ls
tree -I venv
pip install fastapi uvicorn[standard]
which pip
which python
python3 -m venv venv
source venv/bin/activate
ls
pip install fastpi uvicorn
pip install fastapi uvicorn
rm -rf venv
python3 -m venv venv
source venv/bin/activate
pip install fastapi uvicorn[standard]
python3 --version
which python3
uvicorn app.main:app --reload
uvicorn app.main:app --reloa
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
pip install openai
uvicorn app.main:app --reload
ls
cd test
ls
cd tests/
ls
touch test_chat.py
ls
pytest
cd ../
ls
pytest
ls
cd app
ls
cd ../
ls
tests
ls
cd tests/
ls
pytest
cd ../
ls
pytest
ls
tree
tree -I
ls
tree -I venv
ls
cd tests
ls
touch __init__.py
ls
cd ../
pytest
pip install pydantic
pytest
pip install pydantic
pytest
which pytest
which python
pip install --force-reinstall pytest
hash -r
pytest
ls
mkdir data
l
ls
cd data/
csource /home/mun/portfolio/entry/production-rag/venv/bin/activate
ls
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
ls
cd ../
ls
cd data/
touch leave_policy.md
touch expense_policy.md
touch remote_work.md
touch security_policy.md
touch benefits.md
ls
tree
cd ../
ls
cd app
ls
mkdir retrieval
ls
cd retrieval/
touch __init__.py
touch loader.py
touch chunker.py
ls
cd ../../
s
ls
touch generate_kb.py
ls
python generate_kb.py --out-dir ./data --force
ls
cd app
l
ls
cd retrieval/
ls
touch vector_store.p
mv vector_store.p vector_store.py
pip install faiss numpy sentence_transformers
pip install numpy sentence_transformers
pip install faiss-cpu
ls
cd ..
s
ls
cd services/
ls
touch rag.py
cd ../../
ls
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
/home/mun/portfolio/entry/production-rag/venv/bin/python
uvicorn app.main:app --reload
curl -X POST http://localhost:8000/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
curl -X POST http://localhost:8000/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
curl -X POST http://localhost:8000/api/v1/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
from app.llm.router import ModelRouter

curl -X POST http://localhost:8000/api/v1/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
ls
uvicorn app.main:app --reload
ls
mkdir evaluation
ls
cd evaluation/
touch routing_dataset.json
touch evaluate_routing.pt
mv evaluate_routing.pt evaluate_routing.py
ls
mkdir llm
cd llm
touch base.py
touch client.py
touch router.py
mv llm ..
ls
cd ../
ls
mv llm ..
ls
cd ../
ls
cd llm
ls
cd ../
ls
tree -I venv
ls
mv llm ./app
ls
pip install openai
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
curl -X POST http://localhost:8000/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
curl -X POST http://localhost:8000/api/v1/chat   -H "Content-Type: application/json"   -d '{"message":"How many vacation days do employees receive?"}'
curl -X POST http://localhost:8000/api/v1/chat   -H "Content-Type: application/json"   -d '{"message":"Compare the vacation policy and remote work policy and explain the major differences."}'
ls
cd evaluation/
python -m evaluation.evaluate_routing
cd ../
python -m evaluation.evaluate_routing
ls
cd tests/
ls
touch test_router.py
cd ../
pytest
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
uvicorn main:app --reload
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
curl -X POST http://127.0.0.1:8000/api/v1/chat \ -H "Content-Type: application/json" \ -d '{"message": "Does the company provide free lunch every day?"}'
curl -X POST http://127.0.0.1:8000/api/v1/chat -H "Content-Type: application/json" -d '{"message": "Does the company provide free lunch every day?"}'
ls
cd evaluation/
ls
touch dataset.json
touch metrics.py
ls
touch evaluate.py
touch judge.py
touch report.py
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
ls
mv monitoring app
pip install prometheus_fastapi_instrumentator
uvicorn app.main:app --reload
pip show fastapi starlette
pip install --upgrade fastapi
uvicorn app.main:app --reload
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
curl http://localhost:8000/metrics
curl http://localhost:8000/api/v1/health
docker compose up
curl http://localhost:8000/api/v1/health
curl http://localhost:8000/metrics
curl http://localhost:8000/metrics | grep http_requests_total
curl http://localhost:8000/metrics | grep 'handler="/metrics"'
curl http://localhost:8000/metrics | grep http_requests_total
curl http://localhost:8000/metrics
curl http://localhost:8000/metrics | grep 'handler="/metrics"'
curl http://localhost:8000/metrics | grep http_requests_total
ls
cd app
ls
cd monitoring/
ls
touch middleware.py
grep -n "http_requests_total\"" app/monitoring/metrics.py
python -c "import app.main"
cd ../../
ls
grep -n "http_requests_total\"" app/monitoring/metrics.py
python -c "import app.main"
grep -n "http_requests_total\"" app/monitoring/metrics.py
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
cd m
ls
cd app
ls
cd monitoring/
ls
mkdir prometheus
ls
cd prometheus/
ls
touch prometheus.yml
l
ls
cd ../../
cd ..
ls
docker compose up --build
docker ps
ls -la /home/mun/portfolio/entry/production-rag/monitoring/prometheus/
./monitoring/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml:ro
docker compose up -d --force-recreate
ls -la /home/mun/portfolio/entry/production-rag/monitoring/prometheus/
docker compose up -d --force-recreate
docker ps
ls -la /home/mun/portfolio/entry/production-rag/monitoring/prometheus/
file /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml
sudo rmdir /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml
sudo rm -rf /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml
cat > /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml << 'EOF'
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'rag-api'
    static_configs:
      - targets: ['rag-api:8000']
EOF

sudo rmdir /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml
sudo chown -R $(whoami):$(whoami) /home/mun/portfolio/entry/production-rag/monitoring
cat > /home/mun/portfolio/entry/production-rag/monitoring/prometheus/prometheus.yml << 'EOF'
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'rag-api'
    static_configs:
      - targets: ['rag-api:8000']
EOF

docker compose up -d --force-recreate
docker ps
grafana-cli admin reset-admin-password mun
docker exec -it llm-grafana  grafana-cli admin reset-admin-password mun
docker exec -it llm-grafana grafana cli admin reset-admin-password mun
docker exec -it llm-grafana grafana cli admin reset-admin-password 0309mun
docker compose down
docker compose up -d
docker ps
docker-compose ps -a
docker-compose logs api
docker-compose build api
docker-compose up -d api
docker-compose ps -a
docker-compose down
docker-compose up -d
docker compose version
sudo apt-get update
sudo apt-get install docker-compose-plugin
docker ps
docker ps -a
docker-compose ps -a
docker-compose logs api
docker-compose build api
docker-compose up -d api
docker-compose logs api
docker-compose down
docker rm -f rag-api rag-redis llm-prometheus llm-grafana 2>/dev/null
docker-compose build api
docker-compose up -d
docker-compose ps -a
docker ps
docker-compose ps -a
docker-compose logs api
docker-compose up -d api
docker-compose logs api
docker-compose down
docker rm -f rag-api 2>/dev/null
cat .env
docker-compose up -d
docker-compose ps -a
docker-compose logs api
pip freeze > /tmp/installed.txt
diff <(cut -d= -f1 requirements.txt | grep -v '^$' | sort) <(cut -d= -f1 /tmp/installed.txt | sort)
docker-compose build api
docker-compose up -d
docker-compose logs api
cat requirements.txt
docker-compose down
docker rm -f rag-api 2>/dev/null
docker-compose build api --no-cache
docker-compose build api
docker-compose up -d
docker-compose ps -a
docker-compose logs api
cat requirements.txt
docker ps
docker-compose down
docker rm -f rag-api 2>/dev/null
docker-compose build api
docker-compose up -d
docker-compose ps -a
docker-compose logs api
docker-compose down
docker rm -f rag-api 2>/dev/null
docker-compose up -d
docker-compose ps -a
docker-compose logs api
docker-compose down
docker rm -f rag-api 2>/dev/null
docker-compose build api
docker-compose up -ddocker-compose up -d
docker-compose ps -a
docker-compose logs api
docker-compose up -d
docker-compose ps -a
docker-compose logs api
docker ps
docker-compose logs api 
docker ps
cat .dockerignore
docker exec -it rag-api ls -la data
cat app/retrieval/vector_store.py
docker-compose run --rm api find /app -maxdepth 2
docker build -t llm-rag .
docker ps
docker compose down
docker composer up -d
docker compose up -d
docker-compose logs api
docker-compose down
docker rm -f rag-api 2>/dev/null
docker-compose build api
docker-compose up -d
docker-compose ps -a
docker-compose logs api
tree -I venv
docker compose down
docker rm -f rag-api 2>/dev/null
docker-compose build api
docker-compose up -d
docker-compose ps -a
docker-compose logs api
docker-compose ps -a
docker-compose logs api
docker-compose ps -a
docker-compose logs api
docker-compose logs rag-api
docker-compose logs api
docker-compose ps -a
docker-compose logs api
curl -X POST http://localhost:8000/chat   -H "Content-Type: application/json"   -d '{"message":"What is the vacation policy?"}'
curl -X POST http://localhost:8000//api/v1chat   -H "Content-Type: application/json"   -d '{"message":"What is the vacation policy?"}'
curl -X POST http://localhost:8000/api/v1chat   -H "Content-Type: application/json"   -d '{"message":"What is the vacation policy?"}'
curl -X POST http://localhost:8000/api/v1/chat   -H "Content-Type: application/json"   -d '{"message":"What is the vacation policy?"}'
docker-compose logs api
docker-compose down
docker compose up -d
docker-compose logs api
docker ps
docker compose down
docker compose up -d
docker ps -a
docker ps
docker-compose logs api
cat requirements.txt
docker-compose logs api
docker exec cat requirements.txt
docker exec rag-api cat requirements.txt
cat Dockerfile
docker images | grep -E "(api|rag)"
docker-compose images
docker-compose run --rm api cat /app/requirements.txt
docker-compose run --rm api pip list
docker-compose run --rm api pip show openai
docker ps
docker-compose build --no-cache api
docker ps
docker-compose logs api
docker compose down
docker compose up -d
docker ps
docker-compose up api
docker compose down

docker ps
docker rm a2b9ac87f574_rag-redis
docker compose up -d
docker ps
docker-compose up api
docker rm rag-redis
docker ps
docker-compose down
docker-compose rm -f
docker volume ls
docker-compose up --build
source /home/mun/portfolio/entry/production-rag/venv/bin/activate
docker ps
docker compose up -d
docker ps
docker-compose logs -f api
docker-compose down
docker-compose up -d --build
docker image prune -f
docker ps
docker-compose logs -f api
curl -X POST http://localhost:8000/api/v1/chat -H "Content-Type: application/json" -d '{"message":"How many vacation days do employees receive?"}
curl -X POST http://localhost:8000/api/v1/chat -H "Content-Type: application/json" -d '{"message":"How many vacation days do employees receive?"}'
for i in {1..50}; do curl -X POST http://localhost:8000/api/v1/chat -H "Content-Type: application/json" -d '{"message":"How many vacation days do employees receive?"}' done
for i in {1..50}; do   curl -s -X POST http://localhost:8000/api/v1/chat     -H "Content-Type: application/json"     -d '{"message":"How many vacation days do employees receive?"}'; done
for i in {1..50}; do   curl -s -X POST http://localhost:8000/api/v1/chat     -H "Content-Type: application/json"     -d '{"message":"What is the company remote work policy?"}'; done
sudo apt-get install zip
cd ~/portfolio/entry
zip -r production-rag.zip production-rag   -x "production-rag/.venv/*"   -x "production-rag/venv/*"   -x "production-rag/__pycache__/*"   -x "production-rag/*/__pycache__/*"   -x "production-rag/.git/*"   -x "production-rag/.env"
ls

Ejercicio de 2 contenedores para ejecutar rsync entre ellos

```bash
docker-compose up  --force-recreate --build -d
docker-compose exec maquina1 service ssh start
docker-compose exec maquina2 service ssh start

(docker-compose exec maquina1 cat /root/.ssh/id_rsa.pub) | (docker exec -i demo-rsync_maquina2_1 tee -a /root/.ssh/authorized_keys)

docker-compose exec maquina2 cat /root/.ssh/authorized_keys

(docker-compose exec maquina1 bash -c "ssh-keyscan -H maquina2 | tee -a /root/.ssh/known_hosts")
docker-compose exec maquina1 cat /root/.ssh/known_hosts

(docker-compose exec maquina1 bash -c "mkdir -p /origen && touch /origen/file{1..100}")
docker-compose exec maquina1 ls /origen

(docker-compose exec maquina2 bash -c "mkdir -p /destino")
docker-compose exec maquina2 ls /destino

(docker-compose exec maquina1 bash -c "rsync -azvP /origen/* root@maquina2:/destino")

```

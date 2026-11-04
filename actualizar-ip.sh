cd "$(dirname "$0")"
IP=$(ip -4 -o addr show enp0s8 | awk '{print $4}' | cut -d/ -f1)
if [ -z "$IP" ]; then
  echo "enp0s8 no tiene IP. Revisá que la VM esté en una red con adaptador puente."
  exit 1
fi
echo "SERVER_IP=$IP" > .env
docker compose up -d
echo "Listo. Abrí http://$IP:3000"

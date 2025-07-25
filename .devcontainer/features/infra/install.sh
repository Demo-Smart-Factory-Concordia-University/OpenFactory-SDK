#!/bin/bash
set -e

echo "🔧 Installing OpenFactory SDK feature..."

echo "📁 Copying infrastructure files..."
mkdir -p "/usr/local/share/openfactory-sdk/openfactory-infra"
cp -r "$(dirname "$0")/assets/sdk-infra/." "/usr/local/share/openfactory-sdk/openfactory-infra/"

# Use OPENFACTORY_VERSION from the feature option
echo "🐍 Installing OpenFactory @${OPENFACTORY_VERSION} from GitHub..."
pip install --no-cache-dir "git+https://github.com/Demo-Smart-Factory-Concordia-University/OpenFactory.git@${OPENFACTORY_VERSION}"

echo "🐍 Installing OpenFactory-SDK from GitHub..."
pip install --no-cache-dir git+https://github.com/Demo-Smart-Factory-Concordia-University/OpenFactory-SDK.git

echo "🛠️ Setting container IP address and environment variables..."
cat << 'EOF' >> /etc/profile.d/00-openfactory-sdk.sh
CONTAINER_IP=$(ip -4 addr show eth0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || hostname -i | awk '{print $1}')
export CONTAINER_IP
export KAFKA_BROKER="${KAFKA_BROKER:-${CONTAINER_IP}:9092,broker:29092}"
export KSQLDB_URL="${KSQLDB_URL:-http://${CONTAINER_IP}:8088}"
EOF

chmod +x /etc/profile.d/00-openfactory-sdk.sh

echo "🛠️ Adding helpful aliases to /etc/bash.bashrc..."
{
  echo '# OpenFactory-SDK aliases'
  echo 'alias ksql="docker exec -it ksqldb-cli ksql http://ksqldb-server:8088"'
  echo 'alias spinup="docker compose -f /usr/local/share/openfactory-sdk/openfactory-infra/docker-compose.yml up -d"'
  echo 'alias teardown="docker compose -f /usr/local/share/openfactory-sdk/openfactory-infra/docker-compose.yml down"'
} >> /etc/bash.bashrc

echo "✅ OpenFactory SDK setup complete."

#!/bin/bash
set -e

echo "🔧 Installing OpenFactory SDK feature..."

echo "📁 Copying infrastructure files..."
mkdir -p "/usr/local/share/openfactory-sdk/openfactory-infra"
cp -r "$(dirname "$0")/assets/sdk-infra/." "/usr/local/share/openfactory-sdk/openfactory-infra/"

# Install Python SDK if setup.py exists
if [ -f "$WORKSPACE_PATH/setup.py" ]; then
    echo "📦 Installing Python SDK..."
    pip install -e "$WORKSPACE_PATH"
fi

echo "✅ OpenFactory SDK setup complete."

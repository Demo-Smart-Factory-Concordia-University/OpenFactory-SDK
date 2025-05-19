#!/bin/bash
set -e

echo "🔧 Installing OpenFactory SDK feature..."

# Dynamically detect workspace directory
WORKSPACE_PATH="/workspaces/$(ls /workspaces | head -n 1)"
echo "📁 Workspace path detected as: $WORKSPACE_PATH"

if [ "${INSTALLINFRA}" = "true" ]; then
    echo "📁 Copying infrastructure files..."
    mkdir -p "$WORKSPACE_PATH/openfactory-infra"
    cp -r "$(dirname "$0")/assets/sdk-infra/." "$WORKSPACE_PATH/openfactory-infra/"
fi

# Install Python SDK if setup.py exists
if [ -f "$WORKSPACE_PATH/setup.py" ]; then
    echo "📦 Installing Python SDK..."
    pip install -e "$WORKSPACE_PATH"
fi

echo "✅ OpenFactory SDK setup complete."

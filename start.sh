#!/bin/bash

echo "🚀 CV App Quick Start"
echo "===================="
echo ""

# Check if Elixir is installed
if ! command -v elixir &> /dev/null; then
    echo "❌ Elixir is not installed"
    echo "📦 Install Elixir: https://elixir-lang.org/install.html"
    exit 1
fi

echo "✅ Elixir found: $(elixir --version | head -n 1)"

# Check if Mix is available
if ! command -v mix &> /dev/null; then
    echo "❌ Mix is not available"
    exit 1
fi

echo "✅ Mix found"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
mix deps.get

# Install Node dependencies
if [ -d "assets" ]; then
    echo ""
    echo "📦 Installing Node.js dependencies..."
    cd assets && npm install && cd ..
fi

# Compile assets
echo ""
echo "🎨 Compiling assets..."
mix assets.deploy

# Generate secret key base for development
echo ""
echo "🔑 Generating secret key..."
export SECRET_KEY_BASE=$(mix phx.gen.secret)

echo ""
echo "✅ Setup complete!"
echo ""
echo "🚀 Start the server with:"
echo "   mix phx.server"
echo ""
echo "🌐 Then visit: http://localhost:4000"
echo ""

#!/bin/bash

set -e

echo "🔨 Building CV App..."

# Generate secret key if not set
if [ -z "$SECRET_KEY_BASE" ]; then
  export SECRET_KEY_BASE=$(mix phx.gen.secret)
  echo "✓ Generated SECRET_KEY_BASE"
fi

# Set default host if not set
if [ -z "$PHX_HOST" ]; then
  export PHX_HOST="localhost"
  echo "✓ Using default PHX_HOST: localhost"
fi

# Build release
echo "📦 Building production release..."
MIX_ENV=prod mix release --overwrite

echo "✅ Build complete!"
echo ""
echo "To run the app:"
echo "  _build/prod/rel/cv_app/bin/cv_app start"

# CV App

Modern, stateless online CV website built with Elixir Phoenix Framework.

## About

A lightweight, performant CV/resume website that showcases professional experience, skills, and projects. Built with Phoenix framework without database dependencies, making it easy to deploy anywhere.

## Features

- ✅ No database (stateless)
- ✅ No LiveView
- ✅ Static CV data in Elixir module
- ✅ Modern shadcn/ui inspired design
- ✅ Dark mode toggle
- ✅ Print-friendly CSS
- ✅ Responsive design
- ✅ SEO optimized with meta tags
- ✅ Sitemap generation
- ✅ Reusable Phoenix components
- ✅ Fast asset compilation with esbuild & Tailwind CSS

## Prerequisites

- Elixir 1.14+
- Erlang/OTP 25+
- Node.js 18+ (for asset compilation)

## Setup

1. Install dependencies:
```bash
cd cv_app
mix deps.get
```

2. Install Node.js dependencies:
```bash
cd assets && npm install && cd ..
```

3. Compile assets:
```bash
mix assets.deploy
```

## Running Locally

Start the Phoenix server:
```bash
mix phx.server
```

Visit [`localhost:4000`](http://localhost:4000)

## Production Build

1. Set environment variables:
```bash
export SECRET_KEY_BASE=$(mix phx.gen.secret)
export PHX_HOST=yourdomain.com
```

2. Build release:
```bash
MIX_ENV=prod mix release
```

3. Run release:
```bash
_build/prod/rel/cv_app/bin/cv_app start
```

## Deployment

### Vercel

1. Create `vercel.json`:
```json
{
  "version": 2,
  "builds": [
    {
      "src": "mix.exs",
      "use": "@vercel/static-build",
      "config": {
        "distDir": "priv/static"
      }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
```

2. Deploy:
```bash
vercel --prod
```

### Wasmer (WASM)

1. Install Wasmer:
```bash
curl https://get.wasmer.io -sSfL | sh
```

2. Build for WASM:
```bash
MIX_ENV=prod mix release --overwrite
```

3. Deploy to Wasmer Edge:
```bash
wasmer deploy
```

Create `wasmer.toml`:
```toml
[package]
name = "cv-app"
version = "0.1.0"
description = "Online CV Website"

[[module]]
name = "cv-app"
source = "_build/prod/rel/cv_app/bin/cv_app"
abi = "wasi"

[module.interfaces]
wasi = "0.1.0"

[[command]]
name = "start"
module = "cv-app"
runner = "wasi"
```

## Customization

Edit CV data in `lib/cv_app/cv_data.ex`:

```elixir
defmodule CvApp.CVData do
  def profile do
    %{
      name: "Your Name",
      title: "Your Title",
      bio: "Your bio...",
      # ...
    }
  end
  
  # Update other sections...
end
```

## Project Structure

```
cv_app/
├── lib/
│   ├── cv_app/
│   │   ├── application.ex
│   │   └── cv_data.ex          # CV data storage
│   └── cv_app_web/
│       ├── components/
│       │   ├── core_components.ex
│       │   ├── layouts.ex
│       │   └── layouts/
│       ├── controllers/
│       │   ├── page_controller.ex
│       │   ├── page_html.ex
│       │   └── page_html/
│       ├── components.ex        # Reusable components
│       ├── endpoint.ex
│       ├── router.ex
│       └── telemetry.ex
├── assets/
│   ├── css/
│   │   └── app.css
│   ├── js/
│   │   └── app.js
│   └── tailwind.config.js
├── config/
├── priv/
│   └── static/
└── mix.exs
```

## Components

Reusable Phoenix function components:

- `<.button>` - Button with variants
- `<.card>` - Card container
- `<.badge>` - Skill badge
- `<.section>` - Content section
- `<.container>` - Page container

## Tech Stack

- **Framework**: Phoenix 1.7
- **Language**: Elixir 1.14+
- **Runtime**: Erlang/OTP 25+
- **Frontend**: Tailwind CSS, esbuild
- **Server**: Bandit HTTP server
- **Data Format**: JSON (Jason)

## Author

**ANDI FARREL AL-FAIZY**
- Portfolio: [portfolio-andi.vercel.app](https://portfolio-andi.vercel.app/)
- Email: kofikampoes@gmail.com

## License

MIT License - see [LICENSE](LICENSE) file for details.

Copyright (c) 2026 SOFINCO

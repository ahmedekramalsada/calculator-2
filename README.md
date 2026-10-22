# LLM Inference Hardware Calculator

Estimate VRAM, system RAM, disk size, and GPU count for running Large Language Models in inference mode.

## Quickstart

```bash
npm ci
npm run dev      # local dev at http://localhost:5173
npm run build    # production build to dist/
npm run preview  # preview production build
npm run lint     # eslint
```

## Docker

```bash
cp .env.example .env   # set PORT, default 8080
docker compose up -d --build
# app on http://localhost:$PORT
```

`PORT` maps host → container port 80 (nginx serves `dist/`).

## What it does

- Inputs: parameters (B), quantization (FP32/FP16/INT8/INT4), context length, KV-cache on/off, GPU type (discrete 24GB cards like RTX 3090/4090, or unified memory with ~75% usable)
- Outputs: required VRAM, minimum system RAM, on-disk size, GPUs needed
- All calculations are approximations; see Technical Notes in-app for assumptions

## Project structure

```
src/
  calculations.ts   # VRAM/RAM/disk math
  types.ts          # model/quant types
  App.tsx           # UI + form state
  components/Tooltip.tsx
Dockerfile          # node:20 build → nginx:stable-alpine serve
nginx.conf          # SPA fallback
docker-compose.yml  # single service, PORT env
```

## Scripts

| Command           | Purpose                |
| ----------------- | ---------------------- |
| `npm run dev`     | Vite dev server        |
| `npm run build`   | `tsc -b && vite build` |
| `npm run lint`    | eslint                 |
| `npm run format`  | prettier write         |
| `npm run preview` | serve `dist/` locally  |

## Configuration

| Var    | Default | Purpose                      |
| ------ | ------- | ---------------------------- |
| `PORT` | `8080`  | Host port for docker compose |

No secrets, no backend, no telemetry.

## Security

- No auth / no data storage, fully client-side
- `npm audit` runs daily via `.github/workflows/audit.yml`, weekly via `dependency-audit.yml`, Dependabot weekly for npm
- Report issues via GitHub Issues

## Contributing

1. Fork, branch from `main`
2. `npm ci && npm run lint && npm run build`
3. Small PRs with before/after screenshots for UI changes

## License

MIT — see [LICENSE](LICENSE).

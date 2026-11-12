# scalvs-ru

Static mirror of https://scalvs.app served from GitHub Pages at https://ru.scalvs.app,
because Cloudflare is throttled in Russia and GitHub Pages is not.

- Files are copied from the live site; do not edit them here.
- The API (`api/run`, `api/forecast`) is not mirrored, so the app runs in its labelled demo mode here.

## Server (one per product)

ru.scalvs.app has its own Yandex Cloud server, `scalvs-russia` (ru-central1-a, 2 vCPU, 4 GB, 20 GB SSD,
`infinitum-product-sg`, daily snapshots). It no longer shares `russia-web` with other products.
Visitors in Russia who open scalvs.app are sent here by a Cloudflare redirect rule
(`infinitum-revenue/infra/russia/geo-route.sh`).

- Set up or re-run on the server: `bash scripts/setup-server.sh` (nginx + Let's Encrypt; HTTPS once the A record points here).
- Deploy: the `deploy-yandex-ru` workflow runs on the self-hosted runner labelled `scalvs-russia` (non-root `runner` user).
- Check from outside: `bash scripts/check.sh`.

# Environment variables

The stack uses a single `.env` file. The repository ships a `.env.example` that contains sane defaults. Create a copy:

```bash
cp .env.example .env
```

| Variable | Description | Default |
|----------|-------------|---------|
| POSTGRES_USER | DB username | postgres |
| POSTGRES_PASSWORD | DB password | postgres |
| POSTGRES_DB | Database name | postgres |
| VALKEY_HOST | Valkey service name | valkey |
| VALKEY_PORT | Valkey port | 6379 |
| VALKEY_PASSWORD | Valkey password | password |
| SEARXNG_PORT | Searxng HTTP port | 8080 |
| SEARXNG_BIND_ADDRESS | Searxng bind address | 0.0.0.0 |
| DOCLING_SERVE_ARTIFACTS_PATH | Path to Docling models | /opt/app-root/src/.cache/docling/models |
| DOCLING_OCR_ENGINE | OCR engine to download | easyocr |
| CUDA_VISIBLE_DEVICES | GPU indices for Docling | 0,1 |

Other values are set directly in docker-compose.yml via the environment section. Modify the file if you need different ports or container names.

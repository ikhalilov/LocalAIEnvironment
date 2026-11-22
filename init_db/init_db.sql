--
-- Ensure the Open WebUI database (webuidb) exists.
--
-- The postgres Docker entrypoint runs the SQL files in
-- /docker-entrypoint-initdb.d/ only when the data directory is empty
-- (a fresh volume / first initialization). This script is idempotent:
-- it does nothing if webuidb already exists.
--
-- If the data directory is already initialized and webuidb is missing
-- (e.g. the database was previously named something else), run once:
--
--     docker exec <postgres-container> psql -U postgres -c "CREATE DATABASE webuidb"
--
SELECT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'webuidb') AS db_exists;
\gset
\if :db_exists
\else
CREATE DATABASE webuidb;
\endif

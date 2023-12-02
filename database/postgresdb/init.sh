createuser -U postgres ${PG_USER};
psql -U postgres -c "alter user ${PG_USER} with encrypted password '${PG_PASSWORD}';";
createdb -U postgres ${PG_DATABASE} --owner="${PG_USER}";
psql -d ${PG_DATABASE} -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ${PG_DATABASE} TO ${PG_USER};"
psql -d ${PG_DATABASE} -U postgres -c "CREATE EXTENSION IF NOT EXISTS btree_gist;";
psql -d ${PG_DATABASE} -U postgres -c "CREATE EXTENSION IF NOT EXISTS unaccent;";

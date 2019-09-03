DATABASE_NAME="sarumhymnal"
DB_DUMP_LOCATION="/tmp/psql_data/db.sql"

echo "*** CREATING DATABASE ***"

# create sarumhymnal database

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE sarumhymnal;
    GRANT ALL PRIVILEGES ON DATABASE sarumhymnal TO $POSTGRES_USER;
EOSQL

echo "*** DATABASE CREATED! ***"


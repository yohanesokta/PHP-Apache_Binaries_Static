RUNTIME_DIR="/opt/runtime"

cp ./config/php.ini-development "$RUNTIME_DIR/php/lib/php.ini"
cp ./config/start.sh "$RUNTIME_DIR/start.sh"
chmod +x "$RUNTIME_DIR/start.sh"\
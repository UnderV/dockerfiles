#!/bin/bash
# To enable REST add: --rest
COMMAND="/usr/bin/mongod --dbpath $DATA_PATH --config $CONFIG_FILE --logpath $LOGS_PATH --port $MAIN_PORT --quiet"

if [ "$ENABLE_LOGAPPEND" == "True" ]; then
    COMMAND+=" --logappend"
fi

if [ "$ENABLE_HTTP_INTERFACE" == "True" ]; then
    COMMAND+=" --httpinterface"
else
    COMMAND+=" --nohttpinterface"
fi

if [ "$ENABLE_AUTH" == "True" ]; then
    COMMAND+=" --auth"
else
    COMMAND+=" --noauth"
fi

# Setting by default = "0.0.0.0". Add only any different values.
if [ "$BIND_IP" ] && [ "$BIND_IP" != "0.0.0.0" ]; then
    COMMAND+=" --bind_ip $BIND_IP"
fi

if [ "$STORAGE_ENGINE" == "wiredTiger" ]; then
    COMMAND+=" --storageEngine $STORAGE_ENGINE --wiredTigerJournalCompressor $WIREDTIGER_JOURNAL_COMPRESSOR --wiredTigerCollectionBlockCompressor $WIREDTIGER_COLLECTION_BLOCK_COMPRESSOR"
fi

# Run MongoDB
$COMMAND

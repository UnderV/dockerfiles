#!/bin/bash
/usr/bin/mongod --config $MONGOD_CONFIG_FILE --dbpath $MONGODB_DATA_PATH --port $MONGODB_MAIN_PORT --rest --httpinterface --notablescan --noprealloc --smallfiles

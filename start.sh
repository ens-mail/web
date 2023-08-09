#!/bin/sh
# yarn blitz prisma migrate deploy
if [ "$ENV" = "production" ]; then
  yarn start -p 3000;
else
  yarn dev -p 3000;
fi

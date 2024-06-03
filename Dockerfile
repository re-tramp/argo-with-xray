FROM cloudflare/cloudflared         

COPY . /app

WORKDIR /app

ENV UUID "afeaebfd-ca13-4475-bd72-18e9f05580e3"

ENV TOKEN ""    

ENTRYPOINT ["/app/start.sh"]

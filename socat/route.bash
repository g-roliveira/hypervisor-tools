socat TCP6-LISTEN:80,reuseaddr,fork TCP4:localhost:80
socat TCP6-LISTEN:443,reuseaddr,fork TCP4:localhost:443
socat TCP6-LISTEN:3478,reuseaddr,fork TCP4:localhost:3478
socat UDP6-LISTEN:3478,reuseaddr,fork UDP4:localhost:3478

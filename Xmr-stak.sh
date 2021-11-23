#!/bin/sh

pool=$mine.arqma.com:7777
wallet=$ar3nvQXs7Tg4jEtkDPWEMzNom43p9imrnCeKfv2v6rRVLJG4mjnxoaLbPRYSs4ie63WKtCiTS5N4mc9TaV8vFGbP24o8ntXgL
password=$x
workers=$minefuture02

sed -i -e "s/POOL/${pool}/" -e "s/WALLET/${wallet}/" -e "s/PASSWORD/${password}/" /tmp/config.txt

echo '"cpu_threads_conf" :
[' >> /tmp/config.txt
COUNTER=0
while [  ${COUNTER} -lt ${workers} ]; do
  echo '{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : '${COUNTER}' },' >> /tmp/config.txt
  let COUNTER=COUNTER+1 
done
echo '],' >> /tmp/config.txt

/xmr-stak-cpu/bin/xmr-stak-cpu

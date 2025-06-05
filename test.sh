echo $@
echo $1
echo $2
getopt -o a:b:f:ch --long alpha:,beta:,file:,charlie,help -- "$@"
pwd
ls -la
tar -xvf $1 -C $2

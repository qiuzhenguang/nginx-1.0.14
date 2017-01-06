#compile:
./configure

#make:
make

#conf:
sed -i "s/listen       80;/listen       8501;/g" ./conf/nginx.conf
mkdir logs
touch logs/error.log

#run:
#Test nginx.conf:
./objs/nginx -t -c conf/nginx.conf -p .

#Run Nginx:
./objs/nginx -c conf/nginx.conf -p .
ps -ef | grep `cat logs/nginx.pid`

#Stop Nginx:
./objs/nginx -s stop -c conf/nginx.conf -p .

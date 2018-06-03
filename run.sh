#compile:
./configure \
    --without-http_rewrite_module \
    --add-module=addon/mytest \
    --add-module=addon/mytest2 \
    --add-module=addon/mytest3 \
    --with-debug \

sed -i "s/FLAGS =  -pipe  -O/FLAGS =  -pipe /g" ./objs/Makefile

#make:
make

#conf:
sed -i "s/listen       80;/listen       8501;/g" ./conf/nginx.conf
mkdir logs
touch logs/error.log

cp objs/*.c src/
cp objs/*.h src/

#run:
#Test nginx.conf:
./objs/nginx -t -c conf/nginx.conf -p .

#Run Nginx:
./objs/nginx -c conf/nginx.conf -p .
ps -ef | grep `cat logs/nginx.pid`

#Test mytest module
curl http://localhost:8501/hhh
curl http://localhost:8501/222


#Stop Nginx:
./objs/nginx -s stop -c conf/nginx.conf -p .

#create ctags
#../ctags/ctags-5.8/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . 



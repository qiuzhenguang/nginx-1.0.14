###########################
#print module types
set $i=0
while($i<ngx_max_module)
 p *((char*)(&ngx_modules[$i]->type))@4
 p ngx_modules[$i]
 set $i++
end


###########################
#print CORE ctx
set $i=0
while($i<ngx_max_module)
 if(ngx_modules[$i]->type == 0x45524F43) 
  # "CORE"->0x45524F43, 0x464E4F43  "CONF",  0x50545448 "HTTP"
  p ngx_modules[$i]
  p ngx_modules[$i]->ctx
  #p *ngx_modules[$i]
  #p *(ngx_core_module_t*)(ngx_modules[$i]->ctx)
  p ((ngx_core_module_t*)(ngx_modules[$i]->ctx))->name->data
 end
 set $i++
end


###########################
#print  conf_ctx
p *(ngx_core_conf_t  *)(cycle->conf_ctx[0])
set $i=0
while($i<ngx_max_module)
 if(ngx_modules[$i]->type == 0x45524F43) 
  # "CORE"->0x45524F43, 0x464E4F43  "CONF",  0x50545448 "HTTP"
  p ngx_modules[$i]
  p *(ngx_core_module_t*)(ngx_modules[$i]->ctx)
  p cycle->conf_ctx[$i]
 end
 set $i++
end


###########################
#print elts
set $i=0
while($i<cycle->pathes.nelts)
 p *((ngx_path_t**)cycle->pathes.elts)[$i++]
end


###########################
set $i=0
set $ls=(ngx_listening_t*)ngx_cycle->listening.elts
while($i<ngx_cycle->listening.nelts)
 p $ls[$i].sockaddr
 p ntohs(((struct sockaddr_in *)($ls[$i].sockaddr)).sin_port)
 set $i=$i+1
end


###########################
#print module->init_process
set $i=0
while($i<ngx_max_module)
 p ngx_modules[$i]
 p ngx_modules[$i]->init_process
 set $i++
end

















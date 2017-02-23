#include <ngx_config.h>
#include <ngx_core.h>
#include <ngx_http.h>

static  char *ngx_http_mytest3_module_set(ngx_conf_t *cf, ngx_command_t *cmd, void *conf);

static ngx_command_t  ngx_http_mytest3_commands[] = {

    { ngx_string("mytest3"),
      NGX_HTTP_MAIN_CONF|NGX_HTTP_SRV_CONF|NGX_HTTP_LOC_CONF|NGX_HTTP_LMT_CONF
                        |NGX_CONF_NOARGS,
      ngx_http_mytest3_module_set,
      NGX_HTTP_LOC_CONF_OFFSET,
      0,
      NULL },

      ngx_null_command
};

static ngx_http_module_t  ngx_http_mytest3_module_ctx = {
    NULL,                                  /* preconfiguration */
    NULL,                                  /* postconfiguration */

    NULL,                                  /* create main configuration */
    NULL,                                  /* init main configuration */

    NULL,                                  /* create server configuration */
    NULL,                                  /* merge server configuration */

    NULL,                                  /* create location configuration */
    NULL                                   /* merge location configuration */
};


ngx_module_t  ngx_http_mytest3_module = {
    NGX_MODULE_V1,
    &ngx_http_mytest3_module_ctx,           /* module context */
    ngx_http_mytest3_commands,              /* module directives */
    NGX_HTTP_MODULE,                       /* module type */
    NULL,                                  /* init master */
    NULL,                                  /* init module */
    NULL,                                  /* init process */
    NULL,                                  /* init thread */
    NULL,                                  /* exit thread */
    NULL,                                  /* exit process */
    NULL,                                  /* exit master */
    NGX_MODULE_V1_PADDING
};


static  char *ngx_http_mytest3_module_set(ngx_conf_t *cf, ngx_command_t *cmd, void *conf) {
    //ngx_log_debug(NGX_LOG_DEBUG_CORE, cf->log, 0, "Go here%s, %d",  __FILE__, __LINE__);
    ngx_log_debug(NGX_LOG_EMERG, cf->log, 0, "Go here, %s, %d",  __FILE__, __LINE__);
    return NGX_CONF_OK;
}



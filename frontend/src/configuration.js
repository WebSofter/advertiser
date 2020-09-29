const conf = {
    host: "wsofter.ru",
    protocol: "http",
    //host: "ctester.loc",
    //protocol: "http",
    port: "8000",
    //apiUrl: function(){ return this.host + ":" + this.port }
}

conf.url = conf.protocol + "://" + conf.host + ":" + conf.port
conf.urlApi = conf.protocol + "://" + conf.host + ":" + conf.port + "/api"
conf.urlAuth = conf.protocol + "://" + conf.host + ":" + conf.port + "/auth"
conf.urlUpload = conf.protocol + "://" + conf.host + ":" + conf.port + "/api/upload/"

export default conf
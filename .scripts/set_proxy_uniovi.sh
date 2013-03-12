#!/bin/bash
function proxyon(){
    export http_proxy="http://proxy.uniovi.es:8888/"
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    echo -e "\nProxy environment variable set."
}

function proxyoff(){
    unset HTTP_PROXY
    unset http_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset FTP_PROXY
    unset ftp_proxy
    echo -e "\nProxy environment variable removed."
} 

case $1 in
    "-s")
	proxyon;
	break;;
    "-u")
	proxyoff;
	break;;
esac


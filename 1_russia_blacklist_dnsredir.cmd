@echo off
call _common.cmd
start "" %GOODBYEDPI% -9 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist ..\russia-blacklist.txt --blacklist ..\russia-youtube.txt

@echo Copying SSL Public Key Infrastructure for QM4SSL ...
echo off
REM ****************************************************************************
REM ********  Define PKI to Qm4SSL                                  ************
REM ****************************************************************************
echo on

copy C:\student10\MQ_Topology\Keystores\SSLConfig\QM4SSL*.* "C:\IBM\WebSphere MQ\qmgrs\QM4SSL\ssl"
dir "C:\IBM\WebSphere MQ\qmgrs\QM4SSL\ssl"

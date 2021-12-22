\IBM\WebSph~1\bin\ENDMQM -i QM4SSL
@echo.
@echo ---- DELETING queue manager QM4SSL
\IBM\WebSph~1\bin\DLTMQM QM4SSL
\IBM\WebSph~1\bin\CRTMQM -u QM4SSL.DLQ -sa QM4SSL
\IBM\WebSph~1\bin\STRMQM QM4SSL
\IBM\WebSph~1\bin\RUNMQSC QM4SSL < C:\student10\MQ_Topology\Install\MQTopologyLabsQM4SSL.mqsc
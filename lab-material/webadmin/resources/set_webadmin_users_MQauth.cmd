@rem MQ authorities for ESBProfile1  (profile for web admin user - readonly access)
setmqaut -m IB9QMGR -t qmgr -p ESBProfile1 -all +connect +inq
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH -all
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH +inq
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH.default -all
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH.default +inq
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH.WorkloadManagement -all
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.AUTH.WorkloadManagement +inq
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.DEPLOY.QUEUE -all +put
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.DEPLOY.REPLY -all +get +put
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.DC.AUTH -all

@rem MQ authorities for ESBProfile2  (Profile for web admin user - update access). 
@rem Plus readonly access to Data view (+inq access on SYSTEM.BROKER.DC.AUTH queue) 
setmqaut -m IB9QMGR -t qmgr -p ESBProfile2 -all +connect +inq
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH -all
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH +inq +put +set
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH.default -all
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH.default +inq +put +set
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH.WorkloadManagement -all
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.AUTH.WorkloadManagement +inq +put +set
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.DEPLOY.QUEUE -all +put
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.DEPLOY.REPLY -all +get +put
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.DC.AUTH -all
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.DC.AUTH +inq

@rem MQ authorities for ESBProfile1 and ESBProfile2   
@rem for subscribing to Statistics
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.WEBADMIN.SUBSCRIPTION -all
setmqaut -m IB9QMGR -t queue -p ESBProfile1 -n SYSTEM.BROKER.WEBADMIN.SUBSCRIPTION +get +put
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.WEBADMIN.SUBSCRIPTION -all
setmqaut -m IB9QMGR -t queue -p ESBProfile2 -n SYSTEM.BROKER.WEBADMIN.SUBSCRIPTION +get +put
setmqaut -m IB9QMGR -t topic -p ESBProfile1 -n SYSTEM.BROKER.MB.TOPIC -all
setmqaut -m IB9QMGR -t topic -p ESBProfile1 -n SYSTEM.BROKER.MB.TOPIC +sub +pub
setmqaut -m IB9QMGR -t topic -p ESBProfile2 -n SYSTEM.BROKER.MB.TOPIC -all
setmqaut -m IB9QMGR -t topic -p ESBProfile2 -n SYSTEM.BROKER.MB.TOPIC +sub +pub
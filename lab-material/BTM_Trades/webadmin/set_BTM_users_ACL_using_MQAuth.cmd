@rem   MQ authorities for role iibAdmin3 - read/update/execute access to node and default server; read access to Record/Replay/BTM data
@rem  ---------------------------------------------------------------------------------------------------------------------------------

setmqaut -m IB10QMGR -t qmgr -p iibAdmin3 -all +connect +inq
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.AUTH -all
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.AUTH +inq +put +set
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.AUTH.default -all
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.AUTH.default +inq +put +set
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.DEPLOY.QUEUE -all +put
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.DEPLOY.REPLY -all +get +put

@rem BTM specifics for iibAdmin3 
@rem set authorities back to 0
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.DC.AUTH -all

@rem +inq = View data without full message content or exception list
@rem +put = View data plus message content and exception list
@rem +set = Ability to Replay message
setmqaut -m IB10QMGR -t queue -p iibAdmin3 -n SYSTEM.BROKER.DC.AUTH -all +inq +put



@rem   MQ authorities for role btm1Role1 - no access to node or server; read access to Record/Replay/BTM data
@rem  --------------------------------------------------------------------------------------------------------

setmqaut -m IB10QMGR -t qmgr -p btmRole1 -all +connect +inq
setmqaut -m IB10QMGR -t queue -p btmRole1 -n SYSTEM.BROKER.AUTH -all
setmqaut -m IB10QMGR -t queue -p btmRole1 -n SYSTEM.BROKER.AUTH +inq
setmqaut -m IB10QMGR -t queue -p btmRole1 -n SYSTEM.BROKER.AUTH.default -all

@rem BTM specifics for btmRole1
@rem set authorities back to 0
setmqaut -m IB10QMGR -t queue -p btmRole1 -n SYSTEM.BROKER.DC.AUTH -all

@rem +inq = View data without full message content or exception list
@rem +put = View data plus message content and exception list
@rem +set = Ability to Replay message
setmqaut -m IB10QMGR -t queue -p btmRole1 -n SYSTEM.BROKER.DC.AUTH -all +inq +put



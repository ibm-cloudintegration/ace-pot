/*
 ****************************************************************
 * Licensed Materials - Property of IBM
 * 5725-F96 IBM MessageSight
 * (C) Copyright IBM Corp. 2012, 2013.  All Rights Reserved.
 *
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with
 * IBM Corp.
 ****************************************************************
 */

package com.ibm.ima.samples.jms;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;

/**
 * Class to encapsulate the JMS message consumer logic.
 * 
 * This class contains the doSubscribe method for subscribing to JMS messages.
 * 
 */

public class JMSSampleReceive {

    /**
     * receive messages sent to the destination
     * 
     * @param config
     *            JMSSample instance containing configuration settings
     * 
     * @throws JMSException
     *             the JMS exception
     */
    public static void doReceive(JMSSample config) throws JMSException {
        int recvcount = 0;

        Session session = config.connection.createSession(false, Session.DUPS_OK_ACKNOWLEDGE);

        // The JMS Destination administered objects are loaded from a JNDI
        // repository when specified in the command line arguments.
        // Otherwise the JMS Destination is created from the session object by specifying the destination name.

        Destination dest = null;
        if (config.jndi_context != null) {
            dest = (Destination) config.retrieveFromJndi(config.jndi_context, config.destName);

            if (dest == null) {
                System.err.println("ERROR:  Unable to retrieve JNDI " + config.destType + ":  " + config.destName);
                System.exit(1);
            }

        } else {
            if ("topic".equals(config.destType))
                dest = session.createTopic(config.destName);
            else
                dest = session.createQueue(config.destName);

            if (dest == null) {
                System.err.println("ERROR:  Unable to create " + config.destType + ":  " + config.destName);
                System.exit(1);
            }
        }

        MessageConsumer consumer = null;

        // Parameter checks in JMSSample ensure isDurable is only set for topics
        if (config.isDurable) {
            consumer = session.createDurableSubscriber((Topic) dest, config.clientId);
        } else {
            consumer = session.createConsumer(dest);
        }

        config.connection.start();
        config.println("Client " + config.clientId + " ready to consume messages from " + config.destType + ": '"
                        + config.destName + "'.");

        do {
            // consumer.receive will block for 10 seconds waiting for a message
            // to arrive
            Message msg = null;
            msg = consumer.receive((config.timeout == 0) ? 10000 : config.timeout * 1000);
            if (msg != null) {
                recvcount++;
                if (recvcount == 1)
                    config.println("Client " + config.clientId + " received first message on " + config.destType + " '"
                                    + getDestName(msg) + "'");

                if (config.verbose) {
                    // Only expect to receive text messages, but check before cast.
                    if (msg instanceof TextMessage)
                        config.println("Client " + config.clientId + " received TextMessage " + recvcount + " on "
                                        + config.destType + " '" + getDestName(msg) + "': "
                                        + ((TextMessage) msg).getText());
                    else
                        config.println("Client " + config.clientId + " received Message " + recvcount + " on "
                                        + config.destType + " '" + getDestName(msg));

                }
            } else if (config.timeout > 0) {
                break;
            }
        } while (recvcount < config.count);

        config.println("Client " + config.clientId + " received " + recvcount + " messages.");

        config.connection.stop();
        consumer.close();

        if (config.deleteDurableSubscription) {
            session.unsubscribe(config.clientId);
            config.println("Client " + config.clientId + " removed durable subscription.");
        }

        session.close();
    }

    /**
     * Gets the topic name from a message.
     * 
     * @param msg
     *            The message from which the topic name is extracted.
     * 
     * @throws JMSException
     *             the jMS exception
     */
    public static String getDestName(Message msg) throws JMSException {
        String destName = null;
        Destination dest = msg.getJMSDestination();
        if ((dest != null) && (dest instanceof Queue)) {
            destName = ((Queue) dest).getQueueName();
        } else if ((dest != null) && (dest instanceof Topic)) {
            destName = ((Topic) dest).getTopicName();
        }
        return destName;
    }

}

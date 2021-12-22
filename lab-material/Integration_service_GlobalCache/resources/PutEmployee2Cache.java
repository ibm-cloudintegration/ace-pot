package com.ibm.betaworks;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;

import org.omg.CORBA.Environment;

import com.ibm.betaworks.EMPLOYEEType;
import com.ibm.broker.javacompute.MbJavaComputeNode;
import com.ibm.broker.plugin.MbElement;
import com.ibm.broker.plugin.MbException;
import com.ibm.broker.plugin.MbGlobalMap;
import com.ibm.broker.plugin.MbMessage;
import com.ibm.broker.plugin.MbMessageAssembly;
import com.ibm.broker.plugin.MbOutputTerminal;
import com.ibm.broker.plugin.MbUserException;

public class PutEmployee2Cache extends MbJavaComputeNode {
	
  public static void evaluate(MbElement dBRow)  
    {							
     try
      {
	JAXBContext jaxbContext = JAXBContext.newInstance("com.ibm.betaworks");

	// Obtain the row data passed from ESQL using the JAXB class EMPLOYEEType
	EMPLOYEEType dBEmployee = (
				   (JAXBElement<EMPLOYEEType>) 
				  jaxbContext.createUnmarshaller().unmarshal(
					dBRow.getDOMNode(), EMPLOYEEType.class)
				   ).getValue();

        EMPLOYEEType cachedEmployee = new EMPLOYEEType();       
	        
        cachedEmployee = dBEmployee;
	        
	 // For XC10
	 //MbGlobalMap xc10Map = MbGlobalMap.getGlobalMap("userXXdatagrid","CS_XC10DATAGRID");
	 //xc10Map.put(EMPNO, dBEmployee ); 
	
	// Establish connection with Map called "aliveUntilRestart"
	MbGlobalMap globalMap=MbGlobalMap.getGlobalMap("aliveUntilRestart");
	
			
	// Set the key 
	String EMPNO;		
	EMPNO = dBEmployee.getEMPNO();
	
	// Put the data to the cache 
	globalMap.put(EMPNO, (EMPLOYEEType) cachedEmployee);
	
 	return;
		
       }
	catch (JAXBException e)
	 {
	  // TODO Auto-generated catch block
		
	    try {
			throw e;
		} catch (JAXBException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	 }
        catch (MbException f) 
	 {
	  // Re-throw to allow Broker handling of MbException
        	try {
    			throw f;
    		} catch (MbException f1) {
    			// TODO Auto-generated catch block
    			f1.printStackTrace();
    		}
	 }
	catch (RuntimeException g) 
	 {
	 // Re-throw to allow Broker handling of RuntimeException
	 throw g;
	 } 
		
   }

 @Override
 public void evaluate(MbMessageAssembly arg0) throws MbException 
  {
   // TODO Auto-generated method stub		
  }
}
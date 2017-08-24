package test.queues;        

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.QueueBrowser;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueReceiver;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class JMSTester_Kohl 
{ 
	public static void main(String[] args) 
	{ 
		//Class initialization
		Context ctx = null;
		QueueConnection connection = null;
		Queue inQueue = null;
		QueueSession session = null;
		boolean transacted = false;

		// Initialize properties for corba connection
		Properties p = new Properties();

		p.put(Context.INITIAL_CONTEXT_FACTORY,"com.ibm.websphere.naming.WsnInitialContextFactory");
		//PROVIDER_URL: corbaloc:iiop::
		p.put(Context.PROVIDER_URL, "corbaloc:iiop:9.109.122.72:2809");   
		p.put("com.ibm.CORBA.ORBInit", "com.ibm.ws.sib.client.ORB");

		System.out.println("put env - finished");

		try 
		{
			ctx = new InitialContext(p);
			if (null != ctx)
				System.out.println("Got naming context");

			//Get the Queue Connection Factory
			QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory) ctx.lookup("AGENT_QCF");


			//Get the actual queue
			inQueue = (Queue) ctx.lookup("CREATE_ORDER");

			//Start the Connection
			connection = queueConnectionFactory.createQueueConnection();
			connection.start();

			//Create a transacted session
			session = connection.createQueueSession(transacted, Session.AUTO_ACKNOWLEDGE);

			//Create a queue browser
			QueueBrowser qb = session.createBrowser(inQueue);

			//Send a JMS Queue Message
			QueueSender queueSender = session.createSender(inQueue);
			
			// Set the num of orders to be created here
			int ORDER_COUNT=2;

			/* Input XML: Create order 
			 * Assumption: same order created multiple time here i.e the same 
			 * */
			String xmlInput = "<Order Action=\"CREATE\" DocumentType=\"0001\" EnterpriseCode=\"Matrix-R\" PaymentStatus=\"AUTHORIZED\" > <OrderLines> <OrderLine OrderedQty=\"1\" > <Item ItemID=\"100001\" UnitOfMeasure=\"EACH\" /> </OrderLine> </OrderLines> <PersonInfoBillTo AddressLine1=\"1775\" AddressLine2=\"\" City=\"Tewksbury\" Company=\"\" Country=\"US\" DayPhone=\"\" Department=\"QA\" EMailID=\"sh@yantra.com\" FirstName=\"shfirst\" JobTitle=\"\" LastName=\"shlast\" MiddleName=\"\" State=\"MA\" ZipCode=\"01876\" /> <PersonInfoShipTo AddressLine1=\"1775\" AddressLine2=\"\" City=\"Tewksbury\" Company=\"\" Country=\"US\" DayPhone=\"\" Department=\"QA\" EMailID=\"sh@yantra.com\" FirstName=\"shfirst\" JobTitle=\"\" LastName=\"shlast\" MiddleName=\"\" State=\"MA\" ZipCode=\"01876\" /> </Order>";
			TextMessage outMessage;
			
			for(int i=0; i<ORDER_COUNT; i++)
			{
				System.out.println("-- Push new Order XML to the queue --");
				System.out.println(xmlInput);
				
				// create text msg with the xmlInput
				outMessage = session.createTextMessage(xmlInput);
				
				//Send createOrder XML message
				queueSender.send(outMessage);
			}

		} 
		
		catch (NamingException e) { 
			e.printStackTrace();
		} 
		
		catch (JMSException e) {
			e.printStackTrace();
		}
	}
}

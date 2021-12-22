import com.ibm.broker.javacompute.MbJavaComputeNode;
import com.ibm.broker.plugin.*;


public class Test_propagate_loop_Checkauthority extends MbJavaComputeNode {

	public void evaluate(MbMessageAssembly assembly) throws MbException {
		MbOutputTerminal out = getOutputTerminal("out");
		MbOutputTerminal alt = getOutputTerminal("alternate");

		MbMessage message = assembly.getMessage();

		try {
			// ----------------------------------------------------------
			// Add user code below

			// End of user code
			// ----------------------------------------------------------

			// The following should only be changed
			// if not propagating message to the 'out' terminal
			out.propagate(assembly);

		} catch (Throwable e) {
			// Example Exception handling	
			MbUserException mbue = new MbUserException(this, "evaluate()", "",
					"", e.toString(), null);
			throw mbue;
		}
	}

}

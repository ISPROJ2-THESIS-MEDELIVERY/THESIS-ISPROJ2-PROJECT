package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Dispatcher;

public interface DispatcherDAO {
	public void addDispatcher ( Dispatcher dispatcher );
	public void deleteDispatcher ( int dispatcherId );
	public void updateDispatcher ( Dispatcher dispatcher );
	public List<Dispatcher> getAllDispatchers();
	public Dispatcher getDispatcherById ( int dispatcherId );
}

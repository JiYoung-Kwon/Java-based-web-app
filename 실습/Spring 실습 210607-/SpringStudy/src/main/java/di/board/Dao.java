package di.board;

import java.util.List;

public interface Dao {
	public int insert(Object o); //C
	public List<Object> select(Object o); //R
	public int update(Object o); //U
	public int delete(Object o); //D
}

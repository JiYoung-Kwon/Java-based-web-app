package di.board;

import org.springframework.beans.factory.annotation.Autowired;

public class BoardService {
	
	@Autowired
	BoardDao bdao;
	
	@Autowired
	FileDao fdao;

	/*
	 * public void setBdao(BoardDao bdao) { this.bdao = bdao; }
	 * 
	 * public void setFdao(FileDao fdao) { this.fdao = fdao; }
	 */

	public void output() {
		bdao.select(null);
		bdao.insert(null);
		fdao.update(null);
		fdao.delete(null);
	}
}

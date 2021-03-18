package ch16.objectStream;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.BadLocationException;
import javax.swing.text.Element;

public class ServerController implements Runnable {
	ServerFrame sf;
	ServerSocket serverSocket;
	List<ServerReceiveThread> clients;
	Element root = null;
	Element element = null;
	Data data = new Data();

	public ServerController(ServerFrame sf) {
		this.sf = sf;
		String port = sf.getTfPort().getText();
		String msg = "";
		clients = new ArrayList<ServerReceiveThread>();
		root = sf.document.getRootElements()[0];
		element = root.getElement(0);
		try {
			serverSocket = new ServerSocket(Integer.parseInt(port));
			msg = "<font color = 'blue'>서버가 시작되었습니다.</font>";

			sf.document.insertBeforeEnd(element, msg);
			sf.getTextPane().setCaretPosition(sf.document.getLength());
			// sf.getTextPane().setText(msg);

			sf.getBtnStop().setEnabled(true);
			sf.getBtnStart().setEnabled(false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "<font color = 'red'>서버 시작 중 오류 발생</font>";

			try {
				sf.document.insertBeforeEnd(element, msg);
			} catch (Exception e1) {
				e1.printStackTrace();

			}
			sf.getTextPane().setCaretPosition(sf.document.getLength());
			// sf.getTextPane().setText(msg);
			sf.getBtnStop().setEnabled(false);
			sf.getBtnStart().setEnabled(true);
		}
	}

	@Override
	public void run() {

		while (true) {

			try {
				Socket socket = serverSocket.accept(); // blocking mode로 대기하다가 접속이 되면 소켓 생성

				String msg = "<div class = 'left'>새로운 클라이언트가 접속되었습니다.</div>";
				sf.document.insertBeforeEnd(element, msg);

				ServerReceiveThread srt = new ServerReceiveThread(sf, socket, ServerController.this);

				Thread t = new Thread(srt);
				t.start();

				clients.add(srt);
			} catch (Exception e) {
				e.printStackTrace();
				String msg = "<font color = 'red'>클라이언트 접속 중 오류 발생</font>";
				try {
					sf.document.insertBeforeEnd(element, msg);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				// sf.getTextPane().setText(msg);
			}
		}

	}

	// 접속되어 있는 모든 클라이언트에게 메세지 전송
	public void sendAll(Data data) {
		try {
			for (ServerReceiveThread srt : clients) {
				srt.sendMsg(data);
			}

			String msg = String.format("<div class = 'right'>%s</div>", data.getMsg());
			sf.document.insertBeforeEnd(element, msg);
			sf.getTextPane().setCaretPosition(sf.document.getLength());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

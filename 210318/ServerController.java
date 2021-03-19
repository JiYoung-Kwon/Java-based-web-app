package ch16.objectStream;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
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

	boolean threadFlag = true;

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

		while (threadFlag) {

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
				//나 자신에게는 모든 유저의 아이디값을 users에 담아 전달		
				srt.sendMsg(data);
			}

			String msg = String.format("<div class = 'right'>%s</div>", data.getMsg());
			sf.document.insertBeforeEnd(element, msg);
			sf.getTextPane().setCaretPosition(sf.document.getLength());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void serverStop() {
		//모든 접속자에게 서버 종료 사실을 전달할 데이터
		Data data = new Data();
		data.setId("server");
		data.setCommand("shutdown");
		data.setMsg("서버를 종료합니다.");	

		// 4) 스레드 중지
		threadFlag = false;
		String ip = sf.getTfServerIP().getText();
		int port = Integer.parseInt(sf.getTfPort().getText());

		try {
			Socket socket = new Socket(ip, port);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (ServerReceiveThread srt : clients) {
			srt.sendMsg(data); // 1) shutdown 메시지 전달
			srt.threadFlag = false; // 5) ServerReceiveThread 반복문 중지
		}
		
		//3) clients collection 초기화
		clients.clear();
		
		//6) 버튼 활성화/비활성화 처리
		sf.getBtnStart().setEnabled(true);
		sf.getBtnStop().setEnabled(false);
		sf.getBtnSend().setEnabled(false);
		
		//2) 접속자 명단을 모두 초기화
		sf.listModel.clear();
		sf.getList().setModel(sf.listModel);
	}
}

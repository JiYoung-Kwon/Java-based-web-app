package ch16;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerController implements Runnable {
	ServerFrame sf;
	ServerSocket serverSocket;

	public ServerController(ServerFrame sf) {
		this.sf = sf;
		String port = sf.getTfPort().getText();
		String msg = "";
		try {
			serverSocket = new ServerSocket(Integer.parseInt(port));
			msg = "<font color = 'blue'>서버가 시작되었습니다.</font>";
			sf.getTextPane().setText(msg);
			sf.getBtnStop().setEnabled(true);
			sf.getBtnStart().setEnabled(false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "<font color = 'red'>서버 시작 중 오류 발생</font>";
			sf.getTextPane().setText(msg);
			sf.getBtnStop().setEnabled(false);
			sf.getBtnStart().setEnabled(true);
		}
	}

	@Override
	public void run() {
		while(true) {
			try {
				Socket socket = serverSocket.accept(); //blocking mode로 대기하다가 접속이 되면 소켓 생성
				sf.getTextPane().setText("새로운 클라이언트가 접속되었습니다.");
				
				ServerReceiveThread srt = new ServerReceiveThread(sf,socket);
				
				Thread t = new Thread(srt);
				t.start();
			}
			catch(Exception e) {
				e.printStackTrace();
				String msg = "<font color = 'red'>클라이언트 접속 중 오류 발생</font>";
				sf.getTextPane().setText(msg);
			}
		}
		
	}

}

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
			msg = "<font color = 'blue'>������ ���۵Ǿ����ϴ�.</font>";
			sf.getTextPane().setText(msg);
			sf.getBtnStop().setEnabled(true);
			sf.getBtnStart().setEnabled(false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "<font color = 'red'>���� ���� �� ���� �߻�</font>";
			sf.getTextPane().setText(msg);
			sf.getBtnStop().setEnabled(false);
			sf.getBtnStart().setEnabled(true);
		}
	}

	@Override
	public void run() {
		while(true) {
			try {
				Socket socket = serverSocket.accept(); //blocking mode�� ����ϴٰ� ������ �Ǹ� ���� ����
				sf.getTextPane().setText("���ο� Ŭ���̾�Ʈ�� ���ӵǾ����ϴ�.");
				
				ServerReceiveThread srt = new ServerReceiveThread(sf,socket);
				
				Thread t = new Thread(srt);
				t.start();
			}
			catch(Exception e) {
				e.printStackTrace();
				String msg = "<font color = 'red'>Ŭ���̾�Ʈ ���� �� ���� �߻�</font>";
				sf.getTextPane().setText(msg);
			}
		}
		
	}

}

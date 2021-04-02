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
			msg = "<font color = 'blue'>������ ���۵Ǿ����ϴ�.</font>";

			sf.document.insertBeforeEnd(element, msg);
			sf.getTextPane().setCaretPosition(sf.document.getLength());
			// sf.getTextPane().setText(msg);

			sf.getBtnStop().setEnabled(true);
			sf.getBtnStart().setEnabled(false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "<font color = 'red'>���� ���� �� ���� �߻�</font>";

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
				Socket socket = serverSocket.accept(); // blocking mode�� ����ϴٰ� ������ �Ǹ� ���� ����

				String msg = "<div class = 'left'>���ο� Ŭ���̾�Ʈ�� ���ӵǾ����ϴ�.</div>";
				sf.document.insertBeforeEnd(element, msg);

				ServerReceiveThread srt = new ServerReceiveThread(sf, socket, ServerController.this);

				Thread t = new Thread(srt);
				t.start();

				clients.add(srt);
			} catch (Exception e) {
				e.printStackTrace();
				String msg = "<font color = 'red'>Ŭ���̾�Ʈ ���� �� ���� �߻�</font>";
				try {
					sf.document.insertBeforeEnd(element, msg);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				// sf.getTextPane().setText(msg);
			}
		}

	}

	// ���ӵǾ� �ִ� ��� Ŭ���̾�Ʈ���� �޼��� ����
	public void sendAll(Data data) {
		try {
			for (ServerReceiveThread srt : clients) {
				//�� �ڽſ��Դ� ��� ������ ���̵��� users�� ��� ����		
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
		//��� �����ڿ��� ���� ���� ����� ������ ������
		Data data = new Data();
		data.setId("server");
		data.setCommand("shutdown");
		data.setMsg("������ �����մϴ�.");	

		// 4) ������ ����
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
			srt.sendMsg(data); // 1) shutdown �޽��� ����
			srt.threadFlag = false; // 5) ServerReceiveThread �ݺ��� ����
		}
		
		//3) clients collection �ʱ�ȭ
		clients.clear();
		
		//6) ��ư Ȱ��ȭ/��Ȱ��ȭ ó��
		sf.getBtnStart().setEnabled(true);
		sf.getBtnStop().setEnabled(false);
		sf.getBtnSend().setEnabled(false);
		
		//2) ������ ������ ��� �ʱ�ȭ
		sf.listModel.clear();
		sf.getList().setModel(sf.listModel);
	}
}
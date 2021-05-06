package ch16.objectStream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

import javax.swing.text.Element;
import javax.swing.text.StyledDocument;

public class ServerReceiveThread implements Runnable {// extends Thread

	ServerFrame sf;
	ServerController sc;

	ObjectOutputStream oos;
	ObjectInputStream ois;

	Element root = null;
	Element element = null;
	boolean threadFlag = true;

	public ServerReceiveThread(ServerFrame sf, Socket socket, ServerController sc) {
		this.sf = sf;
		this.sc = sc;
		try {
			OutputStream os = socket.getOutputStream();
			oos = new ObjectOutputStream(os);

			InputStream is = socket.getInputStream();
			ois = new ObjectInputStream(is);

			root = sf.document.getRootElements()[0];
			element = root.getElement(0);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void run() {

		while (threadFlag) {
			try {
				Data data = (Data) ois.readObject();

				switch (data.getCommand()) {
				case "login": // 새로운 유저 추가
					sf.listModel.addElement(data.getId());
					sf.getList().setModel(sf.listModel);
					
					Object[] users = sf.listModel.toArray();
					data.setUsers(users);
					
					break;
				case "logout":
					threadFlag = false; // 중요! - 자신과 연결되어있는 client와의 연결이 끊어짐 -> 더 이상 처리할 필요가 없음
					sf.listModel.removeElement(data.getId());
					sf.getList().setModel(sf.listModel);

					sc.clients.remove(this); // 자기 자신 스레드를 clients에서 remove
					break;
				}
				sc.sendAll(data); // 모든 유저에게 누가 로그아웃했는지 알려줌

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		try {// stream을 닫아주지 않으면 통신이 계속됨 -> 닫아주기
			ois.close();
			oos.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void sendMsg(Data data) {

		try {
			oos.writeObject(data);
			oos.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}

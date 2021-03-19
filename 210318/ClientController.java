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
import java.util.Arrays;
import java.util.List;

import javax.swing.DefaultListModel;
import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.StyledDocument;

public class ClientController implements Runnable {
	ClientFrame cf;

	ObjectOutputStream oos;
	ObjectInputStream ois;

	Element root = null;
	Element element = null;

	boolean threadFlag = true;

	public ClientController(ClientFrame cf) {
		this.cf = cf;
		String ip = cf.getTfServerIP().getText();
		int port = Integer.parseInt(cf.getTfPort().getText());

		try {
			Socket socket = new Socket(ip, port);

			OutputStream os = socket.getOutputStream();
			oos = new ObjectOutputStream(os);

			InputStream is = socket.getInputStream();
			ois = new ObjectInputStream(is);

			root = cf.document.getRootElements()[0];
			element = root.getElement(0);

			Data data = new Data();
			data.setId(cf.getTfId().getText());
			data.setCommand("login");
			data.setMsg("�α����Ͽ����ϴ�");
			sendMsg(data);

		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<font color = 'red'>���� ���� �� ���� �߻�</font>";

			try {
				cf.document.insertBeforeEnd(element, msg);
				cf.getTextPane().setCaretPosition(cf.document.getLength());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	public void sendMsg(Data data) {

		try {
			oos.writeObject(data);
			oos.flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void run() {
		// �����͸� receive�ϴ� �κ�
		while (threadFlag) {
			try {
				Data data = (Data) ois.readObject();

				String msg = "";
				if (data.getId().equals(cf.getTfId().getText())) {
					msg = String.format("<div class='%s'>%s:%s</div>", "right", data.getId(), data.getMsg());
				} else
					msg = String.format("<div class='%s'>%s:%s</div>", "left", data.getId(), data.getMsg());
				cf.document.insertBeforeEnd(element, msg);

				switch (data.getCommand()) {
				case "login":

					// �ڽ��� �α����� ���� �ٸ� ������ �α��� �� ��� �и�
					if (data.getId().equals(cf.getTfId().getText())) {
						List users = Arrays.asList(data.getUsers());
						cf.listModel.addAll(users);
						cf.getList().setModel(cf.listModel);
					} else { //�ٸ� ���� �α���
						cf.listModel.addElement(data.getId());
						cf.getList().setModel(cf.listModel);

					}
					break;

				case "logout":
					cf.listModel.removeElement(data.getId());
					cf.getList().setModel(cf.listModel);
					if (data.getId().equals(cf.getTfId().getText())) {
						threadFlag = false;
						ois.close();
						oos.close();
					}
					break;

				case "shutdown":
					threadFlag = false;
					ois.close();
					oos.close();
					break;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void disConnect() {
		Data data = new Data();
		data.setId(cf.getTfId().getText());
		data.setId(cf.getTfId().getText());
		data.setCommand("logout");
		data.setMsg("������ ����~");

		sendMsg(data);

	}
}

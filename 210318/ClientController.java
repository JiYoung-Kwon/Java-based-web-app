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

import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.StyledDocument;

public class ClientController implements Runnable {
	ClientFrame cf;

	ObjectOutputStream oos;
	ObjectInputStream ois;
	
	Element root = null;
	Element element = null;

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
			data.setMsg("로그인하였습니다");
			sendMsg(data);
			

		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<font color = 'red'>서버 접속 시 오류 발생</font>";

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
		// 데이터를 receive하는 부분
		while (true) {
			try {
				Data data = (Data)ois.readObject();
				String msg = "";
				if(data.getId().equals(cf.getTfId().getText())) {
					msg = String.format("<div class='%s'>%s:%s</div>", "right",data.getId(),data.getMsg());
				}
				else
					msg = String.format("<div class='%s'>%s:%s</div>", "left",data.getId(),data.getMsg());
				cf.document.insertBeforeEnd(element, msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}

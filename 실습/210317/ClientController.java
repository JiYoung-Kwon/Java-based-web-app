package ch16;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.StyledDocument;

public class ClientController implements Runnable {
	ClientFrame cf;

	BufferedWriter send; // 전송
	BufferedReader receive; // 수신

	Element root = null;
	Element element = null;

	public ClientController(ClientFrame cf) {
		this.cf = cf;
		String ip = cf.getTfServerIP().getText();
		int port = Integer.parseInt(cf.getTfPort().getText());

		try {
			Socket socket = new Socket(ip, port);

			OutputStream os = socket.getOutputStream();
			OutputStreamWriter ow = new OutputStreamWriter(os);
			send = new BufferedWriter(ow);

			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			receive = new BufferedReader(isr);

			sendMsg("<div>권지영님이 접속하셨습니다.</div>");
			
			root = cf.document.getRootElements()[0];
			element = root.getElement(0);
			

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

	public void sendMsg(String msg) {

		try {
			send.write(msg); // 버퍼에 데이터를 담기
			send.write("\n"); // 개행문자 추가
			send.flush(); // 모두 송신 후 버퍼를 깨끗하게 비워라
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
				String msg = receive.readLine();
				//StyledDocument sd = cf.getTextPane().getStyledDocument();
				//sd.insertString(sd.getLength(), msg, null);
				cf.document.insertBeforeEnd(element, msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}

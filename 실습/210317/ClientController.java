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

	BufferedWriter send; // ����
	BufferedReader receive; // ����

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

			sendMsg("<div>���������� �����ϼ̽��ϴ�.</div>");
			
			root = cf.document.getRootElements()[0];
			element = root.getElement(0);
			

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

	public void sendMsg(String msg) {

		try {
			send.write(msg); // ���ۿ� �����͸� ���
			send.write("\n"); // ���๮�� �߰�
			send.flush(); // ��� �۽� �� ���۸� �����ϰ� �����
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void run() {
		// �����͸� receive�ϴ� �κ�
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

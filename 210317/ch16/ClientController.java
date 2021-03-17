package ch16;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class ClientController implements Runnable {
	ClientFrame cf;

	BufferedWriter send; // ����
	BufferedReader receive; // ����

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

		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<font color = 'red'>���� ���� �� ���� �߻�</font>";
			cf.getTextPane().setText(msg);
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
		// TODO Auto-generated method stub

	}
}

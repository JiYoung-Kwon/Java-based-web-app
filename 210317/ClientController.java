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

	BufferedWriter send; // 전송
	BufferedReader receive; // 수신

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

		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<font color = 'red'>서버 접속 시 오류 발생</font>";
			cf.getTextPane().setText(msg);
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
		// TODO Auto-generated method stub

	}
}

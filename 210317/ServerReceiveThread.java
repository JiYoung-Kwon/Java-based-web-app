package ch16;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

import javax.swing.text.Element;
import javax.swing.text.StyledDocument;

public class ServerReceiveThread implements Runnable {// extends Thread

	ServerFrame sf;
	ServerController sc;
	BufferedWriter send;
	BufferedReader receive;
	Element root = null;
	Element element = null;
	
	
	public ServerReceiveThread(ServerFrame sf, Socket socket, ServerController sc) {
		this.sf = sf;
		this.sc = sc;
		try {
			OutputStream os = socket.getOutputStream();
			OutputStreamWriter osr = new OutputStreamWriter(os);
			send = new BufferedWriter(osr);

			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			receive = new BufferedReader(isr);

			root = sf.document.getRootElements()[0];
			element = root.getElement(0);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void run() {
		while (true) {
			try {
				String msg = receive.readLine();
				System.out.println(msg);
				
				//StyledDocument doc = sf.getTextPane().getStyledDocument(); // textPane의 스타일 도큐멘트를 가져오면 css 등의 특성을 가지고 있음
				//doc.insertString(doc.getLength(), msg, null);		
				sc.sendAll(msg);
				
				sf.document.insertBeforeEnd(element, msg);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

	}

	public void sendMsg(String msg) {

		try {
			send.write(msg);
			send.write("\n");
			send.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

}

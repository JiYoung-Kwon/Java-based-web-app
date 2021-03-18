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
		while (true) {
			try {
				Data data = (Data)ois.readObject();					
				sc.sendAll(data);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
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

package ch10;

import java.awt.Font;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;

public class Watch extends JFrame {
	public Watch() {
		setTitle("��������ð�");
		setBounds(300, 300, 500, 100);
		setVisible(true);

		JLabel label = new JLabel();
		label.setFont(new Font("�ü�",3,30));
		// label.setHorizontalAlignment(JLabel.CENTER);
		add(label);
		Time time = new Time();

		Thread thread = new Thread(new Runnable() {
			public void run() {
				while (true) {
					try {
						String now = time.getTime();
						label.setText(now);
						Thread.sleep(1);
					} catch (Exception ex) {

					}
				}
			}
		});
		thread.start(); //�����·� �ִٰ� �ڱ� ���ʰ� ���� run() ȣ��
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Watch();
	}

}

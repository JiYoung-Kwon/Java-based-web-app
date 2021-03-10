package ch10;

import java.awt.Font;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;

public class Watch extends JFrame {
	public Watch() {
		setTitle("내가만든시계");
		setBounds(300, 300, 500, 100);
		setVisible(true);

		JLabel label = new JLabel();
		label.setFont(new Font("궁서",3,30));
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
		thread.start(); //대기상태로 있다가 자기 차례가 오면 run() 호출
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Watch();
	}

}

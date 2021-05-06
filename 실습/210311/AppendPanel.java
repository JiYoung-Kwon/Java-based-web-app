package ch11;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class AppendPanel extends JPanel {
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private JTextField tfId;
	private JLabel lblNewLabel_1_1;
	private JTextField tfIrum;
	private JLabel lblNewLabel_1_2;
	private JTextField tfPhone;
	private JTextField tfAddress;
	private JLabel lblNewLabel_1_2_1;
	private JButton btnNewButton;

	/**
	 * Create the panel.
	 */
	public AppendPanel() {
		setLayout(null);
		add(getLblNewLabel());
		add(getLblNewLabel_1());
		add(getTfId());
		add(getLblNewLabel_1_1());
		add(getTfIrum());
		add(getLblNewLabel_1_2());
		add(getTfPhone());
		add(getTfAddress());
		add(getLblNewLabel_1_2_1());
		add(getBtnNewButton());

	}
	public JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("\uD68C\uC6D0\uCD94\uAC00");
			lblNewLabel.setOpaque(true);
			lblNewLabel.setFont(new Font("³ª´®°íµñ", Font.PLAIN, 20));
			lblNewLabel.setBackground(Color.PINK);
			lblNewLabel.setBounds(10, 11, 421, 35);
		}
		return lblNewLabel;
	}
	public JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("\uC544\uC774\uB514");
			lblNewLabel_1.setBounds(20, 61, 45, 21);
		}
		return lblNewLabel_1;
	}
	public JTextField getTfId() {
		if (tfId == null) {
			tfId = new JTextField();
			tfId.setColumns(10);
			tfId.setBounds(78, 61, 166, 20);
		}
		return tfId;
	}
	public JLabel getLblNewLabel_1_1() {
		if (lblNewLabel_1_1 == null) {
			lblNewLabel_1_1 = new JLabel("\uC131\uBA85");
			lblNewLabel_1_1.setBounds(20, 84, 45, 21);
		}
		return lblNewLabel_1_1;
	}
	public JTextField getTfIrum() {
		if (tfIrum == null) {
			tfIrum = new JTextField();
			tfIrum.setColumns(10);
			tfIrum.setBounds(78, 84, 166, 20);
		}
		return tfIrum;
	}
	public JLabel getLblNewLabel_1_2() {
		if (lblNewLabel_1_2 == null) {
			lblNewLabel_1_2 = new JLabel("\uC5F0\uB77D\uCC98");
			lblNewLabel_1_2.setBounds(20, 107, 45, 21);
		}
		return lblNewLabel_1_2;
	}
	public JTextField getTfPhone() {
		if (tfPhone == null) {
			tfPhone = new JTextField();
			tfPhone.setColumns(10);
			tfPhone.setBounds(78, 107, 166, 20);
		}
		return tfPhone;
	}
	public JTextField getTfAddress() {
		if (tfAddress == null) {
			tfAddress = new JTextField();
			tfAddress.setColumns(10);
			tfAddress.setBounds(78, 130, 331, 20);
		}
		return tfAddress;
	}
	public JLabel getLblNewLabel_1_2_1() {
		if (lblNewLabel_1_2_1 == null) {
			lblNewLabel_1_2_1 = new JLabel("\uC8FC\uC18C");
			lblNewLabel_1_2_1.setBounds(20, 130, 45, 21);
		}
		return lblNewLabel_1_2_1;
	}
	public JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("\uC800\uC7A5");
			btnNewButton.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					String mId = tfId.getText();
					String mIrum = tfIrum.getText();
					String mPhone = tfPhone.getText();
					String mAddress = tfAddress.getText();
					
					//System.out.println(mId + mIrum + mPhone+ mAddress);
					
					Member m = new Member(mId, mIrum, mPhone, mAddress);
					MemberController mc = new MemberController();
					String msg = mc.append(m);
					
					JOptionPane.showMessageDialog(AppendPanel.this, msg);
				}
			});
			btnNewButton.setBounds(78, 161, 89, 23);
		}
		return btnNewButton;
	}
}

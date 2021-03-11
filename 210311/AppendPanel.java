package ch11;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.awt.Color;
import javax.swing.JFormattedTextField;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class AppendPanel extends JPanel {
	private JTextField tfId;
	private JTextField tfIrum;
	private JTextField tfPhone;
	private JTextField tfAddress;

	/**
	 * Create the panel.
	 */
	public AppendPanel() {
		setLayout(null);
		
		JButton btnNewButton = new JButton("\uC800\uC7A5");
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
		btnNewButton.setBounds(80, 160, 89, 23);
		add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("\uD68C\uC6D0\uCD94\uAC00");
		lblNewLabel.setOpaque(true);
		lblNewLabel.setBackground(Color.PINK);
		lblNewLabel.setFont(new Font("³ª´®°íµñ", Font.PLAIN, 20));
		lblNewLabel.setBounds(12, 10, 421, 35);
		add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("\uC544\uC774\uB514");
		lblNewLabel_1.setBounds(22, 60, 45, 21);
		add(lblNewLabel_1);
		
		tfId = new JTextField();
		tfId.setBounds(80, 60, 166, 20);
		add(tfId);
		tfId.setColumns(10);
		
		JLabel lblNewLabel_1_1 = new JLabel("\uC131\uBA85");
		lblNewLabel_1_1.setBounds(22, 83, 45, 21);
		add(lblNewLabel_1_1);
		
		tfIrum = new JTextField();
		tfIrum.setColumns(10);
		tfIrum.setBounds(80, 83, 166, 20);
		add(tfIrum);
		
		JLabel lblNewLabel_1_2 = new JLabel("\uC5F0\uB77D\uCC98");
		lblNewLabel_1_2.setBounds(22, 106, 45, 21);
		add(lblNewLabel_1_2);
		
		tfPhone = new JTextField();
		tfPhone.setColumns(10);
		tfPhone.setBounds(80, 106, 166, 20);
		add(tfPhone);
		
		tfAddress = new JTextField();
		tfAddress.setColumns(10);
		tfAddress.setBounds(80, 129, 331, 20);
		add(tfAddress);
		
		JLabel lblNewLabel_1_2_1 = new JLabel("\uC8FC\uC18C");
		lblNewLabel_1_2_1.setBounds(22, 129, 45, 21);
		add(lblNewLabel_1_2_1);

	}
}

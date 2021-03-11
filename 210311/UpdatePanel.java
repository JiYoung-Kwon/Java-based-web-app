package ch11;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JSeparator;

public class UpdatePanel extends JPanel {
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;

	/**
	 * Create the panel.
	 */
	public UpdatePanel() {
		setLayout(null);
		
		JButton btnNewButton = new JButton("\uAC80\uC0C9");
		btnNewButton.setBounds(196, 57, 89, 23);
		add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("\uD68C\uC6D0\uC218\uC815");
		lblNewLabel.setOpaque(true);
		lblNewLabel.setFont(new Font("³ª´®°íµñ", Font.PLAIN, 20));
		lblNewLabel.setBackground(Color.ORANGE);
		lblNewLabel.setBounds(10, 11, 421, 35);
		add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("\uC544\uC774\uB514");
		lblNewLabel_1.setBounds(30, 95, 45, 21);
		add(lblNewLabel_1);
		
		textField = new JTextField();
		textField.setColumns(10);
		textField.setBounds(88, 95, 166, 20);
		add(textField);
		
		JLabel lblNewLabel_1_1 = new JLabel("\uC131\uBA85");
		lblNewLabel_1_1.setBounds(30, 118, 45, 21);
		add(lblNewLabel_1_1);
		
		textField_1 = new JTextField();
		textField_1.setColumns(10);
		textField_1.setBounds(88, 118, 166, 20);
		add(textField_1);
		
		JLabel lblNewLabel_1_2 = new JLabel("\uC5F0\uB77D\uCC98");
		lblNewLabel_1_2.setBounds(30, 141, 45, 21);
		add(lblNewLabel_1_2);
		
		textField_2 = new JTextField();
		textField_2.setColumns(10);
		textField_2.setBounds(88, 141, 166, 20);
		add(textField_2);
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		textField_3.setBounds(88, 164, 331, 20);
		add(textField_3);
		
		JLabel lblNewLabel_1_2_1 = new JLabel("\uC8FC\uC18C");
		lblNewLabel_1_2_1.setBounds(30, 164, 45, 21);
		add(lblNewLabel_1_2_1);
		
		textField_4 = new JTextField();
		textField_4.setBounds(20, 58, 166, 20);
		add(textField_4);
		textField_4.setColumns(10);
		
		JSeparator separator = new JSeparator();
		separator.setBounds(10, 85, 421, 2);
		add(separator);
		
		JButton btnNewButton_1 = new JButton("\uC218\uC815");
		btnNewButton_1.setBounds(88, 195, 89, 23);
		add(btnNewButton_1);

	}
}

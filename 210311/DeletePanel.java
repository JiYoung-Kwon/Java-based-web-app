package ch11;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JSeparator;
import java.awt.SystemColor;

public class DeletePanel extends JPanel {
	private JButton btnNewButton;
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private JTextField textField;
	private JLabel lblNewLabel_1_1;
	private JTextField textField_1;
	private JLabel lblNewLabel_1_2;
	private JTextField textField_2;
	private JTextField textField_3;
	private JLabel lblNewLabel_1_2_1;
	private JTextField textField_4;
	private JSeparator separator;
	private JButton btnNewButton_1;

	/**
	 * Create the panel.
	 */
	public DeletePanel() {
		setLayout(null);
		add(getBtnNewButton());
		add(getLblNewLabel());
		add(getLblNewLabel_1());
		add(getTextField());
		add(getLblNewLabel_1_1());
		add(getTextField_1());
		add(getLblNewLabel_1_2());
		add(getTextField_2());
		add(getTextField_3());
		add(getLblNewLabel_1_2_1());
		add(getTextField_4());
		add(getSeparator());
		add(getBtnNewButton_1());

	}

	public JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("\uAC80\uC0C9");
			btnNewButton.setBounds(196, 57, 89, 23);
		}
		return btnNewButton;
	}
	public JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("\uD68C\uC6D0\uC0AD\uC81C");
			lblNewLabel.setOpaque(true);
			lblNewLabel.setFont(new Font("³ª´®°íµñ", Font.PLAIN, 20));
			lblNewLabel.setBackground(new Color(255, 51, 102));
			lblNewLabel.setBounds(10, 11, 421, 35);
		}
		return lblNewLabel;
	}
	public JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("\uC544\uC774\uB514");
			lblNewLabel_1.setBounds(30, 95, 45, 21);
		}
		return lblNewLabel_1;
	}
	public JTextField getTextField() {
		if (textField == null) {
			textField = new JTextField();
			textField.setColumns(10);
			textField.setBounds(88, 95, 166, 20);
		}
		return textField;
	}
	public JLabel getLblNewLabel_1_1() {
		if (lblNewLabel_1_1 == null) {
			lblNewLabel_1_1 = new JLabel("\uC131\uBA85");
			lblNewLabel_1_1.setBounds(30, 118, 45, 21);
		}
		return lblNewLabel_1_1;
	}
	public JTextField getTextField_1() {
		if (textField_1 == null) {
			textField_1 = new JTextField();
			textField_1.setColumns(10);
			textField_1.setBounds(88, 118, 166, 20);
		}
		return textField_1;
	}
	public JLabel getLblNewLabel_1_2() {
		if (lblNewLabel_1_2 == null) {
			lblNewLabel_1_2 = new JLabel("\uC5F0\uB77D\uCC98");
			lblNewLabel_1_2.setBounds(30, 141, 45, 21);
		}
		return lblNewLabel_1_2;
	}
	public JTextField getTextField_2() {
		if (textField_2 == null) {
			textField_2 = new JTextField();
			textField_2.setColumns(10);
			textField_2.setBounds(88, 141, 166, 20);
		}
		return textField_2;
	}
	public JTextField getTextField_3() {
		if (textField_3 == null) {
			textField_3 = new JTextField();
			textField_3.setColumns(10);
			textField_3.setBounds(88, 164, 331, 20);
		}
		return textField_3;
	}
	public JLabel getLblNewLabel_1_2_1() {
		if (lblNewLabel_1_2_1 == null) {
			lblNewLabel_1_2_1 = new JLabel("\uC8FC\uC18C");
			lblNewLabel_1_2_1.setBounds(30, 164, 45, 21);
		}
		return lblNewLabel_1_2_1;
	}
	public JTextField getTextField_4() {
		if (textField_4 == null) {
			textField_4 = new JTextField();
			textField_4.setColumns(10);
			textField_4.setBounds(20, 58, 166, 20);
		}
		return textField_4;
	}
	public JSeparator getSeparator() {
		if (separator == null) {
			separator = new JSeparator();
			separator.setBounds(10, 85, 421, 2);
		}
		return separator;
	}
	public JButton getBtnNewButton_1() {
		if (btnNewButton_1 == null) {
			btnNewButton_1 = new JButton("\uC0AD\uC81C");
			btnNewButton_1.setBackground(SystemColor.menu);
			btnNewButton_1.setBounds(88, 195, 89, 23);
		}
		return btnNewButton_1;
	}
}

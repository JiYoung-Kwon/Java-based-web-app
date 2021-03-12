package ch11;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JSeparator;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class UpdatePanel extends JPanel {
	private JButton btnNewButton;
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private JTextField tfId;
	private JLabel lblNewLabel_1_1;
	private JTextField tfIrum;
	private JLabel lblNewLabel_1_2;
	private JTextField tfPhone;
	private JTextField tfAddress;
	private JLabel lblNewLabel_1_2_1;
	private JTextField tfFindStr;
	private JSeparator separator;
	private JButton btnNewButton_1;

	/**
	 * Create the panel.
	 */
	public UpdatePanel() {
		setLayout(null);
		add(getBtnNewButton());
		add(getLblNewLabel());
		add(getLblNewLabel_1());
		add(getTfId());
		add(getLblNewLabel_1_1());
		add(getTfIrum());
		add(getLblNewLabel_1_2());
		add(getTfPhone());
		add(getTfAddress());
		add(getLblNewLabel_1_2_1());
		add(getTfFindStr());
		add(getSeparator());
		add(getBtnNewButton_1());

	}

	public JButton getBtnNewButton() {
		if (btnNewButton == null) {
			btnNewButton = new JButton("\uAC80\uC0C9");
			btnNewButton.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					String mFindStr = tfFindStr.getText();
					MemberController mc = new MemberController();
					Member m  = mc.selectOne(mFindStr);
					if (m == null) {
						JOptionPane.showMessageDialog(UpdatePanel.this, "찾는 데이터가 없습니다.");
						}
					else {
						tfId.setText(m.getId());
						tfIrum.setText(m.getIrum());
						tfPhone.setText(m.getPhone());
						tfAddress.setText(m.getAddress());
					}

				}
			});
			btnNewButton.setBounds(196, 57, 89, 23);
		}
		return btnNewButton;
	}

	public JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("\uD68C\uC6D0\uC218\uC815");
			lblNewLabel.setOpaque(true);
			lblNewLabel.setFont(new Font("나눔고딕", Font.PLAIN, 20));
			lblNewLabel.setBackground(Color.ORANGE);
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

	public JTextField getTfId() {
		if (tfId == null) {
			tfId = new JTextField();
			tfId.setEditable(false);
			tfId.setColumns(10);
			tfId.setBounds(88, 95, 166, 20);
		}
		return tfId;
	}

	public JLabel getLblNewLabel_1_1() {
		if (lblNewLabel_1_1 == null) {
			lblNewLabel_1_1 = new JLabel("\uC131\uBA85");
			lblNewLabel_1_1.setBounds(30, 118, 45, 21);
		}
		return lblNewLabel_1_1;
	}

	public JTextField getTfIrum() {
		if (tfIrum == null) {
			tfIrum = new JTextField();
			tfIrum.setColumns(10);
			tfIrum.setBounds(88, 118, 166, 20);
		}
		return tfIrum;
	}

	public JLabel getLblNewLabel_1_2() {
		if (lblNewLabel_1_2 == null) {
			lblNewLabel_1_2 = new JLabel("\uC5F0\uB77D\uCC98");
			lblNewLabel_1_2.setBounds(30, 141, 45, 21);
		}
		return lblNewLabel_1_2;
	}

	public JTextField getTfPhone() {
		if (tfPhone == null) {
			tfPhone = new JTextField();
			tfPhone.setColumns(10);
			tfPhone.setBounds(88, 141, 166, 20);
		}
		return tfPhone;
	}

	public JTextField getTfAddress() {
		if (tfAddress == null) {
			tfAddress = new JTextField();
			tfAddress.setColumns(10);
			tfAddress.setBounds(88, 164, 331, 20);
		}
		return tfAddress;
	}

	public JLabel getLblNewLabel_1_2_1() {
		if (lblNewLabel_1_2_1 == null) {
			lblNewLabel_1_2_1 = new JLabel("\uC8FC\uC18C");
			lblNewLabel_1_2_1.setBounds(30, 164, 45, 21);
		}
		return lblNewLabel_1_2_1;
	}

	public JTextField getTfFindStr() {
		if (tfFindStr == null) {
			tfFindStr = new JTextField();
			tfFindStr.setColumns(10);
			tfFindStr.setBounds(20, 58, 166, 20);
		}
		return tfFindStr;
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
			btnNewButton_1 = new JButton("\uC218\uC815");
			btnNewButton_1.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					String id = tfId.getText();
					String irum = tfIrum.getText();
					String phone = tfPhone.getText();
					String address = tfAddress.getText();
					
					Member m = new Member(id,irum,phone,address);
					
					MemberController mc = new MemberController();
					String msg = mc.update(m);
					JOptionPane.showMessageDialog(UpdatePanel.this, msg);
				}
			});
			btnNewButton_1.setBounds(88, 195, 89, 23);
		}
		return btnNewButton_1;
	}
}

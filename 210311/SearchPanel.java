package ch11;

import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.JButton;
import javax.swing.JTable;
import java.awt.event.ActionListener;
import java.util.List;
import java.awt.event.ActionEvent;

public class SearchPanel extends JPanel {
	private JTextField tfFindStr;
	private JTable table;

	/**
	 * Create the panel.
	 */
	public SearchPanel() {
		setLayout(null);

		JLabel lblNewLabel = new JLabel("\uD68C\uC6D0\uC870\uD68C");
		lblNewLabel.setOpaque(true);
		lblNewLabel.setFont(new Font("나눔고딕", Font.PLAIN, 20));
		lblNewLabel.setBackground(Color.GREEN);
		lblNewLabel.setBounds(10, 11, 421, 35);
		add(lblNewLabel);

		tfFindStr = new JTextField();
		tfFindStr.setColumns(10);
		tfFindStr.setBounds(10, 58, 166, 20);
		add(tfFindStr);

		JButton btnNewButton = new JButton("\uAC80\uC0C9");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				MemberController mc = new MemberController();
				String findStr = tfFindStr.getText();
				List<Member> list = mc.search(findStr);

				DefaultTableModel model = (DefaultTableModel) table.getModel();
				model.setRowCount(0);
				for (int i = 0; i < list.size(); i++) {
					Member m = list.get(i);
					String[] data = { m.getId(), m.getIrum(), m.getPhone(), m.getAddress() };
					model.addRow(data);
				}
			}
		});
		btnNewButton.setBounds(186, 57, 89, 23);
		add(btnNewButton);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 89, 421, 200);
		add(scrollPane);

		table = new JTable();

		if (table == null) {
			String[] header = { "아이디", "성명", "연락처", "주소" };
			DefaultTableModel model = new DefaultTableModel(header, 10);
			table = new JTable(model);
		}

		scrollPane.setViewportView(table);

	}
}

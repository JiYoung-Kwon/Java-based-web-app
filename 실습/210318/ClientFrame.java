package ch16.objectStream;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.net.InetAddress;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JList;
import javax.swing.JTextPane;
import javax.swing.SwingConstants;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class ClientFrame extends JFrame {

	private JPanel contentPane;
	private JLabel lblNewLabel;
	private JTextField tfServerIP;
	private JLabel lblNewLabel_1;
	private JTextField tfPort;
	private JButton btnConnect;
	private JButton btnDisConnect;
	private JScrollPane scrollPane;
	private JList list;
	private JScrollPane scrollPane_1;
	private JTextPane textPane;
	private JLabel lblNewLabel_2;
	private JLabel lblNewLabel_3;
	private JTextField tfMsg;
	private JButton btnSend;
	private JLabel lblNewLabel_1_1;
	private JTextField tfId;
	
	/**
	 * Launch the application.
	 */

	ClientController cc;
	HTMLEditorKit editorKit;
	HTMLDocument document;
	StyleSheet styleSheet;
	
	DefaultListModel<String> listModel = new DefaultListModel<String>();
	

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClientFrame frame = new ClientFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public ClientFrame() {
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				disConnect();
			}
		});
		setTitle("\uCC44\uD305 \uD074\uB77C\uC774\uC5B8\uD2B8");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 665, 367);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		contentPane.add(getLblNewLabel());
		contentPane.add(getTfServerIP());
		contentPane.add(getLblNewLabel_1());
		contentPane.add(getTfPort());
		contentPane.add(getBtnConnect());
		contentPane.add(getBtnDisConnect());
		contentPane.add(getScrollPane());
		contentPane.add(getScrollPane_1());
		contentPane.add(getTfMsg());
		contentPane.add(getBtnSend());

		try {
			InetAddress ia = InetAddress.getLocalHost();
			tfServerIP.setText(ia.getHostAddress());

			editorKit = new HTMLEditorKit();
			styleSheet = new StyleSheet();

			styleSheet.addRule("div{padding:10px; width:100%; margin-bottom:10px;}");
			styleSheet.addRule(".left{color:#000000;border:1px solid #ffff00; background-color:#ffffaa;margin-right:140px;}");
			styleSheet.addRule(".right{color:#000000;border:1px solid #0000ff; background-color:#aaaaff;margin-left:140px;}");

			editorKit.setStyleSheet(styleSheet);
			document = (HTMLDocument) editorKit.createDefaultDocument();

			textPane.setEditorKit(editorKit);
			textPane.setDocument(document);
			contentPane.add(getLblNewLabel_1_1());
			contentPane.add(getTfId());

			// throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<font color ='red'> IP주소를 가져오는데 오류가 발생함</font>";
			Element root = document.getRootElements()[0];
			Element element = root.getElement(0);

			try {
				document.insertBeforeEnd(element, msg);
				textPane.setCaretPosition(document.getLength());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	public JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("IP");
			lblNewLabel.setBounds(10, 11, 46, 14);
		}
		return lblNewLabel;
	}

	public JTextField getTfServerIP() {
		if (tfServerIP == null) {
			tfServerIP = new JTextField();
			tfServerIP.setBounds(49, 8, 114, 20);
			tfServerIP.setColumns(10);
		}
		return tfServerIP;
	}

	public JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("PORT");
			lblNewLabel_1.setBounds(173, 11, 46, 14);
		}
		return lblNewLabel_1;
	}

	public JTextField getTfPort() {
		if (tfPort == null) {
			tfPort = new JTextField();
			tfPort.setText("9292");
			tfPort.setBounds(224, 8, 86, 20);
			tfPort.setColumns(10);
		}
		return tfPort;
	}

	public JButton getBtnConnect() {
		if (btnConnect == null) {
			btnConnect = new JButton("\uC811\uC18D");
			btnConnect.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					try {
						cc = new ClientController(ClientFrame.this);
						Thread t = new Thread(cc);
						t.start();
					} catch (Exception ex) {
						ex.printStackTrace();
					}
					
					btnConnect.setEnabled(false);
					btnDisConnect.setEnabled(true);
					btnSend.setEnabled(true);
				}
			});
			btnConnect.setBounds(451, 7, 89, 23);
		}
		return btnConnect;
	}

	public JButton getBtnDisConnect() {
		if (btnDisConnect == null) {
			btnDisConnect = new JButton("\uD574\uC81C");
			btnDisConnect.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					disConnect();
				}
			});
			btnDisConnect.setEnabled(false);
			btnDisConnect.setBounds(550, 7, 89, 23);
		}
		return btnDisConnect;
	}

	public void disConnect() {
		cc.disConnect();
		//2) 접속자 목록 모두 제거
		listModel.clear();
		getList().setModel(listModel);
		
		//3) 버튼 상태 처리
		btnConnect.setEnabled(true);
		btnDisConnect.setEnabled(false);
		btnSend.setEnabled(false);
	}
	
	public JScrollPane getScrollPane() {
		if (scrollPane == null) {
			scrollPane = new JScrollPane();
			scrollPane.setBounds(10, 36, 153, 253);
			scrollPane.setViewportView(getList());
			scrollPane.setColumnHeaderView(getLblNewLabel_3());
		}
		return scrollPane;
	}

	public JList getList() {
		if (list == null) {
			list = new JList();
		}
		return list;
	}

	public JScrollPane getScrollPane_1() {
		if (scrollPane_1 == null) {
			scrollPane_1 = new JScrollPane();
			scrollPane_1.setBounds(173, 36, 466, 253);
			scrollPane_1.setViewportView(getTextPane());
			scrollPane_1.setColumnHeaderView(getLblNewLabel_2());
		}
		return scrollPane_1;
	}

	public JTextPane getTextPane() {
		if (textPane == null) {
			textPane = new JTextPane();
			textPane.setContentType("text/html");
		}
		return textPane;
	}

	public JLabel getLblNewLabel_2() {
		if (lblNewLabel_2 == null) {
			lblNewLabel_2 = new JLabel("\uBA54\uC138\uC9C0");
			lblNewLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblNewLabel_2;
	}

	public JLabel getLblNewLabel_3() {
		if (lblNewLabel_3 == null) {
			lblNewLabel_3 = new JLabel("\uC811\uC18D\uC790");
			lblNewLabel_3.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblNewLabel_3;
	}

	public JTextField getTfMsg() {
		if (tfMsg == null) {
			tfMsg = new JTextField();
			tfMsg.setBounds(10, 298, 530, 20);
			tfMsg.setColumns(10);
		}
		return tfMsg;
	}

	public JButton getBtnSend() {
		if (btnSend == null) {
			btnSend = new JButton("\uC804\uC1A1");
			btnSend.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					
					String msg =  tfMsg.getText();
					Data data = new Data();
					data.setId(tfId.getText());
					data.setCommand("msg");
					data.setMsg(msg);			

					cc.sendMsg(data);
				}
			});
			btnSend.setBounds(550, 297, 89, 23);
		}
		return btnSend;
	}
	public JLabel getLblNewLabel_1_1() {
		if (lblNewLabel_1_1 == null) {
			lblNewLabel_1_1 = new JLabel("ID");
			lblNewLabel_1_1.setBounds(320, 11, 29, 14);
		}
		return lblNewLabel_1_1;
	}
	public JTextField getTfId() {
		if (tfId == null) {
			tfId = new JTextField();
			tfId.setText("\uAD8C\uC9C0\uC601");
			tfId.setColumns(10);
			tfId.setBounds(359, 8, 86, 20);
		}
		return tfId;
	}
}

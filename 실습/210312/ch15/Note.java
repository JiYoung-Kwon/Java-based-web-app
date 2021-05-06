package ch15;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JMenu;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.awt.event.ActionEvent;

public class Note extends JFrame {

	private JPanel contentPane;
	private JMenuBar menuBar;
	private JMenu mnNewMenu;
	private JMenuItem mntmNewMenuItem;
	private JMenuItem mntmNewMenuItem_1;
	private JMenuItem mntmNewMenuItem_2;
	private JScrollPane scrollPane;
	private JTextArea textArea;

	/**
	 * Launch the application.
	 */
	String fileName;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Note frame = new Note();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public void save() {
		try {
			FileWriter fw = new FileWriter(fileName);
			fw.write(textArea.getText());
			fw.close();

		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(Note.this, "저장중 오류 발생");
		}
	}
	
	public void load() {
		try {
			JFileChooser fc = new JFileChooser(fileName);
			int flag = fc.showOpenDialog(Note.this);
			if(flag == JFileChooser.APPROVE_OPTION) {
				File f = fc.getSelectedFile();
				fileName = f.getName();
				
				setTitle("Note [file: " + fileName + "]");
				
				FileReader fr = new FileReader(fileName);
				char[] buff = new char[(int)f.length()];
				fr.read(buff);

				textArea.setText(new String(buff));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(Note.this, "파일 읽기중 오류 발생");
		}
	}

	/**
	 * Create the frame.
	 */
	public Note() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		setJMenuBar(getMenuBar_1());
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		contentPane.add(getScrollPane(), BorderLayout.CENTER);
	}

	public JMenuBar getMenuBar_1() {
		if (menuBar == null) {
			menuBar = new JMenuBar();
			menuBar.add(getMnNewMenu());
		}
		return menuBar;
	}

	public JMenu getMnNewMenu() {
		if (mnNewMenu == null) {
			mnNewMenu = new JMenu("File");
			mnNewMenu.add(getMntmNewMenuItem());
			mnNewMenu.add(getMntmNewMenuItem_1());
			mnNewMenu.add(getMntmNewMenuItem_2());
		}
		return mnNewMenu;
	}

	public JMenuItem getMntmNewMenuItem() {
		if (mntmNewMenuItem == null) {
			mntmNewMenuItem = new JMenuItem("\uC0C8\uAE00");
			mntmNewMenuItem.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {

				}
			});
		}
		return mntmNewMenuItem;
	}

	public JMenuItem getMntmNewMenuItem_1() {
		if (mntmNewMenuItem_1 == null) {
			mntmNewMenuItem_1 = new JMenuItem("\uC77D\uAE30");
			mntmNewMenuItem_1.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					load();
				}
			});
		}
		return mntmNewMenuItem_1;
	}

	public JMenuItem getMntmNewMenuItem_2() {
		if (mntmNewMenuItem_2 == null) {
			mntmNewMenuItem_2 = new JMenuItem("\uC800\uC7A5");
			mntmNewMenuItem_2.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {

					if (fileName == null) {
						JFileChooser fc = new JFileChooser(fileName);
						int flag = fc.showSaveDialog(Note.this);
						if (flag == JFileChooser.APPROVE_OPTION) {
							fileName = fc.getSelectedFile().getName();
							setTitle("Note [file" + fileName + "]");
							// 저장메서드 호출
							save();
						}
					} else {
							save();
					}
				}
			});
		}
		return mntmNewMenuItem_2;
	}

	public JScrollPane getScrollPane() {
		if (scrollPane == null) {
			scrollPane = new JScrollPane();
			scrollPane.setViewportView(getTextArea());
		}
		return scrollPane;
	}

	public JTextArea getTextArea() {
		if (textArea == null) {
			textArea = new JTextArea();
		}
		return textArea;
	}

}

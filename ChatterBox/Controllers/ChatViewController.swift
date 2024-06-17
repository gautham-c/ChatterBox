//
//  ChatViewController.swift
//  ChatterBox
//
//  Created by Gautham C on 6/13/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = []
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: Constants.nibIdentifier )
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(Constants.Fstore.collectionName).order(by: Constants.Fstore.date).addSnapshotListener { querySnapshot, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    if let documents = querySnapshot?.documents {
                        self.messages = []
                        for data in documents {
                            if let messageSender = data[Constants.Fstore.sender] as? String, let messageBody = data[Constants.Fstore.body] as? String{
                                self.messages.append(Message(sender: messageSender, body: messageBody))
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        if self.messages.count != 0 {
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                    }
                }
            }
        }

    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(Constants.Fstore.collectionName).addDocument(data: [
                Constants.Fstore.sender : messageSender,
                Constants.Fstore.body : messageBody,
                Constants.Fstore.date : Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print(e)
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
           do { try Auth.auth().signOut()
               navigationController?.popToRootViewController(animated: false)
           } catch let signOutError as NSError {
             print("Error signing out: %@", signOutError)
           }
       }
    
    
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let message = messages[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.nibIdentifier, for: indexPath) as! MessageCellTableViewCell
            
            if message.sender == Auth.auth().currentUser?.email {
                cell.receiverImageView.isHidden = true
                cell.senderImageView.isHidden = false
                cell.messageBubble.backgroundColor = UIColor(named: Constants.Colors.green)
                cell.messageText.textColor = UIColor(named: Constants.Colors.whiteGreen)
            } else {
                cell.receiverImageView.isHidden = false
                cell.senderImageView.isHidden = true
                cell.messageBubble.backgroundColor = UIColor(named: Constants.Colors.slightyDark)
                cell.messageText.textColor = UIColor(named: Constants.Colors.green)
            }
            
            cell.messageText.text = message.body
            return cell
        }
    
    
}
